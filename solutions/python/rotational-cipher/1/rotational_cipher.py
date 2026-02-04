
def get_letter(letter, rotation):

    if letter.isalpha():

        value = ord(letter) + rotation % 26

        if letter.islower() and value > ord('z'):
            value = ord('a') + value - ord('z') - 1
        if letter.isupper() and value > ord('Z'):
            value = ord('A') + value - ord('Z') - 1
        return chr(value)

    return letter

def rotate(text, key):
    return "".join([get_letter(letter, key) for letter in text])


if __name__ == "__main__":
    # rotate("cool", 26);
    rotate("The quick brown fox jumps over the lazy dog.", 13);
    # rotate("T", 13);
