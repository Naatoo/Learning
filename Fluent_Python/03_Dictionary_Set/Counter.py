from collections import Counter


letters_in_sentence = Counter("All you base are belong to us")
letters_in_sentence.update("Nobody expects the spanish inquisition")

print(letters_in_sentence)
print(letters_in_sentence.most_common(5))
# [(' ', 10), ('s', 6), ('o', 6), ('e', 6), ('i', 5)]
