// in this code we take a number from the user we replace it with the sum of its digits
// than we repeat the process until we get a single digit number
// be mindful of the fact that that the number can be a very large number as big as 10^18

#include <iostream>

using namespace std;

int main()
{
    long long int num;
    cin >> num;
    while (num > 9)
    {
        int sum = 0;
        while (num > 0)
        {
            sum += num % 10;
            num /= 10;
        }
        num = sum;
    }
    cout << num;
}