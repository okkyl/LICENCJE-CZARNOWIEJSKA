import requests


url = 'https://raw.githubusercontent.com/okkyl/LICENCJE-CZARNOWIEJSKA/main/LICENCJE.BAT'
r = requests.get(url, allow_redirects=True)

open('LICENCJE.BAT', 'wb').write(r.content)
