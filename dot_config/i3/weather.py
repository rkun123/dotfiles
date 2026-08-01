import os
import sys
import requests
import json

if len(sys.argv) >= 2:
    city_name = sys.argv[1] # 主要な都市名はいけるっぽい。
else:
    city_name = "Iizuka"

API_KEY = os.environ.get("OWM_API_KEY")
if not API_KEY:
    print("Error: OWM_API_KEY is not set")
    sys.exit(1)
api = "http://api.openweathermap.org/data/2.5/weather?units=metric&q={city}&APPID={key}"

url = api.format(city = city_name, key = API_KEY)
response = requests.get(url)

if response.status_code == 200:
    data = response.json()
    msg = "Weather of %s\nStatus: %s\nMin:    %s\nMax:    %s" % (data["name"], data["weather"][0]["main"], data["main"]["temp_min"], data["main"]["temp_max"])
    print(msg)
else:
    print("Error!!")
