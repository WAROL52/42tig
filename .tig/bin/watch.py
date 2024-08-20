import os
import sys
import glob
import subprocess
import threading
import time
from watchdog.observers import Observer # type: ignore
from watchdog.events import FileSystemEventHandler # type: ignore
import re
DECALAGE=0.0125
COLOR_RED="\033[91;1m"
COLOR_BLUE="\033[94;1m"
COLOR_YELLO="\033[93;1m"
COLOR_GREEN="\033[92;1m"
COLOR_NORMAL="\033[0m"


def match(pattern,find):
    matches = []
    for ext in pattern.split(" "):
        matches.extend(glob.glob(f"**/{ext}", recursive=True))
    return find in matches

def debounce(wait):
    def decorator(fn):
        timer = None
        
        def debounced(*args, **kwargs):
            nonlocal timer
            if timer is not None:
                timer.cancel()
            timer = threading.Timer(wait, lambda: fn(*args, **kwargs))
            timer.start()
        
        return debounced
    return decorator

# Exemple d'utilisation
@debounce(1)  # 1 seconde de délai
def excec(command,self):
    self.print("Exécution de la commande...",COLOR_GREEN)
    self.execCount+=1
    time.sleep(1)
    self.oldProcess = subprocess.Popen(command, shell=True)


class CommandHandler(FileSystemEventHandler):
    lastime=0
    execCount=0
    last_src_path=""
    oldProcess=None
    def __init__(self, command, extensions):
        self.command = command
        self.extensions = extensions
        excec(command,self)
    
    def print(self,msg,color=COLOR_NORMAL,desc=""):
        print(f"{COLOR_BLUE}\033[7m![{self.execCount}]({desc}): {COLOR_NORMAL} {color}{msg}{COLOR_NORMAL}")

    def terminate(self):
        if self.oldProcess:
            self.print("terminer le processus.....",COLOR_RED)
            self.oldProcess.kill()
            self.oldProcess.terminate()
            self.oldProcess.wait()
            self.oldProcess = None

    def run(self,event):
        if event.is_directory: return
        currtime=time.time()
        DELTA=currtime - self.lastime
        if self.last_src_path != event.src_path or int(DELTA) > DECALAGE :
            self.lastime=currtime
            self.last_src_path=event.src_path
            isMacth=not len(self.extensions)
            if not isMacth:isMacth=event.src_path in self.extensions
            if not isMacth:
                listExt=[el for el in self.extensions if el.startswith(".") and not el.startswith("./")]
                isMacth=any(event.src_path.endswith(ext) for ext in listExt)

            if not isMacth:
                isMacth=any( match(patern,event.src_path) for patern in self.extensions)

            if isMacth:
                command=self.command.replace("@FILENAME",event.src_path).replace("@TYPE",event.event_type)
                self.print(f"{event.src_path} {event.event_type}",COLOR_YELLO)
                self.terminate()
                excec(command,self)

    def on_modified(self, event):
        self.run(event)

    def on_created(self, event):
        self.run(event)

    def on_deleted(self, event):
        self.run(event)

    def on_moved(self, event):
        self.run(event)

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: python watch.py 'your_command' '.ext1 .ext2,...' ")
        sys.exit(1)

    command = sys.argv[1]
    extensions = [a for a in sys.argv[2].split(' ') if a]
    if "*" in extensions: extensions=[]
    print(command)
    print(extensions)
    path = "."  # Surveille le répertoire courant   
    event_handler = CommandHandler(command, extensions)
    observer = Observer()
    observer.schedule(event_handler, path, recursive=True)
    observer.start()
    try:
        while True:
            time.sleep(0.1)
    except KeyboardInterrupt:
        event_handler.terminate()
        observer.stop()
    observer.join()
