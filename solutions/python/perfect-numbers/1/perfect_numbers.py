def get_aliquot_sum(number):
    sum = 0
    for i in range(1, int((number + 2) / 2 )):
        if number % i == 0:
            sum += i

    return sum


def classify(number):
    """ A perfect number equals the sum of its positive divisors.

    :param number: int a positive integer
    :return: str the classification of the input integer
    """
    if number <= 0:
        raise ValueError("Classification is only possible for positive integers.")
    sum = get_aliquot_sum(number)

    if sum == number:
        return "perfect"
    if sum < number:
        return "deficient"
    return "abundant"
