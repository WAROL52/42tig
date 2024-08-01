import threading
import time

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
@debounce(1.0)  # 1 seconde de délai
def print_message(message):
    print(f"Message: {message}")

# Appels multiples pour démontrer le debounce
print_message("Première")
time.sleep(0.5)
print_message("Deuxième")
time.sleep(1.5)
print_message("Troisième")
