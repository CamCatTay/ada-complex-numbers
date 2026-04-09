/*
NOTES:
Complex Number: a + bi
i -> imaginary number

Adding (add the corresponding real and imaginary parts)
Formula -> (a + bi) + (c + di) = (a + c) + (b + d)i 
Example -> (7 + 8i) + (6 + 3i)  = (7 + 6) + (8 + 3)i = 13 + 11i

Subtracting (subtract the corresponding real and imaginary parts)
Formula -> (a + bi) − (c + di) = (a − c) + (b − d)i 
Example -> (6 + 8i)  -  (3 + 4i) = (6 - 3) + (8 - 4)i = 3 + 4i

Multiplication (same as bionomials)
Formula:
(a + bi) ∗ (c + di) = (a + bi) ∗ c + (a + bi) ∗ di
= (a ∗ c + (b ∗ c)i)+((a ∗ d)i + b ∗ d ∗ −1)
= (a ∗ c − b ∗ d + i(b ∗ c + a ∗ d))   

Example:
(1 + 4i) ∗ (3 + 5i) = (3 + 12i) + (5i + 20i2)
= 3 + 17i − 20
= −17 + 17i

Division (multiplying both the numerator and denominator by the complex conjugate of the denominator.)

*/

#include <iostream>
#include <string>

using namespace std;

class ComplexNumber {
public:
	int num1;
	int num2; // num2 * i

	string getNumber() {
		string operation = "+";
		if (num2 < 0) {
			operation = "";
		}
		return std::to_string(num1) + operation + std::to_string(num2) + "i";
	}
};

class Operation {
public:
	void add(ComplexNumber cnum1, ComplexNumber cnum2) {
		cout << "(" + cnum1.getNumber() + ") + " + "(" + cnum2.getNumber() + ") = ";

		int ac = cnum1.num1 + cnum2.num1; // a + c
		int bd = cnum1.num2 + cnum2.num2; // b + d

		string operation = "+";
		if (bd < 0) {
			operation = "";
		}

		// note to self: I don't need to build a string like in ComplexNumber class when only outputting can use <<
		cout << ac << operation << bd << "i" << endl;
	}

	void subtract(ComplexNumber cnum1, ComplexNumber cnum2) {
		cout << "(" + cnum1.getNumber() + ") - " + "(" + cnum2.getNumber() + ") = ";

		int ac = cnum1.num1 - cnum2.num1; // a + c
		int bd = cnum1.num2 - cnum2.num2; // b + d

		string operation = "+";
		if (bd < 0) {
			operation = "";
		}

		cout << ac << operation << bd << "i" << endl;
	}

	void multiply(ComplexNumber cnum1, ComplexNumber cnum2) {
	    cout << "(" + cnum1.getNumber() + ") * " + "(" + cnum2.getNumber() + ") = ";

	    int a = cnum1.num1;
	    int b = cnum1.num2;
	    int c = cnum2.num1;
	    int d = cnum2.num2;

	    int realPart = a * c - b * d; // ac − bd
	    int imagPart = a * d + b * c; // ad + bc

	    string operation = "+";
	    if (imagPart < 0) {
	        operation = "";
	    }

	    cout << realPart << operation << imagPart << "i" << endl;
	}

	void divide(ComplexNumber cnum1, ComplexNumber cnum2) {
	    cout << "(" + cnum1.getNumber() + ") / " + "(" + cnum2.getNumber() + ") = ";

	    int a = cnum1.num1;
	    int b = cnum1.num2;
	    int c = cnum2.num1;
	    int d = cnum2.num2;

	    int denominator = c * c + d * d;

	    if (denominator == 0) {
	        cout << "error: cannot divide by zero" << endl;
	        return;
	    }

	    double realPart = (a * c + b * d) / (double)denominator;
	    double imagPart = (b * c - a * d) / (double)denominator;

	    string operation = "+";
	    if (imagPart < 0) {
	        operation = "";
	    }

	    cout << realPart << operation << imagPart << "i" << endl;
	}
};

string int_to_string(int num) {
	return std::to_string(num);
}

int random_integer(int min, int max) {
	return min + rand() % (max+1 - min);
}

string random_complex_number(int min, int max) {
	int num1 = random_integer(min, max);
	int num2 = random_integer(min, max);

	return int_to_string(num1) + "+" + int_to_string(num2) + "i";
}

int main() {

	srand(time(0)); // seed rand number generator

	Operation op;

	int min = -10;
	int max = 10;

	ComplexNumber cnum1;
	cnum1.num1 = random_integer(min, max);
	cnum1.num2 = random_integer(min, max);

	ComplexNumber cnum2;
	cnum2.num1 = random_integer(min, max);
	cnum2.num2 = random_integer(min, max);

	// perform operations
	op.add(cnum1, cnum2);
	op.subtract(cnum1, cnum2);
	op.multiply(cnum1, cnum2);
	op.divide(cnum1, cnum2);

	return 0;
}