def is_isogram(string):

    done = []
    for letter in string.lower():
        if letter.isalpha():
            if letter in done:
                return False
            done.append(letter)
    return True
