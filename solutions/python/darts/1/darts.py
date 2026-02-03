import math

def score(x, y):

    length = math.sqrt(x**2 + y**2)

    if length > 10:
        return 0
    if length > 5:
        return 1
    if length > 1:
        return 5
    return 10
