from getpass import getpass
from mysql.connector import connect, Error
import mysql.connector as connector
class db:
    def __init__(self):
        self.con = connector.connect(
            host = "localhost",
            port = "3306",
            user = "mhba",
            password = "H@ssan123",
            database = "college_dbs"
        )
        self.cursor = self.con.cursor()

    def select_query(self,query):
        self.cursor.execute(query)
        results = self.cursor.fetchall()
        return results          #Returns list of tuples. Also add GUI to display it
    
    def update_and_delete_query(self,query):
        self.cursor.execute(query)
        self.con.commit()
    
    def insert(self,query,values):  #Write query like this: INSERT INTO students (name,age) VALUES (%s,%s) and then you pass value in form of
                                    #tuples (if single value) or a list(multiple values) of tuples like e.g in this case [("Hassan",19), (Aleena,23)]
        self.cursor.executemany(query,values)
        self.con.commit()

    
