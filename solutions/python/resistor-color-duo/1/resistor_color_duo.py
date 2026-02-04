COLORS =  [ "black",
            "brown",
            "red",
            "orange",
            "yellow",
            "green",
            "blue",
            "violet",
            "grey",
            "white" ]

def value(colors):
    value =  COLORS.index(colors[0]) * 10
    value += COLORS.index(colors[1])
    return value
