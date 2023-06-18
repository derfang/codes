#Author: DERFANG
# This is a program that calculates the total resistance of pararelle resistors and raounds it up to two decimal places
# The program takes the resistors as input and calculates the total resistance
# The program stops when the user enters n
# The program is written in python 3.11.2
from time import sleep
import random

def pararelle_dynamic_resistors(list_of_resistors):
    """ This function calculates the total resistance of pararelle dynamic resistors
    Input: some dynamic number of resistors
    Output: Rounded total resistance of pararelle dynamic resistors"""
    return 1 / sum(1 / float(i) for i in list_of_resistors)


print(
    "Welcome to pararelle resistor calculator, \n" +
    "This program calculates the total resistance of a dynamic number of pararelle resistors "
)
while True:
    try:
        x = input("n for exit; Enter the resistors: ")
        if x.lower() == "n":
            print("Thank you for using pararelle resistor calculator")
            sleep(2)
            break
        else:
            result = pararelle_dynamic_resistors(tuple(x.split()))
            if result > 0.02:
                result = round(
                    100 * pararelle_dynamic_resistors(tuple(x.split()))) / 100
            print("The total resistance is: ", result)

    except:
        print("Please enter a valid input")
