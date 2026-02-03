"""Functions for creating, transforming, and adding prefixes to strings."""

def trim_dot(word):
    if word[-1] == ".":
        return word[:-1]
    return word


def add_prefix_un(word):
    """Take the given word and add the 'un' prefix.

    :param word: str - containing the root word.
    :return: str - of root word prepended with 'un'.
    """

    if word != "un":
        return "un" + trim_dot(word)
    return word


def make_word_groups(vocab_words):
    """Transform a list containing a prefix and words into a string with the prefix followed by the words with prefix prepended.

    :param vocab_words: list - of vocabulary words with prefix in first index.
    :return: str - of prefix followed by vocabulary words with
            prefix applied.

    This function takes a `vocab_words` list and returns a string
    with the prefix and the words with prefix applied, separated
     by ' :: '.

    For example: list('en', 'close', 'joy', 'lighten'),
    produces the following string: 'en :: enclose :: enjoy :: enlighten'.
    """

    # return f" :: {vocab_words[0]}".join(vocab_words)
    # return " :: {}".format(vocab_words[0]).join(vocab_words)
    separator = " :: " + vocab_words[0]
    return separator.join(vocab_words)


def remove_suffix_ness(word):
    """Remove the suffix from the word while keeping spelling in mind.

    :param word: str - of word to remove suffix from.
    :return: str - of word with suffix removed & spelling adjusted.

    For example: "heaviness" becomes "heavy", but "sadness" becomes "sad".
    """

    removed = word[:-4]
    if removed[-1] == "i":
        removed = removed[:-1] + "y"

    return removed

def adjective_to_verb(sentence, index):
    """Change the adjective within the sentence to a verb.

    :param sentence: str - that uses the word in sentence.
    :param index: int - index of the word to remove and transform.
    :return: str - word that changes the extracted adjective to a verb.

    For example, ("It got dark as the sun set.", 2) becomes "darken".
    """

    return trim_dot(sentence.split()[index]) + "en"


if __name__ == "__main__":
    list = ["hello", "to", "you"]
    # print(f"{remove_suffix_ness('heaviness')}")
    # print(f"{make_word_groups(['en', 'close', 'joy', 'lighten'])}")
