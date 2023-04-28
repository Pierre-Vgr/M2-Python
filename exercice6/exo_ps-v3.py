import psutil
import time

programs_to_kill = ['Teams.exe', 'chrome.exe', 'firefox.exe']

while True:
    for proc in psutil.process_iter():
        if proc.name in programs_to_kill:
            print(f"Killing {proc.name}")
            proc.kill()
    time.sleep(5)