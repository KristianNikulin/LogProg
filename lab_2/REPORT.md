#№ Отчет по лабораторной работе №2
## по курсу "Логическое программирование"

## Решение логических задач

### студент: Никулин К. И.

## Результат проверки

| Преподаватель     | Дата         |  Оценка       |
|-------------------|--------------|---------------|
| Сошников Д.В. |              |               |
| Левинская М.А.|              |               |

> *Комментарии проверяющих (обратите внимание, что более подробные комментарии возможны непосредственно в репозитории по тексту программы)*


## Введение

Существует два наиболее распространённых способа решения логических задач - полный перебор решений и метод исключения. В первом способе перебираются все возможные варианты, а также для различных значений проверяется истинность остальных высказываний. Второй способ предполагает, что мы можем сразу попытаться определить противоречащие друг другу случаи и отсечь их, благодаря чему сузить количество возможных вариантов. Сама структура логических задач построена на высказываниях, которые достаточно легко переносятся на логику предикатов, с которой и работает Prolog. Благодаря чему достаточно описать все высказывания из задачи и Prolog выведет все решения, если они есть.

## Задание

Вариант 16: 

Комендант переселял студентов на время ремонта общежития. Дело это не простое. Судите сами. На очередную комнату было 8 кандидатов, а поселить в нее можно было только четырех. Пошел комендант расспрашивать студентов, кто с кем жить хочет. Вот, что он услышал: Андрей согласен на любых соседей. Борис без Кости не переселится. Костя не хочет жить в одной комнате с Василием. Василий согласен жить с кем угодно. Дима не будет переселяться без Юры. Федя не будет без Гриши жить в одной комнате с Димой, а без Димы не будет жить в одной комнате с Костей. Гриша не хочет, чтобы его соседями были Борис и Костя вместе, а кроме того он не желает жить в одной комнате ни с Андреем, ни с Василием. Юра даст согласие переехать в новую комнату, если туда же переберутся либо Борис, либо Федя. Кроме того, Юра не будет жить в одной комнате с Костей, если туда не переедет Гриша, и не желает жить в одной комнате ни с Андреем, ни с Василием. Каким образом комендант смог учесть все пожелания?

## Принцип решения

Делаю проверку всех возможных случаев описанных в задаче и если какое-то условие не выполняется, делаю отсечение. Чтобы программа не показывала все варианты решения, также использую отсечение.

Примеры использования:
```prolog
?- solve(L).
L = [grisha, dima, fedya, yura].

?- solve([grisha, dima, fedya, yura]).
true.

?- solve([grisha, dima, yura, fedya]).
true.

?- solve([grisha, dima, yura, anatoly]).
false.
```

## Выводы

Выполнив данную работу, я приобрел навык решения логических задач с использованием языка Prolog. Этот язык очень удобен для решения подобных задач. Описав ряд условий, мы отсекаем неподходящие варианты и находим нужное решение. Это намного проще, если бы мы вручную проверяли все возможные варианты решения. Благодаря Prolog, мы можем думать над самой задачей и логикой её решения, а не над механизмом ее реализации. Это позволяет решать логические задачи напрямую, не тратя лишние силы и время.






