import requests


url = 'https://raw.githubusercontent.com/okkyl/HARDWARE-INFO/main/main.py'
r = requests.get(url, allow_redirects=True)

open('main.py', 'wb').write(r.content)