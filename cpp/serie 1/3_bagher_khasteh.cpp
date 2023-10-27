// in this code we take 5 lines of string from the user and print the number of the lines that
// have  certain sub-strings

#include <iostream>
#include <string>
using namespace std;

int main()
{
    string str[5];
    for (int i = 0; i < 5; i++)
    {
        getline(cin, str[i]);
    }
    for (int i = 0; i < 5; i++)
    {
        if (str[i].find("MOLANA") != string::npos || str[i].find("HAFEZ") != string::npos)
        {
            cout << i + 1 << " ";
        }
    }
    return 0;
}