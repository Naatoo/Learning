import pandas
import folium
import subprocess

green = [
    [], [], [],
    ['#e5f5f9', '#99d8c9', '#2ca25f'],
    ['#edf8fb', '#b2e2e2', '#66c2a4', '#238b45'],
    ['#edf8fb', '#b2e2e2', '#66c2a4', '#2ca25f', '#006d2c'],
    ['#edf8fb', '#ccece6', '#99d8c9', '#66c2a4', '#2ca25f', '#006d2c'],
    ['#edf8fb', '#ccece6', '#99d8c9', '#66c2a4', '#41ae76', '#238b45', '#005824'],
    ['#f7fcfd', '#e5f5f9', '#ccece6', '#99d8c9', '#66c2a4', '#41ae76', '#238b45', '#005824']
]

# -----------------------------------------------------------------------------
# DATA
# -----------------------------------------------------------------------------

# READ FILE
data = pandas.read_excel("power_test.xlsx")
first = list(data["Moc zainstalowana"])

# CONVERT EXCEL FORMATTING TO PYTHON
for index, number in enumerate(first):
    if "," in number:
        number = number.replace(",", ".")
    if " " in number:
        temp = number.split(" ", 1)
        final_number = "".join(temp)
        first[index] = float(final_number)
    else:
        first[index] = float(number)

# USER INTERVALS INPUT
colors_intervals = []
interval = "abc"
while True:
    number = input("Interval <")
    try:
        number = int(number)
        colors_intervals.append(number)
    except ValueError:
        last_interval = int(input("Last interval >"))
        break
print(colors_intervals)
# ASSIGN VALUE WITH COLOR
color_set = green[len(colors_intervals) + 1]
print(color_set)
colors = []
for v in first:
    for i in range(len(colors_intervals)):
        if v < colors_intervals[i]:
            print(v, colors_intervals[i])
            colors.append(color_set[i])
            break
    if v > last_interval:
        colors.append(color_set[len(colors_intervals)])

print(len(colors))
# -----------------------------------------------------------------------------
# MAP - GEOJSON
# -----------------------------------------------------------------------------

# SET MAP BACKGROUND AND FEATURES
map_1 = folium.Map((52.091342, 19.065937), zoom_start=6.2)
fg_borders = folium.FeatureGroup(name="Heat")

# CREATE LAYER WITH COLOURS
fg_borders.add_child(folium.GeoJson(
    data=open("poland.json", encoding="utf=8-sig").read(),
    style_function=lambda x: {
        "color": "grey",
        "weight": 1.5,
        "opacity": 1,
        "fillColor": colors[x["properties"]["cartodb_id"]],
        "fillOpacity": 1
    }))

# ADD LAYER TO MAP
map_1.add_child(fg_borders)
map_1.add_child(folium.LayerControl())
map_1.save("map1.html")

# -----------------------------------------------------------------------------
# FILE
# -----------------------------------------------------------------------------

# OPEN HTML AUTOMATICALLY
html = r'C:\Users\Natoo\Praca_inzynierska\map1.html'
firefoxPath = r'C:\Program Files (x86)\Mozilla Firefox\firefox.exe'
subprocess.Popen("%s %s" % (firefoxPath, html))
