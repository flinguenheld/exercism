"""Functions used in preparing Guido's gorgeous lasagna.

Learn about Guido, the creator of the Python language:
https://en.wikipedia.org/wiki/Guido_van_Rossum

This is a module docstring, used to describe the functionality
of a module and its functions and/or classes.
"""

EXPECTED_BAKE_TIME = 40
PREPARATION_TIME = 2

def bake_time_remaining(elapsed_bake_time):
    """Calculate the bake time remaining.

    :param elapsed_bake_time: int - baking time already elapsed.
    :return: int - remaining bake time (in minutes) derived from 'EXPECTED_BAKE_TIME'.

    Function that takes the actual minutes the lasagna has been in the oven as
    an argument and returns how many minutes the lasagna still needs to bake
    based on the `EXPECTED_BAKE_TIME`.
    """
    return EXPECTED_BAKE_TIME - elapsed_bake_time

def elapsed_time_in_minutes(nb_layers, elapsed_bake_time):
    """ Calculte the elapsed cooking time.
    :param nb_layers: int - amount of layers
    :param elapsed_bake_time: int - cooking time already spent
    :return: int - the total amount of time preparing + cooking
    
    """
    return preparation_time_in_minutes(nb_layers) + elapsed_bake_time

def preparation_time_in_minutes(nb_layers):
    """
        :param nb_layers: int - amount of layers
        :return: int amount of layers * preparation time
    """
    return nb_layers * PREPARATION_TIME
