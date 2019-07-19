
void test(int a, int b, int c, int d, int e, int f) {
//void test(int a, int c, int d, int x, int y, int z) {
        //        a = b * c;
        //        d = b;
        //        b = b +1;
        //        e = d * c;
        //        f = b * c;
    a = b + c;
    b = a - d;
    c = b + c;
    d = a - d + e * 5;
}

void test1(int a, int b, int c, int d, int e, int f, int g) {
    c = a + b;
    d = c + 5;
    e = a + b;
    f = e + 5;
    g = d + f;
}

void test2(int a, int b, int c, int x, int y) {
    b = x + y;
    a = x + y;
    a = 17;
    c = x + y;
}

void test3(int a, int c, int d, int x, int y, int z) {
    a = x + y;
    z = y;
    d = 17;
    c = x + z;
}

void test4(int a, int b, int c, int d) {
    a = b + c;
    b = a - d;
    c = b + c;
    d = a - d;
}

void test5(int a, int b, int c, int d, int e) {
    a = b * c;
    d = b;
    c = a + b;
    e = d * c;
    d = c + 5;
}

void test6(int a, int b, int c, int d, int e, int i, int j, int t1, int t2, int t3, int t4) {
    a = 10;
    b = 40;
    t1 = i * j;
    c = t1 + 40;
    t2 = 150;
    d = 150 * c;
    e = i;
    t3 = i * j;
    t4 = i * 10;
    c = t1 + t4;
}

int main(int argc, char** argv) {
	test(10, 11, 25, 33, 43,26);
    test1(10, 11, 25, 33, 43,26, 44);
  return 0;
}