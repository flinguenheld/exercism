def rebase(input_base: int, digits: list[int], output_base: int) -> list[int]:

    if input_base < 2:
        raise ValueError("input base must be >= 2")
    if output_base < 2:
        raise ValueError("output base must be >= 2")
    if any(d < 0 or d >= input_base for d in digits):
        raise ValueError("all digits must satisfy 0 <= d < input base")

    # Value into the input base:
    value : int = 0
    for (index, d) in enumerate(reversed(digits)):
        value += d * input_base ** index

    if value < 2:
        return [value]

    # Create the list with values
    base = [1]
    while base[-1] * output_base < value:
        base.append(base[-1] * output_base)

    result : list[int] = []
    for v in reversed(base):

        new_value : int = value // v
        value %=  v
        result.append(new_value)

    return result


if __name__ == "__main__":
    print(f"->{rebase(10, [4, 2], 2)}")
