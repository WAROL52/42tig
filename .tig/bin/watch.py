import os
import sys
import time
from watchdog.observers import Observer # type: ignore
from watchdog.events import FileSystemEventHandler # type: ignore

DECALAGE=0

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
            extensions=[el for el in self.extensions if el.startswith(".") and not el.startswith("./")]
            files=[el for el in self.extensions if True]
            if event.src_path in files or any(event.src_path.endswith(ext) for ext in extensions):
                os.system(self.command.replace("@FILENAME",event.src_path).replace("@TYPE",event.event_type))

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
    extensions = sys.argv[2].split(' ')
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
