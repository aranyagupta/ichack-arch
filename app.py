from flask import Flask, request, jsonify
import requests
import time
import json
from terra.base_client import Terra
import datetime

BASE_URL = "http://api.openweathermap.org/data/2.5/air_pollution"
APP_ID = "c17feee97b06376634c2638882d3e3ad"
LOST_TIME = 0.227 # minutes of life lost per minute spent in 1ug of pm2.5 above 5ug
stop = False
url = "https://api.tryterra.co/v2/auth/generateWidgetSession"

payload = {
    "reference_id": "15787f41-e44f-4e8f-a3f8-71c47120547d",
    "providers": "GOOGLE",
    "language": "en",
    "auth_success_redirect_url": "https://www.bing.com", # TODO: replace with our app link
    "auth_failure_redirect_url": "https://www.google.com"
}
headers = {
    "accept": "application/json",
    "dev-id": "ichack-arch-dev-nXwIaAtMAC",
    "content-type": "application/json",
    "x-api-key": "e7c36c8624c0b2d1f828208d70330ab0aa44e828b8f806d4be21940010470af1"
}



'''
# For initial Authentication (Get Browser Link)
response = requests.post(url, json=payload, headers=headers)
response.raise_for_status()
url = response.json()["url"]
print(url)
'''



def airQuality(lat, lon):
    url = BASE_URL
    params = {
        "lat" : lat,
        "lon" : lon,
        "appid" : APP_ID
    }
    try:
        response = requests.get(url, params=params)
        not_allowed = [x for x in range(400,600)]
        if response.status_code in not_allowed:
            return -1
    except:
        return -1
    return response.json()

# finds aggregated lost time by checking location every minute
def aggregate(lat, lon):
    global stop
    travel = []
    while not stop:
        print(stop)
        pm2_5 = airQuality(lat, lon)['list'][0]['components']['pm2_5']
        if pm2_5 != -1:
            travel.append(pm2_5)
            time.sleep(0.5)
    travel = [x-5 for x in travel]
    totalTimeLost = 0 
    for i in travel:
        if i>0:
            totalTimeLost += i*LOST_TIME
    return totalTimeLost


def get_user():
    #print("GET USER")
    url = "https://api.tryterra.co/v2/subscriptions"
    response = requests.get(url, headers=headers)
    #print(response.json())
    user_id = response.json()['users'][0]['user_id']
    #print("USER_ID == " + user_id)
    return user_id

def main(user):
    start_date = datetime.datetime.now() - datetime.timedelta(days=1)
    end_date = datetime.datetime.now()
    #print(user)
    client = Terra(api_key='e7c36c8624c0b2d1f828208d70330ab0aa44e828b8f806d4be21940010470af1', dev_id='ichack-arch-dev-nXwIaAtMAC', secret='766d3ef82e9ee6cdf1cc4c03e82fda46fb6a4abc052c42ae');
    url = "https://api.tryterra.co/v2/activity?user_id={}&start_date={}&end_date={}&to_webhook=false&with_samples=true" .format(user, start_date, end_date)

    print("REQUESTING DATA")
    response = requests.get(url, headers=headers)
    print(response.text)
    return response

app = Flask(__name__)

@app.route('/', methods=["GET", "POST"])
def hello_world():
    global stop
    response = requests.post(url, headers=headers)
    print(response.json())

    if (response.json()['status'] == "success"):
        print('success')
        user_id = get_user()
        resp = main(user_id)
        try:
            time_earned = resp.json()["data"][0]["distance_data"]["summary"]["steps"]/1000
        except TypeError:
            time_earned = 2
        a = aggregate(51.5072, 0.1276)
        print(stop)
        return jsonify({"lost_time":a, "gained_time":time_earned})

@app.route('/stop', methods=["GET", "POST"])
def get_stop():
    global stop
    if request.get_json()["stop"] == "true":
        stop = True
        print(stop)
        return jsonify({"done":1})
    else:
        stop = False
        print(stop)
        return jsonify({"done":0})


if __name__ == '__main__':
    app.run()