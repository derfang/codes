// in this code we will implement a algorithm to solve a simpleized version the game : Move the Block : Slide Puzzle
// the game is a 6*6 board with some rectangrular blocks in it. the goal is to move the horizontal block that is placed in 
// 3rd row and 2nd and 3rd column to the exit of the board(we call it the golden block). the exit is the 3rd row and 6th column.
// horizontal blocks can only move horizontally and vertical blocks can only move vertically.


#include <bits/stdc++.h>
using namespace std;

int main(){
    class bord{
    public:
        int moves = 0;
        enum Direction{up , down , left , right};
        int board[6][6] = {{2 , 3 , 3 , 4 , 0 , 5}, // 1 is the golden block
                        {2 , 0 , 0 , 4 , 6 , 5}, // 0 means there is no block in that cell
                        {7 , 1 , 1 , 8 , 6 , 5}, // other numbers are the block numbers
                        {7 , 0 , 0 , 8 , 0 , 0},
                        {0 , 0 , 0 , 9 , 9 , 9},
                        {10, 10, 10, 0 , 0 , 0}};
        
        void print(){
            for(int i = 0 ; i < 6 ; i++){
                for(int j = 0 ; j < 6 ; j++){
                    cout << board[i][j] << " ";
                }
                cout << endl;
            }
            cout << endl;
        }

        bool is_goal(){
            if(board[3][4] == 1 && board[3][5] == 1){
                return true;
            }
            return false;
        }

        int* find (int block){
            int* pos = new int[2];
            for(int i = 0 ; i < 6 ; i++){
                for(int j = 0 ; j < 6 ; j++){
                    if(board[i][j] == block){
                        pos[0] = i;
                        pos[1] = j;
                        return pos;
                    }
                }
            }
            return pos;
        }

        bool is_horizontal(int block){
            int* pos = find(block);
            if( board[pos[0]][pos[1] + 1] == block){ // find method returns the position of the upper left cell of the block
                delete[] pos;
                return true;
            }
            delete[] pos;
            return false;
        }

        bool is_vertical(int block){
            return !is_horizontal(block);
        }

        bool can_move(int block , Direction dir){
            int* pos = find(block);
            if(is_horizontal(block)){
                if(dir == left){
                    if(pos[1] == 0){
                        delete[] pos;
                        return false;
                    }
                    if(board[pos[0]][pos[1] - 1] != 0){
                        delete[] pos;
                        return false;
                    }
                    delete[] pos;
                    return true;
                }
                if(dir == right){
                    if(pos[1] == 5){
                        delete[] pos;
                        return false;
                    }
                    if(board[pos[0]][pos[1] + 1] != 0){ 
                        delete[] pos;
                        return false;
                    }
                    delete[] pos;
                    return true;
                }
            }
            else{
                if(dir == up){
                    if(pos[0] == 0){
                        delete[] pos;
                        return false;
                    }
                    if(board[pos[0] - 1][pos[1]] != 0){
                        delete[] pos;
                        return false;
                    }
                    delete[] pos;
                    return true;
                }
                if(dir == down){
                    if(pos[0] == 5){
                        delete[] pos;
                        return false;
                    }
                    if(board[pos[0] + 1][pos[1]] != 0){
                        delete[] pos;
                        return false;
                    }
                    delete[] pos;
                    return true;
                }
            }
            delete[] pos;
            return false;
        }
        
        int blockLength(int block){
            int* pos = find(block);
            if(is_horizontal(block)){
                int length = 1;
                while(board[pos[0]][pos[1] + length] == block){
                    length++;
                }
                delete[] pos;
                return length;
            }
            else{
                int length = 1;
                while(board[pos[0] + length][pos[1]] == block){
                    length++;
                }
                delete[] pos;
                return length;
            }
        }

        int howMuchSpace(int block , Direction dir){
            int* pos = find(block);
            if(is_horizontal(block)){
                if(dir == left){
                    int space = 0;
                    while((board[pos[0]][pos[1] - space - 1] == 0) & (pos[1] - space - 1 >= 0)){
                        space++;
                    }
                    delete[] pos;
                    return space;
                }
                if(dir == right){
                    int space = 0;
                    while((board[pos[0]][pos[1] + blockLength(block) + space] == 0) & (pos[1] + blockLength(block) + space <= 5)){
                        space++;
                    }
                    delete[] pos;
                    return space;
                }
            }
            else{
                if(dir == up){
                    int space = 0;
                    while((board[pos[0] - space - 1][pos[1]] == 0) & (pos[0] - space - 1 >= 0)){
                        space++;
                    }
                    delete[] pos;
                    return space;
                }
                if(dir == down){
                    int space = 0;
                    while((board[pos[0] + blockLength(block) + space][pos[1]] == 0) & (pos[0] + blockLength(block) + space <= 5)){
                        space++;
                    }
                    delete[] pos;
                    return space;
                }
            }
            delete[] pos;
            return 0;
        }

        void move(int block , Direction dir){
            if(howMuchSpace(block , dir) == 0){
                cout << "this block can't move in this direction" << endl;
                return;
            }
            // moves++;
            int* pos = find(block);
            int space = howMuchSpace(block , dir);
            int length = blockLength(block);
            if(is_horizontal(block)){
                if(dir == left){
                    for(int i = 0 ; i < length ; i++){
                        // cout << "i = " << i << endl;
                        board[pos[0]][pos[1] - space + i] = block;
                        board[pos[0]][pos[1] + i] = 0;
                    }
                }
                if(dir == right){
                    for(int i = 0 ; i < length ; i++){
                        board[pos[0]][pos[1] + space + i] = block;
                        board[pos[0]][pos[1] + i] = 0;
                    }
                }
                if (dir == up || dir == down){
                    cout << "this block can't move vertically" << endl;
                }
            }
            else{
                if(dir == up){
                    for(int i = 0 ; i < length ; i++){
                        board[pos[0] - space + i][pos[1]] = block;
                        board[pos[0] + i][pos[1]] = 0;
                    }
                }
                if(dir == down){
                    for(int i = 0 ; i < length ; i++){
                        board[pos[0] + space + i][pos[1]] = block;
                        board[pos[0] + i][pos[1]] = 0;
                    }
                }
                if (dir == left || dir == right){
                    cout << "this block can't move horizontally" << endl;
                }
            }
            print();
            delete[] pos;
        }

        char availble_moves(int block){
            if(can_move(block , up) & can_move(block , down))
                return 'a';
            if(can_move(block , up))
                return 'u';
            if(can_move(block , down))
                return 'd';
            if(can_move(block , left) & can_move(block , right))
                return 'b';
            if(can_move(block , left))
                return 'l';
            if(can_move(block , right))
                return 'r';
            return 'n';
        }

        void getInput(int howManyBlocks){
            // ? first we need to clear the board
            for(int i = 0 ; i < 6 ; i++){
                for(int j = 0 ; j < 6 ; j++){
                    board[i][j] = 0;
                }
            }
            // ? now we can get the input
            int x1 , y1 , x2 , y2;
            for(int i = 2 ; i < howManyBlocks + 2 ; i++){
                cin >> x1 >> y1 >> x2 >> y2;
                // cout << "x1 = " << x1 << " y1 = " << y1 << " x2 = " << x2 << " y2 = " << y2 << endl;
                x1--;x2--;y1--;y2--; // ?because the board is 0-indexed
                if(x1 == x2){
                    if(x1 == 2){// ? if the block is the golden block
                        board[x1][y1] = 1;
                        board[x1][y2] = 1;
                    }
                    else{ 
                        for(int j = y1 ; j <= y2 ; j++){
                            board[x1][j] = i;
                        }
                    }
                }
                else{
                    for(int j = x1 ; j <= x2 ; j++){
                        board[j][y1] = i;
                    }
                }
        }
    };
    };

    bord testGame;
    testGame.print();
    
    // int howManyBlocks = 0;
    // cin >> howManyBlocks;
    // testGame.getInput(howManyBlocks);
    // testGame.print();
    


    // !solver
    int* goldenPos = testGame.find(1); 
    for(int i = goldenPos[1] + 2 ; i < 6 ; i++){
        if(testGame.board[2][i] == 0)
            continue;
        if(testGame.blockLength(testGame.board[3][i]) == 3){
            if(testGame.can_move(testGame.board[3][i] , testGame.Direction::down)){
                if(testGame.find(testGame.board[3][i])[0] == 2){
                    testGame.move(testGame.board[3][i] , testGame.Direction::down);
                else if (testGame.find(testGame.board[3][i])[0] == 1){
                    if(testGame.howMuchSpace(testGame.board[3][i] , testGame.Direction::down) == 2){
                        testGame.move(testGame.board[3][i] , testGame.Direction::down);
                    }
                    else if (testGame.howMuchSpace(testGame.board[3][i] , testGame.Direction::down) == 1){
                        if(testGame.blockLength(testGame.board[5][i]) == 3){
                            
                    }
                    
                
            }
        }
    }
    
    testGame.move(1 , testGame.Direction::right);
    cout << testGame.moves << endl;
    
    return 0;
}


