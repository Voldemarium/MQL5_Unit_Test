В mql4 и mql5 есть Тестер стратегий, но нет стандартной библиотеки для тестирования простых своих написанных функций. Такое тестирование ещё имеет название **Модульное тестирование** или **unit-тестирование**.

Для тестирования своих функций я написал библиотеку **mql_unit_test**, который доступен на гитхабе:  
[https://github.com/vivazzi/mql_unit_test](https://github.com/vivazzi/mql_unit_test)

## Установка mql_unit_test

Скачайте библиотеку и скопируйте папку `mql_unit_test/Include/unit_test` в `<TERMINAL DIR>/MQL(4/5)/Include`.

## Использование

С помощью **mql_unit_test** вы можете простым способом тестировать ваши функции, а результаты тестов получать в текстовом файле, например:

#include <unit_test/unit_test.mqh>

double min(double v_1, double v_2) {
    if (v_1 > v_2) return v_2;

    return v_1;
}

class MyTest: public TestCase {

    void test_my_function_min() {
        assert_equal(min(4, 10), 4);
        assert_equal(min(8, 1), 1);
        assert_equal(min(5, 0), 5);  // test fails
    }

    void declare_tests() {
        test_my_function_min();
    }
};


int OnInit(){
    MyTest my_test;
    my_test.run();

    return(INIT_SUCCEEDED);
}

Затем откопилируйте данный код и запустите этот Эксперт / Скрипт в торговом окне: программа выполнит ваши юнит тесты. Результаты тестов вы можете увидеть в папке `<TERMINAL DIR>/MQL(4/5)/Include` Для теста выше результат будет следующим:

--- 2021.02.18 15:53: Unit Test: passed tests 2 from 3 (elapsed time: 0 sec) ---
TestUnitTest.mq4(30), MyTest::test_my_function_min(): 0 != 5

В логе вы можете видеть, на какой строчке в какой функции тест провалился.

В `README.md` пакета на гитхабе вы можете найти более полную и актуальную документацию **mql_unit_test**:  
[https://github.com/vivazzi/mql_unit_test](https://github.com/vivazzi/mql_unit_test)

Оцените статью

0 из 5 (всего 0 оценок)

Автор статьи

[![](https://vivazzi.pro/static/template/images/author_x2.jpg)](https://vivazzi.pro/ru/me/)

[Артём Мальцев](https://vivazzi.pro/ru/me/)

Веб-разработчик, владеющий знаниями языка программирования Python, фреймворка Django, системы управления содержимым сайта Django CMS, платформы для создания интернет-магазина Django Shop и многих различных приложений, использующих эти технологии.