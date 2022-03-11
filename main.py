import mysql.connector
from mysql.connector import Error

def getAllGames():
    cursor.execute(f"SELECT * FROM gameData")
    records = cursor.fetchall()
    # Voor elk row in de tabel:
    for row in records:
        print(f"{row[0]}. {row[2]}")

def getAccountName():
    accountName = input("Login name: ")
    
    # Als accountName bestaat in tabel customer
        # variabele ingelogd = true en variabele userID = id uit tabel.

    # Als het niet bestaat insert in tabel customer
   





# Verbinding met mysql database 'gamesuggestieapp'
try:
    connection = mysql.connector.connect(
        host='localhost',
        database='gamesuggestieapp',
        user='root',
        password='')

    # Hier komt code dat je wilt runnen alleen als het verbonden is met de server.
    if connection.is_connected():
        cursor = connection.cursor()
        # ////////////////////
        # ////////////////////
        getAccountName();
        getAllGames();
        # ////////////////////
        # ////////////////////



except Error as e:
    print("Error while connecting to MySQL", e)
    
finally:
    if connection.is_connected():
        cursor.close()
        connection.close()
        print("MySQL connection is closed")
