import sys
import re

WORD_RE = re.compile('\w+')

index = {}
with open(sys.argv[1], encoding='utf-8') as fp:
    for line_no, line in enumerate(fp, 1):
        for match in WORD_RE.finditer(line):
            word = match.group()
            column_no = match.start()+1
            location = (line_no, column_no)
            index.setdefault(word, []).append(location)  # equals to:
            # occurrences = index.get(word, [])
            # occurrences.append(location)
            # index[word] = occurrences

# print in alphabetical order
for word in sorted(index, key=str.upper):
    print(word, index[word])


# OR

import collections

index = collections.defaultdict(list)
with open(sys.argv[1], encoding='utf-8') as fp:
    for line_no, line in enumerate(fp, 1):
        for match in WORD_RE.finditer(line):
            word = match.group()
            column_no = match.start()+1
            location = (line_no, column_no)
            index[word].append(location)

for word in sorted(index, key=str.upper):
    print(word, index[word])


position_v1 = {}
position_v2 = collections.defaultdict(list)
for letter_index, letter in enumerate("All your base are belong to us"):
    position_v1.setdefault(letter, []).append(letter_index)
    position_v2[letter].append(letter_index)

assert position_v1 == position_v2
for letter in sorted(position_v1):
    print(letter, position_v1[letter])
