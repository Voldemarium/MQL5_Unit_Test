#property copyright "Copyright © 2019-2021 Artem Maltsev (Vivazzi)"
#property link      "https://vivazzi.pro"
#property description   "Tests for mql_unit_test"
#property strict


#include <unit_test/unit_test.mqh>


class SimpleTest: public TestCase {
    void test_math_abs() {
        assert_equal(MathAbs(-1.25), 1.25);
        assert_equal(MathAbs(2.15), 2.15);
    }

    void test_string_len() {
        assert_equal(StringLen("xxx"), 3);
        assert_equal(StringLen("some string"), 5);  // test fails
    }

    void declare_tests() {
        test_math_abs();
        test_string_len();
    }
};


double min(double v_1, double v_2) {
    if (v_1 > v_2) return v_2;

    return v_1;
}


class MyFunctionTest: public TestCase {
    void test_my_function_min() {
        assert_equal(min(4, 10), 4);
        assert_equal(min(8, 1), 1);
        assert_equal(min(5, 0), 5);  // test fails
    }

    void declare_tests() {
        test_my_function_min();
    }
};


int OnStart() {
    SimpleTest simple_test;
    simple_test.run();

    MyFunctionTest my_function_test;
    my_function_test.set_output_file_path(MQLInfoString(MQL_PROGRAM_NAME) + "_MyFunctionTest_unit_test.log");  // long name
    my_function_test.run();

    return(INIT_SUCCEEDED);
}