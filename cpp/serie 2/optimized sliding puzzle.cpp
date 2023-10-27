// in this code we will implement a algorithm to solve a simpleized version the
// game : Move the Block : Slide Puzzle the game is a 6*6 board with some
// rectangrular blocks in it. the goal is to move the horizontal block that is
// placed in 3rd row to the exit of the board(we call it the golden block). the
// exit is the 3rd row and 6th column. horizontal blocks can only move
// horizontally and vertical blocks can only move vertically. in the begining we
// get the number of blocks and their head and tail coordinates. the golden
// block we allways be the first block in the queue. we will now foucs on making
// the game instead of solving it.

// in the board we will use 10 for empty cells and 11 for the golden block and
// 11+ (id of the block) for other blocks.
// ? you may ask why? well, with this method we can easily print the board
// ? without any if statements.

#include <bits/stdc++.h>
using namespace std;

int main() {
  enum direction { forward, backward };

  class point {
   public:
    int x, y;
  };

  class block {
   public:
    bool operator==(const block& b) const {
      return (head.x == b.head.x && head.y == b.head.y && tail.x == b.tail.x &&
              tail.y == b.tail.y && id == b.id);
    }
    int id;
    point head, tail;
    int size() {
      if (isHorizontal())
        return tail.x - head.x + 1;
      else
        return tail.y - head.y + 1;
    }
    bool isHorizontal() { return head.y == tail.y; }
    void print() {
      cout << "id: " << id << endl;
      cout << "head: " << head.x + 1 << " " << head.y + 1 << endl;
      cout << "tail: " << tail.x + 1 << " " << tail.y + 1 << endl;
      cout << "size: " << size() << endl;
      cout << "isHorizontal: " << isHorizontal() << endl;
    }
  };

  class state {
   public:
    int howManyBlocks;
    vector<block> blocks;
    bool operator==(const state& s) const {
      for (int i = 0; i < 6; i++)
        for (int j = 0; j < 6; j++)
          if (board[i][j] != s.board[i][j]) return false;
      return true;
    }
    void operator=(const state& s) {
      for (int i = 0; i < 6; i++)
        for (int j = 0; j < 6; j++) board[i][j] = s.board[i][j];
      blocks = s.blocks;
      depth = s.depth;
      howManyBlocks = s.howManyBlocks;
    }
    bool operator<(const state& s) const {
      if (depth != s.depth) {
        return (depth < s.depth);
      } else {
        return std::lexicographical_compare(&board[0][0], &board[0][0] + 36,
                                            &s.board[0][0],
                                            &s.board[0][0] + 36);
      }
    }
    int board[6][6] = {
        {10, 10, 10, 10, 10, 10},  //? we initialize the board
        {10, 10, 10, 10, 10, 10},  //? to bypass garbage innitialization
        {10, 10, 10, 10, 10, 10},
        {10, 10, 10, 10, 10, 10},
        {10, 10, 10, 10, 10, 10},
        {10, 10, 10, 10, 10, 10}};  // 10 for empty cells

    /* this is for sole prourposes of bypassing auto formatter
    {{10, 10, 10, 10, 10, 10},
    {10, 10, 10, 10, 10, 10},
    {10, 10, 10, 10, 10, 10},
    {10, 10, 10, 10, 10, 10},
    {10, 10, 10, 10, 10, 10},
    {10, 10, 10, 10, 10, 10}};  // 10 for empty cells
    */
    int depth;  // depth of the state in the tree
    bool isGoal() { return board[2][5] == 11; }
    void print() {
      for (int i = 0; i < 6; i++) {
        for (int j = 0; j < 6; j++) cout << board[i][j] << "  ";
        cout << endl;
      }
      cout << endl;
    }
    void addBlockFromInput(block b) {  // ? this is for the fist time
      if (b.isHorizontal()) {
        for (int i = b.head.x; i <= b.tail.x; i++) board[b.head.y][i] = b.id;
        blocks.push_back(b);
      } else {
        for (int i = b.head.y; i <= b.tail.y; i++) board[i][b.head.x] = b.id;
        blocks.push_back(b);
      }
    }
    bool isLegalMove(block b, direction d) {
      if (d == forward) {
        if (b.isHorizontal()) {
          if (b.tail.x == 5) return false;
          if (board[b.head.y][b.tail.x + 1] != 10) return false;
        } else {
          if (b.tail.y == 5) return false;
          if (board[b.tail.y + 1][b.head.x] != 10) return false;
        }
      } else {
        if (b.isHorizontal()) {
          if (b.head.x == 0) return false;
          if (board[b.head.y][b.head.x - 1] != 10) return false;
        } else {
          if (b.head.y == 0) return false;
          if (board[b.head.y - 1][b.head.x] != 10) return false;
        }
      }
      return true;
    }
    bool moveBlock(block b, direction d) {
      block temp = blocks[b.id - 11];
      if (!isLegalMove(temp, d)) return false;
      removeBlock(temp);
      if (d == forward) {
        if (temp.isHorizontal()) {
          temp.head.x++;
          temp.tail.x++;
        } else {
          temp.head.y++;
          temp.tail.y++;
        }
      } else {
        if (temp.isHorizontal()) {
          temp.head.x--;
          temp.tail.x--;
        } else {
          temp.head.y--;
          temp.tail.y--;
        }
      }
      addBlock(temp);
      return true;
    }

   private:
    void removeBlock(block b) {
      if (b.isHorizontal()) {
        for (int i = b.head.x; i <= b.tail.x; i++) board[b.head.y][i] = 10;
        // blocks.erase(find(blocks.begin(), blocks.end(), b));
      } else {
        for (int i = b.head.y; i <= b.tail.y; i++) board[i][b.head.x] = 10;
        // blocks.erase(find(blocks.begin(), blocks.end(), b));
      }
    }
    void addBlock(block b) {  // ? this is for internal use
      if (b.isHorizontal()) {
        for (int i = b.head.x; i <= b.tail.x; i++) board[b.head.y][i] = b.id;
        blocks[b.id - 11] = b;
      } else {
        for (int i = b.head.y; i <= b.tail.y; i++) board[i][b.head.x] = b.id;
        blocks[b.id - 11] = b;
      }
    }
  };
  //-------------------------------------------------------------------------------
  // state test;  // ! u can test the classes and their methods here, dear TA
  // block b1, b2;
  // b1.id = 11;
  // b1.head.x = 0;
  // b1.head.y = 2;
  // b1.tail.x = 1;
  // b1.tail.y = 2;
  // b2.id = 12;
  // b2.head.x = 0;
  // b2.head.y = 0;
  // b2.tail.x = 0;
  // b2.tail.y = 1;
  // test.addBlockFromInput(b1);
  // test.addBlockFromInput(b2);
  // test.print();
  // cout << endl;
  // test.blocks[0].print();
  // cout << endl << test.moveBlock(b1, forward) << endl;
  // test.print();
  // test.blocks[0].print();

  // cout << endl << test.moveBlock(b1, forward) << endl;
  // test.print();
  // test.blocks[0].print();
  // cout << endl << test.isGoal() << endl;
  // cout << endl << test.isLegalMove(b1, backward) << endl;
  //-------------------------------------------------------------------------------
  // ? now we will implement the algorithm to take input and solve the game
  int n;  // number of blocks
  cin >> n;
  state start;
  start.howManyBlocks = n;
  start.depth = -1; // we start from -1 because we will increment it before checking the goal state
  block goldenBlock;
  goldenBlock.id = 11;
  int x1, y1, x2, y2;
  cin >> y1 >> x1 >> y2 >> x2;
  //?inputs are reversed comparing to standard vectors
  goldenBlock.head.x = x1 - 1;
  goldenBlock.head.y = y1 - 1;  //? we use 0 based index in cpp
  goldenBlock.tail.x = x2 - 1;
  goldenBlock.tail.y = y2 - 1;  //? but user input is 1 based
  start.addBlockFromInput(goldenBlock);
  for (int i = 0; i < n - 1; i++) {
    block temp;
    cin >> y1 >> x1 >> y2 >> x2;
    temp.id = 12 + i;
    temp.head.x = x1 - 1;
    temp.head.y = y1 - 1;
    temp.tail.x = x2 - 1;
    temp.tail.y = y2 - 1;
    start.addBlockFromInput(temp);
  }

  // start.print();
  // cout << (start.moveBlock(start.blocks[1], forward) ? "true" : "false")
  //      << endl;
  // start.blocks[1].print();
  // start.print();

  // ? we will use BFS to solve the game as stated previously
  // ? we will use a queue to store the states and a set to store the visited
  // ! its important to note that whether we move a block by one or more cells
  // ! does not matter in terms of depth

  queue<state> q;  // queue of states used for holding the states
  set<state> visited;
  q.push(start);
  visited.insert(start);
  while (!q.empty()) {
    state temp;
    temp = q.front();
    q.pop();
    temp.depth++;
    if (temp.isGoal()) {
      cout << temp.depth << endl;
      return 0;
    }
    for (int i = 0; i < temp.howManyBlocks; i++) {
      state temp2;
      temp2 = temp;
      // temp2.blocks[i].print();
      while (temp2.moveBlock(temp2.blocks[i], forward)) {
        if (visited.find(temp2) == visited.end()) {
          q.push(temp2);
          visited.insert(temp2);
          // temp2.print();
        }
      }
      temp2 = temp;
      while (temp2.moveBlock(temp2.blocks[i], backward)) {
        if (visited.find(temp2) == visited.end()) {
          q.push(temp2);
          visited.insert(temp2);
          // temp2.print();
        }
      }
    }
    // q.front().print();
    // return 0;
  }
  return 0;
}
