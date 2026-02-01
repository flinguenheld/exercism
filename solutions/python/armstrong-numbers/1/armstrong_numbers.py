def nb_of_digit(number):
    if number < 10:
        return 1
    return 1 + nb_of_digit(number / 10)

def raise_until_zero(number, exponent):
    if number <= 0:
        return 0
    return (number % 10) ** exponent + raise_until_zero(int(number / 10),
                                                        exponent)

def is_armstrong_number(number):
    return number == raise_until_zero(number, nb_of_digit(number))
