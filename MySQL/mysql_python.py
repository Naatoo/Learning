import MySQLdb as mdb
import sys


con = mdb.connect('localhost', 'testuser', 'test', 'testdb')

cur = con.cursor(mdb.cursors.DictCursor)

cur.execute("DROP TABLE IF EXISTS test")
cur.execute("CREATE TABLE test (Id INT PRIMARY KEY AUTO_INCREMENT, Name CHAR(25))")
cur.execute("SHOW TABLES")
cur.execute("INSERT INTO test(Name) VALUES('milk')")
cur.execute("INSERT INTO test(Name) VALUES('juice')")
cur.execute("INSERT INTO test(Name) VALUES('water')")
cur.execute("INSERT INTO test(Name) VALUES('coffee')")

cur.execute("UPDATE test SET Name ='tea' WHERE Id=2")

cur.execute("ALTER TABLE test ADD COLUMN Price INT UNSIGNED AFTER Name")
cur.execute("UPDATE test SET Price=5 WHERE Id<3")
cur.execute("UPDATE test SET Price=8 WHERE Id>=3")

cur.execute("SELECT * FROM test")
r = cur.fetchall()

[print(row["Id"], row["Name"]) for row in r]

con.commit()
con.close()
