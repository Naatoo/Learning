from time import sleep
from datetime import datetime as dt

hosts_temp = r"C:\Users\Natoo\Python\Learning\udemy_python_mega_course\3_Website_Blocker\hosts"
hosts_path = r"C:\Windows\System32\drivers\etc\hosts"
redirect = "127.0.0.1"
website_list = ["www.facebook.com", "facebook.com"]

while True:
    if dt(dt.now().year, dt.now().month, dt.now().day, 2) < dt.now() <\
            dt(dt.now().year, dt.now().month, dt.now().day, 23):
        print("a")
        with open(hosts_path, "r+") as file:
            content = file.read()
            for website in website_list:
                if website in content:
                    pass
                else:
                    file.write(redirect + " " + website + "\n")
    else:
        with open(hosts_path, "r+") as file:
            content = file.readlines()
            file.seek(0)
            for line in content:
                if not any(website in line for website in website_list):
                    file.write(line)
            file.truncate()
        print("sd")
        break
    sleep(5)
print(dt.now())
