from collections import namedtuple
from random import randint

Rect = namedtuple("Rectangle", ["length", "width"])


class Rectangle:
    lengths = [randint(1, 20) for x in range(10)]
    widths = [randint(1, 10) for y in range(10)]

    def __init__(self):
        self._dimensions = [Rect(length, width) for length, width in zip(self.lengths, self.widths)]

    def __len__(self):
        return len(self._dimensions)

    def __getitem__(self, item):
        return self._dimensions[item]


def field(rect):
    return rect.length * rect.width


print(Rectangle()._dimensions)
print(len(Rectangle()))

for rect in Rectangle():
    print(rect, field(rect))


for rect in sorted(Rectangle(), key=field):
    print(rect, field(rect))
