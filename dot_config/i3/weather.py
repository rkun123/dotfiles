import sys
import requests
import json

if len(sys.argv) >= 2:
    city_name = sys.argv[1] # 主要な都市名はいけるっぽい。
else:
    city_name = "Iizuka"

API_KEY = "d0271c88e1f46cdd463057395b5e8b18" # xxxに自分のAPI Keyを入力。
api = "http://api.openweathermap.org/data/2.5/weather?units=metric&q={city}&APPID={key}"

url = api.format(city = city_name, key = API_KEY)
response = requests.get(url)

if response.status_code == 200:
    data = response.json()
    msg = "Weather of %s\nStatus: %s\nMin:    %s\nMax:    %s" % (data["name"], data["weather"][0]["main"], data["main"]["temp_min"], data["main"]["temp_max"])
    print(msg)
else:
    print("Error!!")
