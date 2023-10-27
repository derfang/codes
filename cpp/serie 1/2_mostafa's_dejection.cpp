// in this code we plan to the number of questions that user wants to ask and then
// the user enters hir/her questions and then the program checks if each entered number
// satisfies the following condition: it must be the result of the sum of an intiger with is's digits
// for example
/*input:
3
97
119
1311
*/

/*output:
No
Yes
No
*/

#include <iostream>
using namespace std;

int main()
{
    int n;
    cin >> n;
    int question[n];
    int temp;
    int sumOfDigits;
    for (int i = 0; i < n; i++)
    {
        cin >> question[i];
    }
    for (int i = 0; i < n; i++)
    {
        for (int numberToBeChecked = question[i] > 500 ? question[i] - 250 : question[i] / 2; numberToBeChecked <= question[i]; numberToBeChecked++)
        {
            if (numberToBeChecked == question[i])
            {
                cout << "No" << endl;
                break;
            }
            sumOfDigits = 0;
            temp = numberToBeChecked;

            while (temp != 0)
            {
                sumOfDigits += temp % 10;
                temp = temp / 10;
            }

            if (numberToBeChecked + sumOfDigits == question[i])
            {
                cout << "Yes" << endl;
                break;
            }
        }
    }
    return 0;
}

// #include <iostream>
// using namespace std;

// int numbers[1000000];
// int temp;
// int sumOfDigits;
// int initialNumber;

// int main()
// {
//     for (int i = 0; i < 1000000; i++)
//     {
//         numbers[i] = i;
//     }

//     for (int i = 0; i < 1000000; i++)
//     {
//         sumOfDigits = 0;
//         temp = numbers[i];

//         while (temp != 0)
//         {
//             sumOfDigits += temp % 10;
//             temp = temp / 10;
//         }

//         numbers[i] += sumOfDigits;
//     }

//     int n;
//     cin >> n;
//     int question[n];
//     for (int i = 0; i < n; i++)
//     {
//         cin >> question[i];
//     }
//     for (int i = 0; i < n; i++)
//     {
//         if (question[i] > 1000)
//         {
//             initialNumber = question[i] - 100;
//         }
//         else
//         {
//             initialNumber = question[i] / 2;
//         }

//         for (int j = initialNumber; j <= 1000000; j++)
//         {
//             if (j == 1000000)
//             {
//                 cout << "No" << endl;
//                 break;
//             }

//             if (question[i] == numbers[j])
//             {
//                 cout << "Yes" << endl;
//                 break;
//             }
//         }
//     }
//     return 0;
// }
