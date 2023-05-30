#Author: DERFANG
# This is a program that makes a tik tak to game
# The program is written in python 3.11.2
# The program is specifically written for windows and may not work on other operating systems

# steps to make to console game tik tak to
# 1. make a board
# 2. make a function that removes the privious
# 3. make a function that takes input from the user and changes the board if the input is valid
# 5. make a function that checks if the move is win lose or draw
# 6. make a function that dose the computer move
# 7. main function and the game loop

import os
import random
import time


# 1. make a board
def make_board():
    """This function makes a board"""
    board = []
    for i in range(3):
        board.append([" "] * 3)
    return board


# 2. make a function that removes the privious board and prints the new board
def print_board(board):
    """This function prints the current board"""
    os.system("cls")
    for i in range(3):
        print(
            " | ".join(board[i])
        )  #this line of code joins the elements of the list with " | " and prints it
        if i != 2:  #this line of code prints the lines between the rows
            print("-" * 9)


# 3. make a function that takes input from the user and changes the board if the input is valid
def user_input(board):
    """function that takes input from the user and changes the board if the input is valid"""
    while True:
        try:
            x, y = input("Enter the coordinates: ").split()
            x = int(x)
            y = int(y)
            if x > 3 or x < 1 or y > 3 or y < 1:
                print("Coordinates should be from 1 to 3!")
                continue
            elif board[x - 1][y - 1] != " ":
                print("This cell is occupied! Choose another one!")
                continue
            else:
                board[x - 1][y - 1] = "X"
                break
        except:
            print("You should enter numbers!")
            continue


# 5. make a function that checks if the move is win lose or draw
def referee(board):
    """This function checks if the game is win lose or draw"""
    # check if the game is win
    #for loop to check the rows and columns
    for i in range(3):
        if board[i][0] == board[i][1] == board[i][2] != " ":
            return board[i][0]
        if board[0][i] == board[1][i] == board[2][i] != " ":
            return board[0][i]
    #to check the diagonals
    if board[0][0] == board[1][1] == board[2][2] != " ":
        return board[0][0]
    elif board[0][2] == board[1][1] == board[2][0] != " ":
        return board[0][2]
    # check if the game is draw
    elif " " not in board[0] and " " not in board[1] and " " not in board[2]:
        return "draw"
    # if the game is not win lose or draw
    else:
        return None


# 6. make a function that dose the computer move
#this is an random movement
def Ai(board):
    while True:
        x = random.randint(0, 2)
        y = random.randint(0, 2)
        if board[x][y] == " ":
            board[x][y] = "O"
            break
        else:
            continue


#7. main function and the game loop
def main_function():
    """This is the main for "the tik tak to" game function"""
    print("Welcome to tik tak to")
    board = make_board()
    print_board(board)
    while True:
        while True:
            print("Your turn")
            print(
                "The first number is the row and the second number is the column"
            )
            user_input(board)
            print_board(board)
            if referee(board) == "X":
                print("X wins")
                break
            elif referee(board) == "draw":
                print("Draw")
                break
            Ai(board)
            print_board(board)
            if referee(board) == "O":
                print("O wins")
                break
            elif referee(board) == "draw":
                print("Draw")
                break
        play_again = input("do you want to play again? (y/n) : ")
        if play_again == "n":
            print("Thanks for playing!!!")
            print("The game will close in 5 seconds")
            time.sleep(5)
            break
        else:
            board = make_board()
            print_board(board)
            continue


main_function()