import bisect
import random

HAYSTACK = [1, 4, 5, 6, 8, 12, 15, 20, 21, 23, 23, 26, 29, 30]
NEEDLES = [0, 1, 2, 5, 8, 10, 22, 23, 29, 30, 31]

ROW_FMT = '{0:2} @ {1:2}    {2}{0:}'


def needle_haystack(bisect_fn):
    for needle in reversed(NEEDLES):
        position = bisect_fn(HAYSTACK, needle)
        offset = position * '  |'
        print(ROW_FMT.format(needle, position, offset))


def needle_haystack_2(needle, haystack=(3, 5, 8, 9, 10, 23, 45, 65, 98)):
    print(needle, haystack)
    position = bisect.bisect(haystack, needle)
    return haystack[position - 1], needle, haystack[position]


def insort():
    my_list = []
    for i in range(14):
        new_item = random.randrange(14)
        bisect.insort(my_list, new_item)
        print('%2d ->' % new_item, my_list)


def insort_2():
    numbers = [1, 4, 6, 7, 8, 9, 9, 9, 10]
    for num in range(10):
        bisect.insort(numbers, random.choice([2, 5, 8]))
        print(numbers)


bisect_fn = bisect.bisect
print('haystack ->', ' '.join('%2d' % n for n in HAYSTACK))
print(bisect_fn.__name__)
needle_haystack(bisect_fn)

insort()

print()

[print(needle_haystack_2(needle=x)) for x in range(10, 80, 10)]
insort_2()
