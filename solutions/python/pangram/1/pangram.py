def is_pangram(sentence):
    letters = set()
    for l in sentence:
        if l.isalpha():
            letters.add(l.lower())
    return len(letters) == 26
