def is_pangram(sentence):

    letters = set(l for l in sentence.lower() if l.isalpha())
    return len(letters) == 26
    
    # letters = set()
    # for l in sentence:
    #     if l.isalpha():
    #         letters.add(l.lower())
    # return len(letters) == 26
