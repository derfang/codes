# Author: DERFANG
# This is a password generator that generates a password of a given length
# The password is a combination of letters and numbers
# But it it does not gurantee that the password contains both letters and numbers
# The password is at least 8 characters long

import random


def generator(length=16):
    """This function generates a password of a given length and the default length is 16"""
    password = ""
    while True:
        for i in range(length):
            password += chr(random.randint(33, 126))
        if not (password.isalpha() and password.isdigit()):
            break
    return password


print("Welcome to password generator")
while True:
    x = input("How long do you want your password to be? (n for exit)   ")
    if x == 'n':
        break
    elif not x.isdigit():
        print("The password length must be a number")
        continue
    x = int(x)
    if x < 8:
        print("This password is too short, try again")
    else:
        print(generator(x))
