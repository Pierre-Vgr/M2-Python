import psutil

for proc in psutil.process_iter():
    if proc.name() == "Teams.exe":
        proc.kill()
        print("Le processus Teams.exe a été tué.")
