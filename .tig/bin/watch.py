import os
import sys
import subprocess
import shlex
import time
from watchdog.observers import Observer # type: ignore
from watchdog.events import FileSystemEventHandler # type: ignore
import re
DECALAGE=0.05
def escape_to_regex(pattern):
    # Échapper les caractères spéciaux de regex
    escaped_pattern = re.escape(pattern)
    
    # Remplacer l'échappement du caractère '*' par '.*'
    final_pattern = escaped_pattern.replace(r'\*', '.*')
    
    return final_pattern
class CommandHandler(FileSystemEventHandler):
    lastime=0
    last_src_path=""
    def __init__(self, command, extensions):
        self.command = command
        self.extensions = extensions
    
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
                isMacth=any( re.match(escape_to_regex(el),event.src_path) for el in self.extensions)

            if isMacth:
                command=self.command.replace("@FILENAME",event.src_path).replace("@TYPE",event.event_type)
                os.system(command)

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
            time.sleep(1)
    except KeyboardInterrupt:
        observer.stop()
    observer.join()
