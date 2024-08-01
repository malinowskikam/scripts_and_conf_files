import time
import pyautogui as pag

dir = 1

while True:
    time.sleep(5)
    pag.move(20 * dir, 0)
    dir *= -1
