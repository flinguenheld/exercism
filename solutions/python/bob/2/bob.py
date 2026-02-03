def response(hey_bob):

    hey_bob = str(hey_bob).rstrip()

    is_upper = hey_bob.isupper()
    is_quest = hey_bob.endswith("?")

    if hey_bob == "":
        return "Fine. Be that way!"

    if is_upper:
        if is_quest:
            return "Calm down, I know what I'm doing!"
        return "Whoa, chill out!"

    if is_quest:
        return "Sure."

    return "Whatever."
