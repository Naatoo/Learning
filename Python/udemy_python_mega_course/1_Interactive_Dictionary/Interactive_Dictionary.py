import json
from difflib import get_close_matches as get_cm

data = json.load(open("data.json"))


def translate(w):
    if w in data:
        return data[w]
    if w.lower in data:
        return data[w.lower()]
    elif len(get_cm(w, data.keys())) != 0:
        possible_word = get_cm(w, data.keys())[0]
        print("Did you mean {} instead?".format(possible_word))
        while True:
            choice = input("Enter 'y' if yes or 'n' if no: ")
            if choice in ("y", "n"):
                break
        if choice == "y":
            return data[possible_word]
    else:
        return "There is no such word in the dictionary."


word = input("Type the word: ")
if type(translate(word)) == list:
    for id, definition in enumerate(translate(word)):
        print(id + 1, end="")
        print(". ", definition)
