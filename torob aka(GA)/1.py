# we want to semulate a magic trick where the magician puts a ball under one of three cups
# in the fist input we get the number moves the magician makes
# in the second input we get the number of the cups that change places
# in the beginning the ball is under cup number 1

"""
input:
    
4
1 2
2 3
3 1
1 2


output:

2
"""


N = int(input())
list_of_answers = ["1", "2", "3"]

list_of_moves = []
for i in range(N):
    list_of_moves.append(tuple(input().split()))

for move in list_of_moves:
    list_of_answers[int(move[0])-1], list_of_answers[int(move[1])-1] = list_of_answers[int(move[1])-1], list_of_answers[int(move[0])-1]

print(list_of_answers.index("1")+1)

