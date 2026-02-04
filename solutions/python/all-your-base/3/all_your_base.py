def rebase(input_base: int, digits: list[int], output_base: int) -> list[int]:

    if input_base < 2:
        raise ValueError("input base must be >= 2")
    if output_base < 2:
        raise ValueError("output base must be >= 2")
    if any(d < 0 or d >= input_base for d in digits):
        raise ValueError("all digits must satisfy 0 <= d < input base")

    # Value into the input base:
    value = sum(d * input_base ** index for (index, d) in enumerate(reversed(digits)))

    if value < 2:
        return [value]

    # Then into the new base
    result :list[int] = []
    while value != 0:
        result.insert(0, value % output_base)
        value //= output_base

    return result


if __name__ == "__main__":
    print(f"->{rebase(10, [4, 2], 2)}")
