import requests
from flask import Flask
from flask import request
import json
from terra.base_client import Terra
import datetime

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


url = "https://api.tryterra.co/v2/auth/generateWidgetSession"

payload = {
    "reference_id": "15787f41-e44f-4e8f-a3f8-71c47120547d",
    "providers": "GOOGLE","APPLE",
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

response = requests.post(url, headers=headers)
print(response.json())


if (response.json()['status'] == "success"):
    print('success')
    user_id = get_user()
    main(user_id)
    pass # Continue to App
else:
    print('fail')
    pass # Stop
