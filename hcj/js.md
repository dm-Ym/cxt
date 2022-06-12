### 变量

尽量不要使用'name'做变量名,因为有的浏览器有特殊含义

- 为什么需要变量?
  一些数据需要保存起来

- 变量是什么? 
  变量是一种使用方便的占位符，用于引用计算机内存地址，该地址可以存储Script运行时可更改的程序信息。 

- 变量的本质是什么?
  内存中的一块空间,用来存储数据

- 什么是变量初始化?
  声明并赋值


### 数据类型
简单数据类型(基本数据类型)
Number      默认值： 0
Boolean             false
String              ""
Undifined           undifined
Null                null


Number
数字型最大值 Number.MAX_VALUE
数字型最小值 Number.MiX_VALUE
非数字  'pink老师笔记' - 100  //NaN
undefined + 1              //NaN


isNaN()用来判断非数字,若为数字返回false,比如 10 , '10'. 若为非数字,返回true


String拼接
'hello' + 'world'  //'helloworld'
'hello' + 22      //'hello22'
'hello' + true    //'hellotrue'
12 + 22           //34
'12' + 22         //'1222'
12 + 12 + '22'    //'2422'
undefined + '22'  //undefined22

Boolean
true + 1          //2


获取变量类型 typeof var
typeof null     //object
prompt所取的数字是字符型 


数据类型的转换

转为String
var.toString()
String(var)
使用 '+' 字符串拼接

转为Number
parseInt(string)        
舍去小数取整. parseInt(3.54) 结果为3
去除单位.    parseInt('120px')   结果为120
parseInt('rem120px')    NaN.
parseFloat(string)
Number(string)
使用'-', '*' '/' 运算符隐式转换   //'12' - 0


转为Boolean
Boolean()
代表空的、否定的值转为false. 如''、0、null、undefined、NaN
其余转为true


### 运算符 operator
不能直接拿浮点数进行比较是否相等
0.1 + 0.2 == 0.3    //false

var p = 10
++p + 10        //21
p++ + 10        //20

p++ + ++p       //22.   p++ -> 10, p->11, ++p -> 12

比较运算符
=       赋值
==      判断(隐式转换, 6 == '6' true)
===     全等(两边数据类型是否一致)


逻辑运算符
短路运算(逻辑终端)
原理: 当有多个表达式(值)时,左边的表达式值可以确定结果时,就不再继续运算右边表达式的值.

逻辑与
语法:  表达式1 && 表达式2 
若第一个表达式为真,则返回表达式2
反之
0 && 123      //0
123 && 345      //345

逻辑或
语法: 表达式1 || 表达式2
若表达式1的值为真,则返回表达式1
反之
0 || 234      //234
123 || 345      //123

运算符优先级
1. ()
2. ++ -- !
3. / % *  + -
4. < <= > >= 
5. == != === !==
6. 先&& 后||
7. =
8. ,


### 流程控制
switch(expr){
  case value1:
    code;
    break;
  case value2:
    code;
    break;
  ...
  default:
    code;
}
**注意:** expr与value匹配时值是全等的

switch 和 if else if
- switch一般处理值比较确定的情况,if常用于范围判断
- switch判断后直接跳转执行,效率较高.if不论如何,都要从上往下执行

循环
for
while
do ... while

continue 与 break
continue : 跳出本次循环,继续下一次循环.
e.g. : 今天吃五个包子, 第三个有虫子,,继续吃第四个和第五个.

break: 立即跳出整个循环
e.g. : 今天吃五个包子, 第三个有半个虫子,吃个der,开始吐了,pink老师真是个怪物.

### 标识符命名规范
- 变量、函数的命名必须有意义,与其对应的作用想匹配
- 变量名称一般用名词
- 函数名称一般用动词


### 数组
不能直接给数组名赋值,否则会直接覆盖掉以前的数据

### 函数
- 如果实参个数多于形参个数,则多出形参的部分将被舍弃
- 若实参个数少于形参个数,则欠缺对应实参的形参的值是'undefined'

return只返回一个值,若以逗号隔开,以最后一个值为准.

return返回多个值可以通过数组的形式

没有return则返回undifined 


arguments的使用
当不确定有多少个参数传递的时候,可以用arguments来获取.在js中,arguments实际上是当前函数(只有函数才有arguments)的一个**内置对象**.arguments对象中**存储了传递的所有实参**
argument展示形式是一个伪数组,因此可以进行遍历.
- 具有length属性
- 按索引方式存储数据
- 不具有数组的push、pop等方法


函数声明方式:
1. 命名函数
  function fName(){}
2. 匿名函数
  var varName = function(){}