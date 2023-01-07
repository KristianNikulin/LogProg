% Task 2: Relational Data

% Номер по списку - 16

% The line below imports the data
:- ['one.pl'].

% Реляционное представление предметной области
% Представление - 1, вариант - 2
/*
Вариант 2
    - Напечатать средний балл для каждого предмета
    - Для каждой группы, найти количество не сдавших студентов
    - Найти количество не сдавших студентов для каждого из предметов
*/

% Напечатать средний балл для каждого предмета
% С помощью bagof получаем 5 списков с каждым типом оценки и считаем количество каждой из оценок. После чего присваиваем кол-во в переменную Count_of_all_grades_of_subfect,
% а сумму всех оценок в переменную Summ_of_all_grades_of_subfect. Находим среднее значение оценки (Answer) по предмету, разделив сумму на кол-во

amount_of_grades_of_subject(Answer, Name, Subject) :- grade(Name, Subject, Answer).

average_grade_in_subject(Subject, Answer) :- 
bagof(X, amount_of_grades_of_subject(2, X, Subject), Grade_2), 
bagof(X, amount_of_grades_of_subject(3, X, Subject), Grade_3), 
bagof(X, amount_of_grades_of_subject(4, X, Subject), Grade_4), 
bagof(X, amount_of_grades_of_subject(5, X, Subject), Grade_5),
length(Grade_2, Count_grade_2), 
length(Grade_3, Count_grade_3), 
length(Grade_4, Count_grade_4), 
length(Grade_5, Count_grade_5), 
Count_of_all_grades_of_subfect is Count_grade_2 + Count_grade_3 + Count_grade_4 + Count_grade_5, 
Summ_of_all_grades_of_subfect is Count_grade_2 * 2 + Count_grade_3 * 3 + Count_grade_4 * 4 + Count_grade_5 * 5, 
Answer is Summ_of_all_grades_of_subfect / Count_of_all_grades_of_subfect.
%?- average_grade_in_subject('LP', X).
% X = 3.9642857142857144.
%?- average_grade_in_subject(S, X).
% S = 'ENG',
% X = 4.178571428571429 ;
% S = 'FP',
% X = 3.892857142857143 ;
% S = 'INF',
% X = 3.5714285714285716 ;
% S = 'LP',
% X = 3.9642857142857144 ;
% S = 'MTH',
% X = 3.6785714285714284 ;
% S = 'PSY',
% X = 3.607142857142857.

% Для каждой группы, найти количество не сдавших студентов
% С помощью setof получаем упорядоченный список List уникальных студентов нужной группы кто не сдал экзамен (оценка 2) 
% и с помощью length считаем количество несдавших студентов (длину List)

names_of_failed_students(Name, Group) :- grade(Name, _, 2), student(Group, Name).
count_of_failed_students(Group, Answer) :- setof(X, names_of_failed_students(X, Group), List), length(List, Answer).
%?- count_of_failed_students(101, X).
% X = 2
%?- count_of_failed_students(103, X).
% X = 3
%?- count_of_failed_students(G, X).
% G = 101,
% X = 2 ;
% G = 102,
% X = 4 ;
% G = 103,
% X = 3 ;
% G = 104,
% X = 4.

% Найти количество не сдавших студентов для каждого из предметов
% С помощью bagof получаем список List студентов кто не сдал экзамен (оценка 2) по заданному предмету 
% и с помощью length считаем количество несдавших студентов (длину List)

count_of_failed_students_subject(Subject, Answer) :- bagof(X, grade(X, Subject, 2), List), length(List, Answer).
%?- count_of_failed_students_subject('LP', X).
% X = 3
%?- count_of_failed_students_subject(S, X).
% S = 'ENG',
% X = 1 ;
% S = 'FP',
% X = 1 ;
% S = 'INF',
% X = 3 ;
% S = 'LP',
% X = 3 ;
% S = 'MTH',
% X = 6 ;
% S = 'PSY',
% X = 5.
