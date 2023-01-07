#№ Отчет по лабораторной работе №3
## по курсу "Логическое программирование"

## Решение задач методом поиска в пространстве состояний

### студент: Никулин К. И.

## Результат проверки

| Преподаватель     | Дата         |  Оценка       |
|-------------------|--------------|---------------|
| Сошников Д.В. |              |               |
| Левинская М.А.|              |               |

> *Комментарии проверяющих (обратите внимание, что более подробные комментарии возможны непосредственно в репозитории по тексту программы)*


## Введение

Поиск в пространстве состояний можно представить как поиск в графе, где каждое возможное состояние будет являться вершиной, а дуги будут задаваться правилами перехода из одного состояния в другое. Таким образом мы можем с помощью стандартных алгоритмов поиска найти решение данной нам задачи в полученном графе. 

Prolog хорошо подходит для решения таких задач, так как в нем можно описать граф, перечислив все дуги в виде пар вершин или при помощи правил. Если при поиске была достигнуто состояние, из которого дальше пути нет, то Prolog перейдет в предыдущее состояние и попробует другие варианты. Благодаря бэктрекингу нет необходимости писать в программе дополнительный код.

## Задание
Вариант 1: Крестьянину нужно переправить волка, козу и капусту с левого берега реки на правый. Как это сделать за минимальное число шагов, если в распоряжении крестьянина имеется двухместная лодка, и нельзя оставлять волка и козу или козу и капусту вместе без присмотра человека.

## Принцип решения

Из начального состояния с помощью move получаем новое состояние. Каждое состояние выглядит в виде графа s(L, X, R), где L - список обьектов, находящихся на левом берегу, X - текущее состоянипе лодки (около какого берега она находится) и R - список обьектов, находящихся на правом берегу.

## Результаты
#### Поиск в глубину с итерационным углублением:
```prolog
?- id_search(s(['Wolf','Goat','Cabbage'],'L',[]),s([],'R',[_,_,_])).       
s([Wolf,Goat,Cabbage],L,[])
s([Wolf,Cabbage],R,[Goat]) 
s([Wolf,Cabbage],L,[Goat]) 
s([Cabbage],R,[Goat,Wolf]) 
s([Cabbage,Goat],L,[Wolf]) 
s([Goat],R,[Wolf,Cabbage]) 
s([Goat],L,[Wolf,Cabbage]) 
s([],R,[Wolf,Cabbage,Goat])

TIME 0.0009450912475585938 
true ;
s([Wolf,Goat,Cabbage],L,[])
s([Wolf,Cabbage],R,[Goat]) 
s([Wolf,Cabbage],L,[Goat]) 
s([Wolf],R,[Goat,Cabbage]) 
s([Wolf,Goat],L,[Cabbage]) 
s([Goat],R,[Cabbage,Wolf]) 
s([Goat],L,[Cabbage,Wolf]) 
s([],R,[Cabbage,Wolf,Goat])

TIME 0.9604480266571045    
true ;
s([Wolf,Goat,Cabbage],L,[])
s([Wolf,Cabbage],R,[Goat]) 
s([Wolf,Cabbage],L,[Goat]) 
s([Cabbage],R,[Goat,Wolf]) 
s([Cabbage,Goat],L,[Wolf])
s([Cabbage],R,[Wolf,Goat])
s([Cabbage,Wolf],L,[Goat])
s([Wolf],R,[Goat,Cabbage])
s([Wolf,Goat],L,[Cabbage])
s([Goat],R,[Cabbage,Wolf])
s([Goat],L,[Cabbage,Wolf])
s([],R,[Cabbage,Wolf,Goat])

TIME 1.2471351623535156
true ;
false.
```
#### Поиск в ширину:
```prolog
?- search_in_width(s(['Wolf','Goat','Cabbage'],'L',[]),s([],'R',[_,_,_])). 
s([Wolf,Goat,Cabbage],L,[])
s([Wolf,Cabbage],R,[Goat])
s([Wolf,Cabbage],L,[Goat])
s([Cabbage],R,[Goat,Wolf])
s([Cabbage,Goat],L,[Wolf])
s([Goat],R,[Wolf,Cabbage])
s([Goat],L,[Wolf,Cabbage])
s([],R,[Wolf,Cabbage,Goat])

TIME 0.0017528533935546875
true ;
s([Wolf,Goat,Cabbage],L,[])
s([Wolf,Cabbage],R,[Goat])
s([Wolf,Cabbage],L,[Goat])
s([Wolf],R,[Goat,Cabbage])
s([Wolf,Goat],L,[Cabbage])
s([Goat],R,[Cabbage,Wolf])
s([Goat],L,[Cabbage,Wolf])
s([],R,[Cabbage,Wolf,Goat])

TIME 1.2532119750976562
true ;
s([Wolf,Goat,Cabbage],L,[])
s([Wolf,Cabbage],R,[Goat])
s([Wolf,Cabbage],L,[Goat])
s([Cabbage],R,[Goat,Wolf])
s([Cabbage,Goat],L,[Wolf])
s([Cabbage],R,[Wolf,Goat])
s([Cabbage,Wolf],L,[Goat])
s([Wolf],R,[Goat,Cabbage])
s([Wolf,Goat],L,[Cabbage])
s([Goat],R,[Cabbage,Wolf])
s([Goat],L,[Cabbage,Wolf])
s([],R,[Cabbage,Wolf,Goat])

TIME 1.353294849395752
true ;
false.
```
#### Поиск в глубину:
```prolog
?- search_in_depth(s(['Wolf','Goat','Cabbage'],'L',[]),s([],'R',[_,_,_])). 
s([Wolf,Goat,Cabbage],L,[])
s([Wolf,Cabbage],R,[Goat]) 
s([Wolf,Cabbage],L,[Goat]) 
s([Cabbage],R,[Goat,Wolf]) 
s([Cabbage,Goat],L,[Wolf]) 
s([Goat],R,[Wolf,Cabbage]) 
s([Goat],L,[Wolf,Cabbage]) 
s([],R,[Wolf,Cabbage,Goat])

TIME 0.0007550716400146484 
true ;
s([Wolf,Goat,Cabbage],L,[])
s([Wolf,Cabbage],R,[Goat]) 
s([Wolf,Cabbage],L,[Goat]) 
s([Cabbage],R,[Goat,Wolf]) 
s([Cabbage,Goat],L,[Wolf]) 
s([Cabbage],R,[Wolf,Goat])
s([Cabbage,Wolf],L,[Goat])
s([Wolf],R,[Goat,Cabbage])
s([Wolf,Goat],L,[Cabbage])
s([Goat],R,[Cabbage,Wolf])
s([Goat],L,[Cabbage,Wolf])
s([],R,[Cabbage,Wolf,Goat])

TIME 0.2298901081085205
true ;
s([Wolf,Goat,Cabbage],L,[])
s([Wolf,Cabbage],R,[Goat])
s([Wolf,Cabbage],L,[Goat])
s([Wolf],R,[Goat,Cabbage])
s([Wolf,Goat],L,[Cabbage])
s([Goat],R,[Cabbage,Wolf])
s([Goat],L,[Cabbage,Wolf])
s([],R,[Cabbage,Wolf,Goat])

TIME 0.3514668941497803
true ;
false.
```
## Выводы

В данной лабораторной работе я научился реализовывать три алгоритма поиска в графе на языке Prolog - в глубину, в ширину и с итеративным погружением и применил эти алгоритмы для решения задачи. Все три алгоритма справились со своей задачей, но наиболее эффективным по времени оказался поиск в глубину.

Выбор алгоритма поиска для задачи зависит от цели и ограничений, которые мы должны учитывать. Если существует ограничение по памяти, то лучше использовать поиск в глубину, если требуется наикратчайший путь, то лучше использовать поиск в ширину. Поиск с итеративным углублением лучше всего использовать для самых простых задач.

