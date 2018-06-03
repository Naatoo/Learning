a = {n for n in range(100)}
b = {n for n in range(50) if n % 5 == 0}

print(a & b)
print(a.intersection(b))
# {0, 35, 5, 40, 10, 45, 15, 20, 25, 30}
