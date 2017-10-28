import folium
import pandas

data = pandas.read_csv("Volcanoes_USA.txt")
lat = list(data["LAT"])
lon = list(data["LON"])
elev = list(data["ELEV"])   # height


def color_maker(el):
    if el < 2000:
        return "green"
    elif el < 3000:
        return "orange"
    else:
        return "red"


map_1 = folium.Map(location=[38.58, -99.09], zoom_start=6, tiles="Mapbox Bright")

fg_vol = folium.FeatureGroup(name="Volcanoes")     # feature group

for lt, ln, el in zip(lat, lon, elev):
    fg_vol.add_child(folium.CircleMarker(
                                    location=[lt, ln], radius=8, color="black", fill=True,
                                    fill_color=color_maker(el), fill_opacity=0.7, popup=str(el)))

fg_pop = folium.FeatureGroup(name="Population")

fg_pop.add_child(folium.GeoJson(
                            data=open("world.json", encoding="utf=8-sig").read(),
                            style_function=lambda x: {"fillColor": "green" if x["properties"]["POP2005"] < 10000000
                            else "orange" if x["properties"]["POP2005"] < 20000000 else "red"}))

map_1.add_child(fg_pop)
map_1.add_child(fg_vol)
map_1.add_child(folium.LayerControl())


map_1.save("Map1.html")
