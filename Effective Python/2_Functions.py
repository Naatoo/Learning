from datetime import datetime
import json


def sort_priority(numbers, group):
    found = False

    def helper(x):
        nonlocal found
        if x in group:
            found = True
            return 0, x,
        return 1, x,
    numbers.sort(key=helper)
    return found


def check_sorting():
    numbers = [1, 3, 11, 5, 2, 8, 7]
    groups = {1, 8, 11}
    found = sort_priority(numbers, groups)
    print('Found:', found)
    print(numbers)


# check_sorting()


def index_words(text):
    if text:
        yield 0
    for index, letter in enumerate(text):
        if letter == ' ':
            yield index + 1


def check_generator():
    text = 'one two three four five'
    print(next(index_words(text)))
    print(next(index_words(text)))


# check_generator()


def log(message, when=None):
    """Log a message with a timestamp.
    Args:
    message: Message to print.
    when: datetime of when the message occurred.
    Defaults to the present time.
    """
    when = datetime.now() if when is None else when
    print('%s: %s' % (when, message))


def decode(data, default=None):
    """Load JSON data from a string.
    Args:
    data: JSON data to decode.
    default: Value to return if decoding fails.
    Defaults to an empty dictionary.
    """
    if default is None:
        default = {}
    try:
        return json.loads(data)
    except ValueError:
        return default


def check_none_and_docstrings():
    log("one")
    log("two")
    data = str({"debug": "on", "window": {"title": "Sample Konfabulator Widget",
                                          "name": "main_window", "width": 500, "height": 500}})
    print(decode(data))


# check_none_and_docstrings()
