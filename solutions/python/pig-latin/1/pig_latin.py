VOWELS = ("a", "e", "i", "o", "u")

def translate_word(text):
    translated = ""

    if text.startswith(("xr", "yt")) or text.startswith(VOWELS):
        translated = text + "ay"

    elif text.startswith("y"):
        translated = f"{text[1:]}yay"

    elif text[0] not in VOWELS:
        secure = 0;
        while text[0] not in VOWELS and text[0] != "y":
            text = f"{text[1:]}{text[:1]}"
            secure += 1
            if secure == len(text):
                break

        if text[0] == "u" and text[-1] == "q":
            translated = f"{text[1:]}uay"

        else:
            translated = f"{text}ay"

    return translated


def translate(text):

    translated = ""
    for w in text.split():
        if translated:
            translated += " "
        translated += translate_word(w)

    return translated


if __name__ == "__main__":
    print(f"{translate('quick')}\n");
    print(f"{translate('square')}\n");
    print(f"{translate('my')}\n");
    print(f"{translate('rhythm')}\n");
    print(f"{translate('yellow')}\n");
