# in this code we will find out if 2 strings are the same if we reverse or shift one of them

def is_correct(strings):
    newstrings = []
    newstrings.append(strings[0])
    newstrings.append(strings[1])
    newstrings.append(newstrings[1][::-1])

    if len(newstrings[0]) != len(newstrings[1]):
        print("NO")
        
    elif newstrings[0] == newstrings[1][::-1]:
        print("YES")
    
    else:
        for i in range(len(newstrings[0])):
            if (newstrings[0] == newstrings[1][i:] + newstrings[1][:i]) or (newstrings[0] == newstrings[2][i:] + newstrings[2][:i]):
                print("YES")
                break
        else:
            print("NO")
        

N = int(input())

list_of_strings = []
for i in range(N):
    list_of_strings.append(input().split())
# print(list_of_strings)
for strings in list_of_strings:
    is_correct(strings)
