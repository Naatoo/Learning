from random import randrange


class Person:
    def __init__(self, gender, surname):
        self.gender = gender
        self.name = People.random_name(gender)
        self.surname = surname

    @classmethod
    def double_surname(cls, surname):
        # only women to have double surname
        gender = "f"
        maiden_name = People.random_name("s")
        surnames_list = [maiden_name, surname]
        full_surname = "-".join(surnames_list)
        return cls(gender, full_surname)


class People:
    global generation
    generation = 1

    def __init__(self):
        self.father_surname = self.random_name("s")
        self.people = {}
        self.people[generation] = [Person("m", self.father_surname),
                                   Person.double_surname(self.father_surname)]

    @staticmethod
    def random_name(sign):
        if sign == "m":
            file_name = "male_names.txt"
        elif sign == "f":
            file_name = "female_names.txt"
        elif sign == "s":
            file_name = "surnames.txt"
        name = open(file_name)
        lines = name.readlines()
        name_line = randrange(len(lines))
        for i, line in enumerate(lines):
            if i == name_line:
                return line

    @staticmethod
    def numeral(k):
        num = ["th", "st", "nd", "rd", "th"]
        try:
            numeral = str(k) + num[k % 10]
        except IndexError:
            numeral = str(k) + num[0]
        return numeral

    def print_people(self):
        for k, v in self.people.items():
            print("-" * 30)
            number = self.numeral(k)
            print("{} generation".format(number))
            print("-" * 30)
            for person in v:
                print("{}{}".format(person.name.title(), person.surname))

    def add_person(self, gender):
        surname = self.people[1][0].surname
        if gender == "m":
            try:
                self.people[generation].append(Person(gender, surname))
            except KeyError:
                self.people[generation] = [Person(gender, surname)]
        else:
            try:
                self.people[generation].append(Person.double_surname(surname))
            except KeyError:
                self.people[generation] = [Person.double_surname(surname)]

    @staticmethod
    def integer_insistent_tool():
        while True:
            user_input = input("Type the number: ")
            try:
                checked = int(user_input)
                if checked < 1:
                    print("Please input an positive integer")
                    continue
            except ValueError:
                print("Please input an positive integer")
                continue
            break
        return checked

# create tree
p = People()

print("How many generations would you like to add? ")
gen = p.integer_insistent_tool()
[print("_" * 30) for i in range(2)]

for i in range(gen):
    generation += 1
    numeral = People.numeral(i + 1)
    print("How many men in {} generation: ".format(numeral))
    male_n = People.integer_insistent_tool()
    print("How many women in {} generation: ".format(numeral))
    female_n = People.integer_insistent_tool()
    [p.add_person("m") for k in range(male_n)]
    [p.add_person("f") for k in range(female_n)]
    print("_" * 30)
p.print_people()