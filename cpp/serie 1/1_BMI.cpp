//? I will exactly follow the the input and output format provided in the question witch is as follows:
/*input format
93
1.71
*/
/*output format
31.80
Obese
*/
#include <iostream>
#include <iomanip> // for setprecision()
using namespace std;

int main()
{
    int weight;
    float height;
    cin >> weight >> height;
    // if (weight <= 1 || height <= 1 || height >= 10 || weight >= 200) //! these condition were provided in the question but it didn't mentioned how to handle them so i just printed "Invalid Input"
    // {
    //     cout << "Invalid Input";
    //     return 0;
    // }

    float bmi = weight / (height * height);
    cout << fixed << setprecision(2) << bmi << endl; // fixed and setprecision() is used to print the float value upto 2 decimal places
    if (bmi < 18.5)
    {
        cout << "Underweight";
    }
    else if (bmi >= 18.5 && bmi < 25)
    {
        cout << "Normal";
    }
    else if (bmi >= 25 && bmi < 30)
    {
        cout << "Overweight";
    }
    else
    {
        cout << "Obese";
    }
    return 0;
}
