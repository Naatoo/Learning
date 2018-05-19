metro_areas = [
    ('Tokyo', 'JP', 36.933, (35.689722, 139.691667)),
    ('Delhi NCR', 'IN', 21.935, (28.613889, 77.208889)),
    ('Mexico City', 'MX', 20.142, (19.433333, -99.133333)),
    ('New York-Newark', 'US', 20.104, (40.808611, -74.020386)),
    ('Sao Paulo', 'BR', 19.649, (-23.547778, -46.635833)),
]

print('{:15} | {:^9} | {:^9}'.format('', 'lat.', 'long.'))
fmt = '{:15} | {:9.4f} | {:9.4f}'
for name, cc, pop, (latitude, longitude) in metro_areas:
    if longitude <= 0:  # <3>
        print(fmt.format(name, latitude, longitude))

print()


enemies = {
    ("Rat", "r", 12, 34, 45.133123, 11.33),
    ("Wolf", "w", 15, 25, 66.94832, 9.940)
}

fmt_enemies = "{:6} | {:^5} | {:^8} | {:^8} | {:^7.3f} | {:^13.1f}"
print("{:6} | {:^5} | {:^8} | {:^8} | {:^7} | {:^13}".format("Enemy", "Icon", "Strength",
                                                             "Agility", "Damage", "Attack speed"))
for name, icon, strength, agility, damage, attack_speed in enemies:
    print(fmt_enemies.format(name, icon, strength, agility, damage, attack_speed))