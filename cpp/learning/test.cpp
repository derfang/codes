#include <bits/stdc++.h>
using namespace std;

int main()
{
    class myClass
    {
    public:
        myClass(int num, string text): myNum(num++), myNum2(num++), myString(text) {}
        int myNum2;
        string myString;
        int myNum;
    };
    myClass myObj(10, "Hello World");
    cout << myObj.myNum << endl;
    cout << myObj.myNum2 << endl;
    cout << myObj.myString << endl;

    return 0;
}
