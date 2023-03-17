#!/usr/bin/env python

import os
import threading

from PIL import Image, ImageDraw, ImageFont
from StreamDeck.DeviceManager import DeviceManager
from StreamDeck.ImageHelpers import PILHelper

ASSETS_PATH = "/home/jsw/.local/bin/streamdeckAssets/"
FONT = ASSETS_PATH + "Roboto-Regular.ttf"

pages = {
    "main": [
        {
            "key": 0,
            "before": {
                "text": "hi",
            },
            "command": {
                "type": "extern",
                "command": "echo hi"
            },
        },
    ]
}

page = "main"

def render_key_image(deck, icon_filename, label_text):
    icon = Image.open(icon_filename if icon_filename else ASSETS_PATH + "Empty.png")
    image = PILHelper.create_scaled_image(deck, icon, margins=[0, 0, 20, 0])

    if label_text:
        draw = ImageDraw.Draw(image)
        font = ImageFont.truetype(FONT, 14)
        if icon_filename != "":
            draw.text((image.width / 2, image.height - 5), text=label_text, font=font, anchor="ms", fill="white")
        else:
            draw.text((image.width / 2, image.height / 2), text=label_text, font=font, anchor="ms", fill="white")

    return PILHelper.to_native_format(deck, image)


def update_key_image(deck, key, state):
    keyNum = key
    if page in pages and len(pages[page]) - 1 >= key and "before" in pages[page][key]:
        key = pages[page][key]
        key = key["after"] if state and "after" in key else key["before"]

        img = ASSETS_PATH + key["img"] if "img" in key else ""
        text = key["text"] if "text" in key else ""

        image = render_key_image(deck, img, text)
    else:
        image = render_key_image(deck, "", "")


    with deck:
        deck.set_key_image(keyNum, image)


def key_change_callback(deck, key, state):
    print("Deck {} Key {} = {}".format(deck.id(), key, state), flush=True)
    update_key_image(deck, key, state)
    
    if page in pages and len(pages[page]) - 1 >= key and "command" in pages[page][key]:
        command = pages[page][key]["command"]

        if command["type"] == "extern":
            os.system(command["command"])

if __name__ == "__main__":
    streamdecks = DeviceManager().enumerate()

    print("Found {} Stream Deck(s).\n".format(len(streamdecks)))

    for index, deck in enumerate(streamdecks):
        deck.open()
        deck.reset()
        deck.set_brightness(30)

        for key in range(deck.key_count()):
            update_key_image(deck, key, False)

        deck.set_key_callback(key_change_callback)

        for t in threading.enumerate():
            try:
                t.join()
            except RuntimeError:
                pass
