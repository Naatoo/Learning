from math import hypot


class Vector:

    def __init__(self, x=0, y=0):
        self.x = x
        self.y = y

    def __repr__(self):
        return 'Vector(%r, %r), hypot=%r' % (self.x, self.y, self.__abs__())

    def __abs__(self):
        return hypot(self.x, self.y)

    def __bool__(self):
        return bool(abs(self))

    def __add__(self, other):
        x = self.x + other.x
        y = self.y + other.y
        return Vector(x, y)

    def __sub__(self, other):
        x = self.x - other.x
        y = self.y - other.y
        return Vector(x, y)

    def __mul__(self, scalar):
        return Vector(self.x * scalar, self.y * scalar)


vector = Vector(2, 5)
print(vector)
print(vector + Vector(1, 3))
print(vector - Vector(0, 2))
print(vector * 3)
print(abs(vector))
print(bool(Vector(0, 0)), bool(vector))
