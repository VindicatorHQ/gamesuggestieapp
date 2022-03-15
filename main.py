import mysql.connector
from mysql.connector import Error
import os
import time
from colorama import init, Fore, Back, Style
init()

loggedInID = None

# main Menu
def mainMenu():
    os.system('cls')
    user = getUserInfo(loggedInID)
    print(Style.BRIGHT + Fore.GREEN + f"You are now logged in as: {user[1]}, with userID: {user[0]}" + Style.RESET_ALL)
    print("\n")
    print("[1] Show your account information")
    print("[2] Show list of all games")
    print("    - Rate a game")
    print("    - show game information")
    print("[3] See all your game ratings")
    print("    - Edit and delete ratings")
    print("[4] See game recommendations based on your ratings of other games")
    print(Fore.RED + "[logout]" + Style.RESET_ALL + " Logout")
    print("\n")
    
    option = input("Enter your option: ")
    if option.isdigit():
        option = int(option)
    else:
        option = str(option)

    while option != "logout":
        if option == 1:
            userInfoMenu()
            break
        elif option == 2:
            allGamesMenu()
            break
        elif option == 3:
            ratingsMenu()
            break
        elif option == 4:
            recommendationsMenu()
            break
        else:
            mainMenu()
            break    
    logout()

#[1] RECOMMENDATIONS MENU
def recommendationsMenu():
    os.system('cls')
    print(Style.BRIGHT +  Fore.GREEN + f"Account Information" + Style.RESET_ALL)
    print("\n")
    print(f"ID: {user[0]}")
    print(f"Name : {user[1]}")
    print(Fore.RED + "[back]" + Style.RESET_ALL + " Go Back")
    print("\n")

    option = input("Enter your option: ")
    if option.isdigit():
        option = int(option)
    else:
        option = str(option)
    
    while option != "back":
        userInfoMenu()
        break
    mainMenu()
    
def getRecommendations(id):
    cursor.execute(f"SELECT * FROM customer WHERE userID = '{id}'")
    user = cursor.fetchone()
    return user
    





#[1] USER INFO MENU
def userInfoMenu():
    os.system('cls')
    user = getUserInfo(loggedInID)
    print(Style.BRIGHT +  Fore.GREEN + f"Account Information" + Style.RESET_ALL)
    print("\n")
    print(f"ID: {user[0]}")
    print(f"Name : {user[1]}")
    print(Fore.RED + "[back]" + Style.RESET_ALL + " Go Back")
    print("\n")

    option = input("Enter your option: ")
    if option.isdigit():
        option = int(option)
    else:
        option = str(option)
    
    while option != "back":
        userInfoMenu()
        break
    mainMenu()
    
def getUserInfo(id):
    cursor.execute(f"SELECT * FROM customer WHERE userID = '{id}'")
    user = cursor.fetchone()
    return user









#[2] ALL GAMES MENU
def allGamesMenu():
    os.system('cls')
    user = getUserInfo(loggedInID)
    print(Style.BRIGHT +  Fore.GREEN + f"All Games" + Style.RESET_ALL)
    print("\n")
    cursor.execute(f"SELECT * FROM gameData")
    records = cursor.fetchall()
    count = cursor.rowcount
    for row in records:
        print(f"[{row[0]}] {row[2]}")
    print(Fore.RED + "[back]" + Style.RESET_ALL + " Go Back")
    print("\n")
    option = input("Which game do you want to select: ")
    while option != "back":
        if option.isdigit():
            option = int(option)
            if option > 0:
                if not option > count:
                    gameMenu(option)
                    break
                else:
                    allGamesMenu()
                    break
            else:
                allGamesMenu()
                break
        else:
            allGamesMenu()
            break
    mainMenu()

def gameMenu(selectedGameID):
    os.system('cls')
    game = getGameInfo(selectedGameID)
    print(Style.BRIGHT + Fore.GREEN + f"{game[2]}" + Style.RESET_ALL)
    print("\n")
    print("[1] Show information about the game")
    print("[2] Place a rating")
    print(Fore.RED + "[back]" + Style.RESET_ALL + " Go Back")
    print("\n")
    option = input("Enter your option: ")
    if option.isdigit():
        option = int(option)
    else:
        option = str(option)
    while option != "back":
        if option == 1:
            gameInfoMenu(selectedGameID)
            break
        elif option == 2:
            placeRating(selectedGameID)
            break
        else:
            gameMenu(selectedGameID)
            break
    allGamesMenu()

def gameInfoMenu(selectedGameID):
    os.system('cls')
    game = getGameInfo(selectedGameID)
    print(Style.BRIGHT +  Fore.GREEN + f"Information About {game[2]}" + Style.RESET_ALL)
    print("\n")
    print(f"Publisher: {game[3]}")
    print(f"Genre: {game[4]}")
    print(f"Release year: {game[1]}")
    print(Fore.RED + "[back]" + Style.RESET_ALL + " Go Back")
    print("\n")
    
    option = input("Enter your option: ")
    if option.isdigit():
        option = int(option)
    else:
        option = str(option)
    while option != "back":
        gameInfoMenu(selectedGameID)
        break
    gameMenu(selectedGameID)

def getGameInfo(id):
    cursor.execute(f"SELECT * FROM gameData WHERE gameID = '{id}'")
    game = cursor.fetchone()
    return game










#[1] RATINGS MENU
def ratingsMenu():
    os.system('cls')
    user = getUserInfo(loggedInID)
    print(Style.BRIGHT +  Fore.GREEN + f"Your game ratings" + Style.RESET_ALL)
    print("\n")
    cursor.execute(f"SELECT * FROM rating WHERE userID = '{loggedInID}'")
    records = cursor.fetchall()
    for row in records:
        print(f"[{row[0]}] Je hebt {getGameInfo(row[1])[2]} een {row[3]}/10 gegeven.")
    print(Fore.RED + "[back]" + Style.RESET_ALL + " Go Back")
    print("\n")
    option = input("Which rating do you want to edit: ")
    while option != "back":
        if option.isdigit():
            option = int(option)
            cursor.execute(f"SELECT * FROM rating WHERE ratingID = '{option}' AND userID = '{loggedInID}'")
            amountResults = cursor.rowcount
            if amountResults > 0:
                editRatingsMenu(option)
            else:
                ratingsMenu()
        else:
            ratingsMenu()
    mainMenu()

def editRatingsMenu(selectedRecommendationID):
    os.system('cls')
    rating = getRatingInfo(selectedRecommendationID)
    game = getGameInfo(rating[1])
    print(Style.BRIGHT +  Fore.GREEN + f"Rating for {game[2]}: {rating[3]}" + Style.RESET_ALL)
    print("\n")
    print(f"[1] Delete rating")
    print(f"[2] Edit current rating")
    print(Fore.RED + "[back]" + Style.RESET_ALL + " Go Back")
    print("\n")
    option = input("Enter your option: ")
    while option != "back":
        if option.isdigit():
            option = int(option)
            if option == 1:
                deleteRating(selectedRecommendationID)
                break
            elif option == 2:
                editRating(selectedRecommendationID)
                break
            else:
                editRatingsMenu(selectedRecommendationID)
                break
        else:
            editRatingsMenu(selectedRecommendationID)
            break
    ratingsMenu()

def getRatingInfo(id):
    cursor.execute(f"SELECT * FROM rating WHERE ratingID = '{id}'")
    rating = cursor.fetchone()
    return rating

def placeRating(gameID):
    os.system('cls')
    cursor.execute(f"SELECT * FROM rating WHERE gameID = '{gameID}' AND userID = '{loggedInID}'")
    records = cursor.fetchone()
    amountResults = cursor.rowcount

    if amountResults > 0:
        option = input(Fore.RED + f"You already have a rating for this game, would you like to change it? yes/no: " + Style.RESET_ALL).lower()
        if option == "no":
            os.system('cls')
            gameMenu(gameID)
        elif option == "yes":
            editRating(records[0])
            ratingsMenu()
        else:
            placeRating(gameID)
    else:
        option = int(input("What value would you like to give 0-10: "))
        insertDeleteUpdateQuery(f"INSERT INTO rating (gameID, userID, ratingValue) VALUES ('{gameID}', '{loggedInID}', '{option}')")
        ratingsMenu()

def deleteRating(selectedRecommendationID):
    os.system('cls')
    insertDeleteUpdateQuery(f"DELETE FROM rating WHERE ratingID = '{selectedRecommendationID}' AND userID = '{loggedInID}'")

def editRating(selectedRecommendationID):
    os.system('cls')
    option = int(input("What value would you like to give 0-10: "))
    insertDeleteUpdateQuery(f"UPDATE rating SET ratingValue = '{option}' WHERE ratingID = '{selectedRecommendationID}' AND userID = '{loggedInID}'")










def insertDeleteUpdateQuery(sql):
    cursor.execute(sql)
    connection.commit()

    
def login():
    os.system('cls')
    accountName = input("Login Name: ").capitalize()
    accountNameLen = len(accountName) - accountName.count(' ')
    if accountNameLen == 0:
        login()
    else:
        cursor.execute(f"SELECT * FROM customer WHERE userName = '{accountName}'")
        userData = cursor.fetchall()
        amountResults = cursor.rowcount

        # Als Login userName bestaat -> log dan in en sla userID op in variabele
        if amountResults != 0:
            global loggedInID
            loggedInID = userData[0][0]

        # Als Login userName NIET bestaat -> insert userName in database
        else:
            os.system('cls')
            option = input(Fore.RED + f"Account with the userName '{accountName}' does not exist, would you like to make one? yes/no: " + Style.RESET_ALL).lower()
            if option != "yes":
                os.system('cls')
                print(Fore.RED + f"Account creation aborted. Sending you back to login..." + Style.RESET_ALL)
                time.sleep(2)
                login()
            else:
                os.system('cls')
                insertDeleteUpdateQuery(f"INSERT INTO customer (userName) VALUES ('{accountName}')")
                print(Style.BRIGHT +  Fore.GREEN + f"Account has been made with userName '{accountName}'. Sending you back to login..." + Style.RESET_ALL)
                time.sleep(2)
                login()

    
def logout():
    global loggedInID
    loggedInID = None
    login();
    mainMenu();
    


#################################################################
######## Verbinding met mysql database 'gamesuggestieapp'########
#################################################################
try:
    connection = mysql.connector.connect(
        host='localhost',
        database='gamesuggestieapp',
        user='root',
        password='')

    if connection.is_connected():
        cursor = connection.cursor(buffered=True)
        # ////////////////////
        # ////////////////////
        login();
        mainMenu();
        # ////////////////////
        # ////////////////////


except Error as e:
    print("Error while connecting to MySQL", e)
    
finally:
    if connection.is_connected():
        cursor.close()
        connection.close()
        print("\n")
        print("------")
        print("MySQL connection is closed")
