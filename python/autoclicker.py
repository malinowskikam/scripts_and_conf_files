import time
import pynput.keyboard as k
import pynput.mouse as m


def on_key_release(key):
    global stopped
    if hasattr(key, 'char') and key.char == 'z':
        stopped = not stopped

key_listener = k.Listener(on_release=on_key_release)
key_listener.start()
mouse_controller = m.Controller()

stopped = True

while True:
    if stopped:
        time.sleep(1)
    else:
        mouse_controller.click(m.Button.left)

