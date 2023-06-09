//
// Instructions to run test:
// Copy 'example_tests' folder from this repo to `<TERMINAL DIR>/MQL(4/5)/Include`
//
// ---------------------------------------------------------------------------------
#property copyright "Copyright © 2019-2021 Artem Maltsev (Vivazzi)"
#property link      "https://vivazzi.pro"
#property description   "Tests for mql_unit_test"
#property strict

#include <example_tests/math.mqh>
#include <example_tests/extended.mqh>


int OnStart() {
    MathTest math_test;
    math_test.set_output_file_path("/my_tests/math_test.log");
    math_test.run();

    MyFunctionTest my_function_test;
    my_function_test.set_output_file_path("/my_tests/my_function_test.log");
    my_function_test.run();

    return(INIT_SUCCEEDED);
}