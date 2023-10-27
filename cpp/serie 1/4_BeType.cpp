// in this program we take a string from the user and we change it so that we replace ever occurance of '='
// as if it was a Backspace key and we print the result

#include <iostream>
#include <string>
using namespace std;

int main()
{
    string str;
    getline(cin, str);
    while (str.find('=') != string::npos)
    {
        int pos = str.find('=');   // find the position of the '='
        if (pos == 0)              // if the '=' is the first character in the string
            str.erase(0, 1);       // erase the '='
        else                       // if the '=' is not the first character in the string
            str.erase(pos - 1, 2); // erase the character before the '=' and the '=' itself
    }
    cout << str;
    return 0;
}