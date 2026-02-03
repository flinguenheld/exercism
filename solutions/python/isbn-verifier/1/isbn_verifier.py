def is_valid(isbn):

    total = 0

    index = 10
    for letter in isbn:
        if letter == "-":
            continue
        if letter == "X":
            if index != 1:
                return False
            total += 10
        elif not letter.isdigit():
            return False
        else:
            total += int(letter) * index

        index -= 1

    return index == 0 and total % 11 == 0
