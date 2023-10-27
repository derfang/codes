#include <iostream>
#include <string>

using namespace std;

int main()
{
    string str = "0123456789";
    size_t number = 11;
    cout << (str.length() < number) << endl;
    cout << (str[number-10]) << endl;
}