#include<math.h>
#include<iostream>


using namespace std;

int main()
{
	int a, b, c, discriminant;
	float r1, r2;
	cout << "enter the values of a, b, c:";
	cin >> a >> b >> c;
	discriminant = ((b*b) - 4 * a*c);
	if (discriminant>0)
	{
		r1 = (-1 * b + sqrt(discriminant)) / (2 * a);
		r2 = (-1 * b - sqrt(discriminant)) / (2 * a);
	}
	else if (discriminant == 0)
	{
		r1 = r2 = (-1 * b) / (2 * a);
	}
	else
	{
		discriminant = -1 * discriminant;
		cout << "r1=" << "(" << (-1 * b) << "+ i" << sqrt(discriminant) << ")/" << 2 * a;
		cout << "r1=" << "(" << (-1 * b) << "+ i" << sqrt(discriminant) << ")/" << 2 * a;
		exit(0);
	}
	cout << "r1=" << r1 << "\n";
	cout << "r2=" << r2 << "\n";
	return 0;
}