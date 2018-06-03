from operator import itemgetter, attrgetter, methodcaller
from collections import namedtuple

Size = namedtuple("Size", "length width")
Figure = namedtuple("Figure", "name, size, colour")

figures = [Figure(name, Size(length, width), colour)
           for name, (length, width), colour in [("square", (10, 10), "yellow"), ("rectangle", (15, 25), "green")]]

[print(fig) for fig in sorted(figures, key=itemgetter(0))]
# Figure(name='rectangle', size=Size(length=15, width=25))
# Figure(name='square', size=Size(length=10, width=10))

name_and_colour = itemgetter(0, 2)
[print(name_and_colour(fig)) for fig in figures]
# ('square', 'yellow')
# ('rectangle', 'green')

name_and_width = attrgetter("name", "size.width")
[print(name_and_width(fig)) for fig in figures]
# ('square', 10)
# ('rectangle', 25)


sentence = "All your base are belong to us"
upper = methodcaller("upper")
print(upper(sentence))
# ALL YOUR BASE ARE BELONG TO US

replace_dots = methodcaller("replace", " ", ".")
print(replace_dots(sentence))
# All.your.base.are.belong.to.us
