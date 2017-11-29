import MySQLdb as mdb
import sys


def connect():
    con = mdb.connect('localhost', 'railway_admin', 'admin', 'railway')
    cur = con.cursor()
    cur.execute("CREATE TABLE IF NOT EXISTS stations "
                "(Id INT PRIMARY KEY AUTO_INCREMENT,"
                "name CHAR(30),"
                "lat DECIMAL(10, 8) NOT NULL,"
                "lng DECIMAL(11, 8) NOT NULL)")
    con.commit()
    con.close()


def insert(station_name, latitude, longitude):
    con = mdb.connect('localhost', 'railway_admin', 'admin', 'railway')
    cur = con.cursor()
    cur.execute("INSERT INTO stations(name, lat, lng)"
                "VALUES('{}',{},{})".format(station_name, latitude, longitude))
    con.commit()
    con.close()


def delete(id):
    con = mdb.connect('localhost', 'railway_admin', 'admin', 'railway')
    cur = con.cursor()
    cur.execute("DELETE FROM stations WHERE Id=%)".format(id))
    cur.commit()
    con.close()


def view():
    con = mdb.connect('localhost', 'railway_admin', 'admin', 'railway')
    cur = con.cursor()
    cur.execute("SELECT * FROM stations")
    tb = cur.fetchall()
    [print(row) for row in tb]
    con.close()


connect()
insert("krakow", "20.456", "50.345")
insert("tarnow", "21.456", "50.845")
view()