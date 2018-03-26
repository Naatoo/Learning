from random import randint
from itertools import count
from random import choice


def to_str(bytes_or_str):
    if isinstance(bytes_or_str, bytes):
        value = bytes_or_str.decode('utf-8')
    else:
        value = bytes_or_str
    return value  # Instance of str


def to_bytes(bytes_or_str):
    if isinstance(bytes_or_str, str):
        value = bytes_or_str.encode('utf-8')
    else:
        value = bytes_or_str
    return value  # Instance of bytes


def list_dict_set_comprehension():
    d = {1: "one", 2: "two", 3: "three", 4: "three"}
    list_compr = [key for key in d.keys()]
    set_compr = {value for value in d.values()}
    dict_compr = {value: key for key, value in d.items()}
    print(list_compr)  # [1, 2, 3, 4]
    print(set_compr)   # {'one', 'three', 'two'}
    print(dict_compr)  # {'one': 1, 'two': 2, 'three': 4}


# list_dict_set_comprehension()


def randoms_generator():
    random_number = (randint(10, 100) for x in count())
    numbers_list = []

    for number in range(5):
        numbers_list.append(next(random_number))
        print(numbers_list[number])

    random_number_squared = ((number, number**2) for number in numbers_list)
    print(next(random_number_squared))
    print(next(random_number_squared))
    print(next(random_number_squared))


# randoms_generator()


def exception_handling():
    numbers = [number for number in range(3)]
    try:
        division_result = round(10 / choice(numbers))
    except ZeroDivisionError:
        numbers.append(0)
    else:
        numbers.append(division_result)
    finally:
        assert len(numbers) == 4
    return numbers


# exception_handling()
