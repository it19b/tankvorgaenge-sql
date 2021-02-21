import random
import mysql.connector
from datetime import timedelta, datetime


class my_sql():
    def __init__(self):
        self.mysql = mysql.connector.connect(
                host="localhost",
                user="admin",
                password="admin",
                database="versicherungen"
            )
        self.cursor = self.mysql.cursor(buffered=True)

    def insert_tankstellen(self):
        sql = "INSERT INTO Tankstelle (Name, Addresse) VALUES (%s, %s)"
        val = [
            ('Aral', 'Bambusweg 4'),
            ('Shell', 'Apfelstrasse 652'),
            ('Shell', 'Birnenbaum 21'),
            ('Shell', 'Pflaumenweg 345'),
            ('Aral', 'Bananbrotalee 2'),
            ('Star', 'Musterstrasse 1'),
            ('Esso', 'Bahnhofstrasse 331'),
            ('Star', 'Hauptrasse 98'),
            ('Star', 'Nebenstrasse 2'),
            ('Aral', 'Kleine Gasse 38'),
            ('Shell', 'Dorfstrasse 954')
        ]

        self.cursor.executemany(sql, val)
        
    def create_tankstellen_table(self):
        self.cursor.execute("CREATE TABLE Tankstelle (Id INT AUTO_INCREMENT PRIMARY KEY, Name VARCHAR(255), Addresse VARCHAR(255))")

    def alter_dienstwagen_table(self):
        sql = "ALTER TABLE Dienstwagen ADD Kilometerstand DECIMAL(7,2);"
        self.cursor.execute(sql)

    def create_tankvorgaenge_table(self):
        sql = """
            CREATE TABLE Tankvorgaenge (
            ID INT AUTO_INCREMENT PRIMARY KEY,
            TankstellenId INT,
            Tankmenge DECIMAL(4,2), 
            DienstwagenId INT,
            Kilometerstand DECIMAL(7,2),
            Tankkosten DECIMAL(16,2),
            Datum DATE,
            CONSTRAINT `TV_TS` FOREIGN KEY (`TankstellenId`) REFERENCES `Tankstelle` (`ID`),
            CONSTRAINT `TV_DW` FOREIGN KEY (`DienstwagenId`) REFERENCES `Dienstwagen` (`ID`)
            );
        """
        self.cursor.execute(sql)

    def insert_tankvorgaenge_values(self):
        query = "INSERT INTO Tankvorgaenge (TankstellenId, Tankmenge, DienstwagenId, Kilometerstand, Tankkosten, Datum) VALUES (%s, %s, %s, %s, %s, %s)"
        values = []
        dateformat = "%d.%m.%Y"

        for i in range(0, 24):

            random_kilometer = random.randrange(100, 500)
            round_kilometer = round(random_kilometer, 2)
            tankmenge = round(random.randrange(50, 80), 2)

            tankstellen_id = self.get_random_id_from_table("Tankstelle")
            dienstwagen_id = self.get_random_id_from_table("Dienstwagen")
            kilometerstand = self.update_kilometerstand(dienstwagen_id, round_kilometer)

            tankkosten = 1.5 * tankmenge


            month = (i % 12) + 1
            d1 = datetime.strptime("1.{}.2020".format(month), dateformat)
            d2 = datetime.strptime("28.{}.2020".format(month), dateformat)
            datum = self.get_random_date(d1, d2)

            data = (tankstellen_id, tankmenge, dienstwagen_id, kilometerstand, tankkosten, datum)
            values.append(data)

        self.cursor.executemany(query, values)
        self.mysql.commit()

    def update_kilometerstand(self, dienstwagen_id, added_kilometer):
        query = "SELECT Kilometerstand FROM Dienstwagen WHERE " + str(dienstwagen_id)

        self.cursor.execute(query)
        kilometerstand = float(self.cursor.fetchone()[0])

        new_kilometerstand = kilometerstand + added_kilometer
        update_query = "Update Dienstwagen SET Kilometerstand = {} WHERE (ID = '{}')".format(new_kilometerstand, dienstwagen_id)
        self.cursor.execute(update_query)

        self.mysql.commit()

        return new_kilometerstand

    def generate_random_kilometer(self):
        query = "SELECT ID FROM Dienstwagen"

        self.cursor.execute(query)
        result = self.cursor.fetchall()

        for item in result:
            dienstwagen_id = item[0]
            random_kilometerstand = round(random.randrange(10000, 50000), 2)
            update_query = "UPDATE Dienstwagen SET Kilometerstand = {} WHERE (ID = '{}')".format(random_kilometerstand, dienstwagen_id)

            self.cursor.execute(update_query)
        
        self.mysql.commit()

    def get_random_id_from_table(self, tablename):
        sql = "SELECT ID FROM " + tablename

        self.cursor.execute(sql)
        results = self.cursor.fetchall()
        random_choice = random.choice(results)[0]

        return random_choice

    def get_random_date(self, start, end):
        """
        This function will return a random datetime between two datetime 
        objects.
        """
        delta = end - start
        int_delta = (delta.days * 24 * 60 * 60) + delta.seconds
        random_second = random.randrange(int_delta)
        return start + timedelta(seconds=random_second)
