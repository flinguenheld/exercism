
def get_letter(letter, rotation):

    if letter.isalpha():

        if letter.islower():
            return chr(ord('a') + (ord(letter) - ord('a') + rotation) % 26)

        if letter.isupper():
            return chr(ord('A') + (ord(letter) - ord('A') + rotation) % 26)

    return letter

def rotate(text, key):
    return "".join([get_letter(letter, key) for letter in text])


if __name__ == "__main__":
    # rotate("cool", 26);
    print(f"{rotate('The quick brown fox jumps over the lazy dog.', 13)}")
    # rotate("T", 13);
