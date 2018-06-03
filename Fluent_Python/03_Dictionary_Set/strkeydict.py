import collections


class StrKeyDict(collections.UserDict):

    def __missing__(self, key):
        if isinstance(key, str):
            raise KeyError(key)
        return self[str(key)]

    def __contains__(self, key):
        return str(key) in self.data

    def __setitem__(self, key, item):
        self.data[str(key)] = item


d = StrKeyDict([(2, 'two'), ('4', 'four')])

assert sorted(d.keys()) == ["2", "4"]
assert d["2"] == "two"
assert d[4] == "four"
assert d.get("2") == "two"
assert d.get(4) == "four"
assert d.get(1, "NONE") == "NONE"
assert 2 in d
assert 1 not in d

d["123"] = 123
assert d[123] == 123

d.update({1000: "thousand", "1000000": "million"})
d.update(zip([11, "12"], ["eleven", "twelve"]))
assert sorted(d.keys()) == ["1000", "1000000", "11", "12", "123", "2", "4",]
