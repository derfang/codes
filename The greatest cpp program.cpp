#include <iostream>
using namespace std;

int main()
{
    cout << "Hello World!" << endl
         << "I am learning C++" << endl;
    for (int i = 0; i < 60; i++)
    {
        cout << '1' + i << " = " << char('1' + i) << endl;
    }
    cout << "-----------------------------------------------------" << endl;
    cout << 9 / 8 << " " << 9.0 / 8 << " " << (float)9 / 8 << endl; // intigers can be converted to float by typecasting
    cout << "-----------------------------------------------------" << endl;
    int a = 5;
    int b = a++;
    int c = ++a;
    cout << a << " " << b << " " << c << endl; // b is pre-incremented and c is post-incremented
    cout << "-----------------------------------------------------" << endl;
    cout << (b < a ? "this is true" : "this is false") << endl; // ternary operator
    if (a < b)
    {
        cout << "this is false" << endl;
    }
    else
    {
        cout << "this is true" << endl;
    }
    cout << "-----------------------------------------------------" << endl;
    int myArray[5] = { 1, 2, 3, 4, 5 };
    cout << myArray[0] << endl;
    return 0;
}
