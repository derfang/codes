# in this code we check if 2 matrices are the same if can change the rows and columns
# first we get the number matrices
# then we get the number of rows and columns of each matrix N*N
# then we get the matrices
"""
input:

3
2
1 2
3 4
4 3
2 1
3
1 2 3
4 5 6
7 8 9
1 2 3
8 9 4
7 6 5
2
1 2
3 4
1 3
2 4

output:

YES
NO
NO
"""

t = int(input())

list_of_matrices = []

def change_rows(matrix , row1, row2):
    matrix[row1], matrix[row2] = matrix[row2], matrix[row1]
    return matrix

def change_columns(matrix, column1, column2):
    for i in range(len(matrix)):
        matrix[i][column1], matrix[i][column2] = matrix[i][column2], matrix[i][column1]
    return matrix

for i in range(t):
    n = int(input()) # we will get 2 matrices of size n*n
    matrix1 = []
    matrix2 = []
    for j in range(n):
        matrix1.append(input().split())
    for j in range(n):
        matrix2.append(input().split())
    list_of_matrices.append((matrix1, matrix2))
    
for matrices in list_of_matrices:
    matrix1 = matrices[0]
    matrix2 = matrices[1]
    # print(matrix1)
    # print(change_rows(matrix1, 0, 1))
    # print(matrix1)
    # print(change_columns(matrix1, 0, 1))
    # print(matrix1)
    # now we try to change the rows and columns of matrix1 to make it equal to matrix2
    for tries in range(n*n):
        number_of_target_row1 = tries // n 
        number_of_target_column1 = tries % n
        target = matrix2[number_of_target_row1][number_of_target_column1]
        if matrix1 == matrix2:
            break
        for i in range(n):
            if matrix1 == matrix2:
                break
            for j in range(n):
                if matrix1[i][j] == target:
                    matrix1 = change_rows(matrix1, i, number_of_target_row1)
                    matrix1 = change_columns(matrix1, j, number_of_target_column1)
    
    if matrix1 == matrix2:
        print("YES")
    else:
        print("NO")
        

