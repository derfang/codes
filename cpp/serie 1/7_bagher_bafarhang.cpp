// in this code we plan to calculate the time its gonna take for a car to reach a certain distance
// the car is moving with a constant speed of 1 km/min, there are N traffic lights on the way
// each traffic light is red for Ri minutes and green for Gi minutes and the car has to stop at each red light
// at the beginning of the road the first traffic light is red and its gonna be red for Ri minutes
// the distance between each traffic light and the beginning of the road is Di
// the distance between the beginning of the road and the end of the road is L
// we want to calculate the time its gonna take for the car to reach the end of the road

#include <iostream>

using namespace std;

int main()
{
    int N, L;
    cin >> N >> L;
    int Ri[N], Gi[N], Di[N];
    for (int i = 0; i < N; i++)
    {
        cin >> Di[i] >> Ri[i] >> Gi[i];
    }

    int time = 0;

    for (int i = 0; i < N; i++)
    {
        time += Di[i] - (i == 0 ? 0 : Di[i - 1]);
        time += (time % (Ri[i] + Gi[i]) < Ri[i] ? Ri[i] - (time % (Ri[i] + Gi[i])) : 0);
    }
    time += L - Di[N - 1];

    cout << time << endl;
}