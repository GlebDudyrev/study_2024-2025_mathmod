---
## Front matter
title: "Отчет по лабораторной работе №4"
subtitle: "Дисциплина: Математическое моделирование"
author: "Дудырев Глеб Андреевич"

## Generic otions
lang: ru-RU
toc-title: "Содержание"

## Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

## Pdf output format
toc: true # Table of contents
toc-depth: 2
lof: true # List of figures
lot: true # List of tables
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
## I18n polyglossia
polyglossia-lang:
  name: russian
  options:
	- spelling=modern
	- babelshorthands=true
polyglossia-otherlangs:
  name: english
## I18n babel
babel-lang: russian
babel-otherlangs: english
## Fonts
mainfont: IBM Plex Serif
romanfont: IBM Plex Serif
sansfont: IBM Plex Sans
monofont: IBM Plex Mono
mathfont: STIX Two Math
mainfontoptions: Ligatures=Common,Ligatures=TeX,Scale=0.94
romanfontoptions: Ligatures=Common,Ligatures=TeX,Scale=0.94
sansfontoptions: Ligatures=Common,Ligatures=TeX,Scale=MatchLowercase,Scale=0.94
monofontoptions: Scale=MatchLowercase,Scale=0.94,FakeStretch=0.9
mathfontoptions:
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Pandoc-crossref LaTeX customization
figureTitle: "Рис."
tableTitle: "Таблица"
listingTitle: "Листинг"
lofTitle: "Список иллюстраций"
lotTitle: "Список таблиц"
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Цель работы

Построить математическую модель гармонического осциллятора.

# Теоретическое введение

Гармонические колебания — колебания, при которых физическая величина изменяется с течением времени по гармоническому (синусоидальному, косинусоидальному) закону [@wiki:bash].

Гармоническое колебание является специальным, частным видом периодического колебания. Периодическим называется повторяющееся движение, у которого каждый цикл в точности воспроизводит любой другой цикл. Этот специальный вид колебания очень важен, так как он чрезвычайно часто встречается в самых различных колебательных системах. Колебание груза на пружине, камертона, маятника, зажатой металлической пластинки как раз и является по своей форме гармоническим. Следует заметить, что при больших амплитудах колебания указанных систем имеют несколько более сложную форму, но они тем ближе к гармоническому, чем меньше амплитуда колебаний [@landsberg:bash]. 

Гармони́ческий осцилля́тор (в классической механике) — система, которая при выведении её из положения равновесия испытывает действие возвращающей силы F, пропорциональной смещению $x$ [@wiki:osc:bash]:

$$
F = -kx,
$$

где $k$ — постоянный коэффициент.

Если $F$ — единственная сила, действующая на систему, то систему называют простым или консервативным гармоническим осциллятором. Свободные колебания такой системы представляют собой периодическое движение около положения равновесия (гармонические колебания). Частота и амплитуда при этом постоянны, причём частота не зависит от амплитуды.

Если имеется ещё и сила трения (затухание), пропорциональная скорости движения (вязкое трение), то такую систему называют затухающим или диссипативным осциллятором. Если трение не слишком велико, то система совершает почти периодическое движение — синусоидальные колебания с постоянной частотой и экспоненциально убывающей амплитудой. Частота свободных колебаний затухающего осциллятора оказывается несколько ниже, чем у аналогичного осциллятора без трения. 

Уравнение свободных колебаний гармонического осциллятора имеет следующий вид:

$$
\ddot x + 2\gamma\dot x + \omega _0^2x = 0, \tag{1}
$$

где $x$ – переменная, описывающая состояние системы (смещение грузика, заряд конденсатора и т.д.), $\gamma$ -- параметр, характеризующий потери энергии (трение в механической системе, сопротивление в контуре), $\omega _0$ – собственная частота колебаний, $t$ – время. (Обозначения $\ddot x = \dfrac{\partial^2x}{\partial t^2}$, $\dot x = \dfrac{\partial x}{\partial t}$) 

Уравнение (1) есть линейное однородное дифференциальное уравнение второго порядка и оно является примером линейной динамической системы.
При отсутствии потерь в системе ($\gamma = 0$) вместо уравнения (1) получаем уравнение консервативного осциллятора энергия колебания которого сохраняется во времени:

$$
\ddot x + \omega _0 ^2 = 0. \tag{2}
$$

Для однозначной разрешимости уравнения второго порядка (2) необходимо задать два начальных условия вида

$$
\begin{cases}
 x(t_0) = x_0, \\ \tag{3}
 \dot x(t_0) = y_0.
\end{cases}
$$

Уравнение второго порядка (2) можно представить в виде системы двух уравнений первого порядка:

$$
\begin{cases}
  \dot x = y, \\ \tag{4}
  \dot y = -\omega _0 ^2 x
\end{cases}
$$

Начальные условия (3) для системы (4) примут вид:

$$
\begin{cases}
 x(t_0) = x_0, \\ \tag{5}
 y(t_0) = y_0.
\end{cases}
$$

Независимые переменные $x$, $y$ определяют пространство, в котором «движется» решение. Это фазовое пространство системы, поскольку оно двумерно будем называть его фазовой плоскостью.

Значение фазовых координат $x$, $y$ в любой момент времени полностью определяет состояние системы. Решению уравнения движения как функции времени отвечает гладкая кривая в фазовой плоскости. Она называется фазовой траекторией. Если множество различных решений (соответствующих различным начальным условиям) изобразить на одной фазовой плоскости, возникает общая картина поведения системы. Такую картину, образованную набором фазовых траекторий, называют фазовым портретом.
 
# Задание

## Определение варианта

Использую формулу для определения варианта задания (рис. [-@fig:1]).

![Определение варианта](image/1.png){#fig:1 width=70%}

## Задание

Построить фазовый портрет гармонического осциллятора и решение уравнения гармонического осциллятора для следующих случаев:

1. Колебания гармонического осциллятора без затуханий и без действий внешней силы

  $$\ddot{x} + 6x = 0 $$

2. Колебания гармонического осциллятора c затуханием и без действий внешней силы 
  
  $$\ddot x + 5\dot x + 15x = 0 $$

3. Колебания гармонического осциллятора c затуханием и под действием внешней силы 
   
   $$\ddot x + 2\dot x + 4x = cos(3.5t)$$
   
На интервале $t \in [0; 45]$ (шаг 0.05) с начальными условиями $x_0 = 1,  y_0=0$.

# Выполнение лабораторной работы

## Модель колебаний гармонического осциллятора без затуханий и без действий внешней силы

### Julia

Реализуем модель на языке программирования Julia:

```Julia
# Используемые библиотеки
using DifferentialEquations, Plots;

# Начальные условия
tspan = (0, 45)
u0 = [1, 0]
p1 = [0, 6]

# Задание функции
function f1(u, p, t)
	x, y = u
	g, w = p
	dx = y
	dy = -g .*y - w^2 .*x
	return [dx, dy]
end

# Постановка проблемы и ее решение
problem1 = ODEProblem(f1, u0, tspan, p1)
sol1 = solve(problem1, Tsit5(), saveat = 0.05)
```

Построим график решения и фазовый портрет:

```Julia
plot(sol1, title = "Модель гармонического осциллятора без затуханий", label = ["x" "y"], xaxis = "t")
plot(sol1, idxs=(1, 2), title = "Фазовый портрет", label = "Зависимость х от у", xaxis = "x", yaxis = "y")
```

В результате получаем график решения уравнения гармонического осциллятора без затуханий (рис. [-@fig:2]) и его фазового портрета (рис. [-@fig:3]).

![Колебания гармонического осциллятора для первого случая на Julia](image/2.png){#fig:2 width=70%}

![Фазовый портрет колебаний гармонического осциллятора для первого случая на Julia](image/3.png){#fig:3 width=70%}

## Модель колебаний гармонического осциллятора с затуханиями и без действий внешней силы

### Julia

Реализуем модель на Julia, используя те же начальные условия и функцию, что и в первом случае (кроме параметров уравнения):

```Julia

# Начальные условия
p2 = [5, 15]

# Постановка проблемы и ее решение
problem2 = ODEProblem(f1, u0, tspan, p2)
sol2 = solve(problem2, Tsit5(), saveat = 0.05)
```

Построим график решения и фазовый портрет:

```Julia
plot(sol2, title = "Модель гармонического осциллятора с затуханиями", label = ["x" "y"], xaxis = "t")
plot(sol2, idxs=(1, 2), title = "Фазовый портрет", label = "Зависимость х от у", xaxis = "x", yaxis = "y")
```

В результате получаем график решения уравнения гармонического осциллятора с затуханиями (рис. [-@fig:4]) и его фазового портрета (рис. [-@fig:5]).

![Колебания гармонического осциллятора для второго случая на Julia](image/4.png){#fig:4 width=70%}

![Фазовый портрет колебаний гармонического осциллятора для второго случая на Julia](image/5.png){#fig:5 width=70%}

В данном случае в результате колебаний график затухает.

## Модель колебаний гармонического осциллятора с затуханиями и под действием внешней силы

### Julia

Для реализации обновим параметры уравнения p3 и создадим на основе функции f1 функцию f2, учитывающую внешнюю силу:

```Julia

# Начальные условия
p3 = [2, 4]

# Функция, описывающая внешние силы, действующие на осциллятор
f(t) = cos(3.5*t)

# Задание функции
function f2(u, p, t)
	x, y = u
	g, w = p
	dx = y
	dy = -g .*y - w^2 .*x .+f(t)
	return [dx, dy]
end

# Постановка проблемы и ее решение
problem3 = ODEProblem(f2, u0, tspan, p3)
sol3 = solve(problem3, Tsit5(), saveat = 0.05)
```

Построим график решения и фазовый портрет:

```Julia
plot(sol3, title = "Модель гарм. осц. с затуханиями под действием вн. силы", label = ["x" "y"], xaxis = "t")
plot(sol3, idxs=(1, 2), title = "Фазовый портрет", label = "Зависимость х от у", xaxis = "x", yaxis = "y")
```

В результате получаем график решения уравнения гармонического осциллятора с затуханиями (рис. [-@fig:6]) и его фазового портрета (рис. [-@fig:7]).

![Колебания гармонического осциллятора для третьего случая на Julia](image/6.png){#fig:6 width=70%}

![Фазовый портрет колебаний гармонического осциллятора для третьего случая на Julia](image/7.png){#fig:7 width=70%}

# Выводы

В ходе выполнения лабораторной работы я построил математическую модель гармонического осциллятора.

# Список литературы{.unnumbered}

::: {#refs}
:::
