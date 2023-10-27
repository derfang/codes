// in this program we take two strings from the user and we check how many of the second string
// we can make by using the letters of the first string
// be noted that there's gonna be just english small case letters, numbers and spaces in the strings
//? example:
/* input:
abracadabra 2018 codeknock
ab cd
*/
/* output:
2
*/

#include <iostream>
#include <string>

using namespace std;

int main()
{
    string s, agahi;
    getline(cin, s);
    getline(cin, agahi);
    // there are 10 numbers, 26 english letters and 1 space over all
    int numbers_counter_S[10] = {0}, numbers_counter_agahi[10] = {0};
    int letters_counter_S[26] = {0}, letters_counter_agahi[26] = {0};
    int space_counter_S = 0, space_counter_agahi = 0;

    //? we must find out how many spaces are occured in each string
    for (int i = 0; i < s.length(); i++)
    {
        if (s[i] == ' ')
            space_counter_S++;
    }
    for (int i = 0; i < agahi.length(); i++)
    {
        if (agahi[i] == ' ')
            space_counter_agahi++;
    }

    //? now we must find out how many of each letter is occured in each string
    for (int i = 0; i < 10; i++)
    {
        for (int j = 0; j < s.length(); j++)
        {
            if (s[j] == i + '0')
                numbers_counter_S[i]++;
        }
        for (int j = 0; j < agahi.length(); j++)
        {
            if (agahi[j] == i + '0')
                numbers_counter_agahi[i]++;
        }
    }

    for (int i = 0; i < 26; i++)
    {
        for (int j = 0; j < s.length(); j++)
        {
            if (s[j] == i + 'a')
                letters_counter_S[i]++;
        }
        for (int j = 0; j < agahi.length(); j++)
        {
            if (agahi[j] == i + 'a')
                letters_counter_agahi[i]++;
        }
    }

    //? now to check how many of the second string we can make by using the letters of the first string
    //? we must compare the ratio of each letter in the first string to its counterpart in the second string and choose the minimum

    int min = 200000;
    for (int i = 0; i < 10; i++)
    {
        if (numbers_counter_agahi[i] != 0) //! it's impportant to check if the letter is even nacaesary in the Agahi
        {
            if (numbers_counter_S[i] / numbers_counter_agahi[i] < min)
                min = numbers_counter_S[i] / numbers_counter_agahi[i];
        }
    }

    for (int i = 0; i < 26; i++)
    {
        if (letters_counter_agahi[i] != 0)
        {
            if (letters_counter_S[i] / letters_counter_agahi[i] < min)
                min = letters_counter_S[i] / letters_counter_agahi[i];
        }
    }

    if (space_counter_agahi != 0)
    {
        if (space_counter_S / space_counter_agahi < min)
            min = space_counter_S / space_counter_agahi;
    }

    cout << min << endl;

    //? for debugging purposes
    // cout << "-----------------------------------" << endl;
    // cout << "numbers_counter_S: ";
    // for (int i = 0; i < 10; i++)
    // {
    //     cout << numbers_counter_S[i] << " ";
    // }
    // cout << endl;
    // cout << "numbers_counter_agahi: ";
    // for (int i = 0; i < 10; i++)
    // {
    //     cout << numbers_counter_agahi[i] << " ";
    // }
    // cout << endl;
    // cout << "-----------------------------------" << endl;
    // cout << "space_counter_S: " << space_counter_S << endl;
    // cout << "space_counter_agahi: " << space_counter_agahi << endl;
}