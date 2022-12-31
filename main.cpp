#include <iostream>

using namespace std;

class Carly {
public:
	int j;
	Carly() {
		j = 5;
	}
};

class myClass {
private:
	int i;
public:
	int getI() {
		return i;
	}
};

extern "C" int bigRegisters();
extern "C" int dataTypes();
extern "C" int movLearning();
extern "C" int leaLearning();
extern "C" int basicArithmetic();
extern "C" int booleanAlgebra();
//extern "C" int shiftIntructions();
extern "C" int flagStuff();
extern "C" int conditions();
extern "C" int divisionStuff();
extern "C" int GCD_ASM(int a, int b);
extern "C" int cCallingConvention(int a, int b, float c, short int i);
extern "C" int passingObjects(Carly c);
extern "C" float passingPointers(Carly* c);
extern "C" int controlStructuresIFs();
extern "C" int controlStructuresCompoundIFs();
extern "C" int controlStructuresWhileLoop();
extern "C" int controlStructuresDoWhileLoop();
extern "C" int controlStructuresNormalASMLoop();
extern "C" int controlStructuresForLoop();
extern "C" int structureStuffASM();
extern "C" int structureStuffCPP(myClass& m);
extern "C" int simdstuff();
extern "C" int BasicSIMDFloatingPointArithmetic();

int printBinary(int i) {
	for (int s = 64; s >= 0; --s) {
		cout << ((i >> s) & 1);
	}
	cout << endl;
	return i;
}



//int GCD(int a, int b) {
//	if (a <= 0 || b <= 0) {
//		return 0;
//	}
//
//	while (b != 0) {
//		int tmp = b;
//		b = a % b;
//		a = tmp;
//	}
//	
//	return a;
//}

int main() {
	//bigRegisters();
	//int returnValue = dataTypes();
	//int returnValue = movLearning();
	//int returnValue = leaLearning();
	//int returnValue = basicArithmetic();
	//printBinary(booleanAlgebra());
	//int returnValue = printBinary(shiftIntructions());
	//int returnValue = flagStuff();
	//int returnValue = conditions();
	//int returnValue = divisionStuff();
	//int returnValue = GCD(3453, 345);
	//int returnValue = GCD_ASM(76, 76);
	//int returnValue = cCallingConvention(54, 23, 56.2f, 67);

	//Carly g;
	//int returnValue = passingObjects(g);
	//Carly* gPtr = &g;
	//float returnValue = passingPointers(gPtr);

	//int returnValue = controlStructuresIFs();
	//int returnValue = controlStructuresCompoundIFs();
	//int returnValue = controlStructuresWhileLoop();
	//int returnValue = controlStructuresDoWhileLoop();
	//int returnValue = controlStructuresNormalASMLoop();
	//int returnValue = controlStructuresForLoop();
	//int returnValue = structureStuffASM();
	
	//myClass m;
	//int returnValue = structureStuffCPP(m);
	//cout << "The private value is now: " << m.getI() << endl;

	//int returnValue = simdstuff();
	int returnValue = BasicSIMDFloatingPointArithmetic();

	cout << "The output was: " << returnValue << endl;

	return 0;
}