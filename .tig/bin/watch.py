import os
import sys
import time
from watchdog.observers import Observer # type: ignore
from watchdog.events import FileSystemEventHandler # type: ignore

DECALAGE=0

class CommandHandler(FileSystemEventHandler):
    lastime=0
    def __init__(self, command, extensions):
        self.command = command
        self.extensions = extensions

    def on_modified(self, event):
        currtime=time.time()
        DELTA=currtime - self.lastime
        if int(DELTA) > DECALAGE:
            self.lastime=currtime
            if any(event.src_path.endswith(ext) for ext in self.extensions):
                os.system(self.command)

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: python watch.py 'your_command' '.ext1,.ext2,...' ")
        sys.exit(1)

    command = sys.argv[1]
    extensions = sys.argv[2].split(',')
    path = "."  # Surveille le répertoire courant   
    event_handler = CommandHandler(command, extensions)
    observer = Observer()
    observer.schedule(event_handler, path, recursive=True)
    # observer.patterns(sys.argv[2])
    print(dir(observer))
    observer.start()
    print(f"Watching for changes in {path}, will execute '{command}' on changes...")

    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        observer.stop()
    observer.join()
