from functools import partial
from operator import mul

double = partial(mul, 2)
print(double(10))                    # 20
print(list(map(double, range(10))))  # [0, 2, 4, 6, 8, 10, 12, 14, 16, 18]


def delta(a, b, c):
    return b ** 2 - 4 * a * c, "{a} ** 2 - 4 * {b} * {c}".format(a=a, b=b, c=c)


const_a_b = partial(delta, a=5, b=8)

print("Result:", const_a_b(c=3)[0], "Equation:", const_a_b(c=3)[1])
# Result: 4 Equation: 5 ** 2 - 4 * 8 * 3
