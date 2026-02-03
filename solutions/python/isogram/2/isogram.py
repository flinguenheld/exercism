def is_isogram(string):

    string = [letter for letter in string.lower() if letter.isalpha()]
    return len(string) == len(set(string))

    # done = []
    # for letter in string.lower():
    #     if letter.isalpha():
    #         if letter in done:
    #             return False
    #         done.append(letter)
    # return True
