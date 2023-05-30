# Author: DERFANG
# This program over allocates memory and you can monitor the memory usage using task manager
# This program is NOT harmful to your computer and the program problebly crashes when the memory is full
# This program is not a virus nor is it a malware
# This program is for educational purposes only
# This program is written in python 3.11.2

def over_allocate():
    """This function over allocates memory"""
    a = []
    while True:
        a.append(1)

over_allocate()


