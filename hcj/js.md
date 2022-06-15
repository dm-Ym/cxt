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



创建数组的方式

1. 通过字面量的方式 var arr = [];

2. 通过new Array()创建的数组,Array(2,3)等价于创建一个2行3列的二维数组.



检测是否为数组

1. instanceof运算符 

  arr instanceof Array

2. .isArray()

  Array.isArray(arr)



添加/删除数组

添加

push(参数1[, 参数2,[ ... ]])    //在数组最后添加新元素,返回新的长度

unshift(参数1[, 参数2,[ ... ]]) //在数组开头添加新元素,返回新的长度

删除

pop()   //删除最后一个元素,一次只能删一个, 返回被删除的值

shift() //删除第一个元素,一次只能删一个, 返回被删除的值



数组排序

- reverse() 颠倒顺序,无参数,该方法会改变原来的数组,返回新数组

- sort() 对数组进行排序,该方法会改变原来的数组,返回新数组

    sort()方法会将数字进行转换,使用UTF16进行比较,比如,排'80'在'9'前面,可以使用按某种顺序进行排列的函数作为参数

    eg: 

    ```javascript

    sort(function(a, b){

      return a - b;   //a - b < 0 sort按照升序排列, 等于零位置不变

    })

    ```



数组索引:

indexOf('元素'[, 起始位置]) 查找给定元素的第一个索引, 返回索引号, 不存在则返回-1

lastIndexOf() 



数组去重: 两个数组, 一个目标数组,一个空数组.通过索引,将目标数组中的元素逐一在空数组中查询,若返回-1则将该元素添加到这个空数组中.



数组转换为字符串: 

- toString()  使用','分隔开,返回一个字符串

  arr.toString()

- join('分隔符') 默认使用','分隔,返回一个字符串

  arr.join()



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



作用域：全局作用域和局部作用域



全局变量: 

1. 在全局作用域下的声明的变量

2. 在函数内直接赋值的变量. 

  e.g.: function fn(){ varName=2 }    //此时varName属于全局变量,因为他在函数内,但是没有使用'var'关键字声明



关于全局变量和局部变量的生命周期:

(1)全局变量只有浏览器关闭的时候才会销毁,比较占内存.

(2)局部变量当程序执行完毕就会销毁,比较借阅内存.



### 预解析

```javascript

console.log(num)  //报错

```



```javascript

console.log(num)  //undefined

var num=10

```



```javascript

fn()              //正常执行

function fn(){ console.log(1) }

```



```javascript

fun()               //报错

var fun = function{ console.log(2) }  

```



js引擎运行js分两步: 预解析与代码执行

1. 预解析: js引擎会把js里面所有的var和function提升到当前作用域的最前面

  - 变量预解析和函数预解析

    1. 变量提升:就是把所有的变量声明提升到当前作用域最前面,不提升赋值操作

    2. 函数提升:就是把所有的函数声明提升到当前作用域最前面,不调用函数.

2. 代码执行: 按照代码书写的顺序从上往下执行



e.g.: 

```javascript

var num = 10;

fun();

function fun(){

  console.log(num);

  var num = 20;

}

//输出结果 undefined

//因为,上述代码相当于执行了下面这段

var num

function fun(){

  var num

  console.log(num)

  var num = 20

}

var num = 10

fun()

```



```javascript

var a = b = c = 9

/*相当于  

var a = 9;

b = 9;

c = 9;    b 和 c 变成了全局变量

*/

```





### 对象

对象是一组无序的相关属性和方法的集合

属性: 事物的特征

方法: 事物的行为



```javascript

var obj = {

  uName: 'pink',

  age: 19,

  sayHi: function(){

    console.log('hello world')

  }

}

/* obj 类

uName 和 age 是属性

sayHi 是方法

obj.sayHi()调用方法

*/

```



变量和属性: 

变量: 单独存在. 单独声明并赋值

属性: 依附于对象存在,不需要声明





构造函数:

1. 构造函数名字首字母要大写

2. 调用 new FuncName();

3. 构造函数不需要return就可以返回值.

4. 只要调用new FuncName()就生成一个对象

5. 属性前面使用this



new执行时做的事:

1. 在内存创建一个新的空对象

2. 让this指向这个新的对象

3. 执行构造函数里面的代码,给这个新对象添加属性和方法

4. 返回这个新对象



for ... in  遍历对象中的属性

```javascript

for (var every in obj) {

  /* every 是对象obj的属性名

     obj[every] 是属性值

  */

}

```



### 内置对象

js对象分三种: 自定义对象、内置对象和浏览器对象

前两种属于ECMAScript, 第三个属于js独有.



查文档: https://developer.mozilla.org/zh-CN



字符串的不可变性, 所以不要大量使用字符串拼接,导致浪费内存







替换字符串

replace('被替换的字符', '目标替换字符')

str.replace('char1', 'char2')



字符串转为数组

eg: var str = 'red, pink, blue';

str.split(',')  // 输出: ["red", "pink", "blue"]







### Web APIs

Web APIs 与 js基础部分的联系

js

- ECMAScript   js基础

- DOM          页面文档对象

- BOM          浏览器对象模型

  DOM 和 BOM 属于Web APIs阶段



### DOM

文档树



console.dir()   // 返回元素对象, 更好的查看里面的属性和方法

如何获取页面元素

- id

  documentt.getElementById('idName')  // 写引号

- 标签名

  - documentt.getElementByTagName()     // 返回带有该标签的对象的集合, 以伪数组的形式存储, 不论数量

  - element.getElementByTagName('标签名')

- HTML5新增方法

  document.getElementsByClassName('类名') // 根据类名获取

  document.querySelector('选择器') // 根据指定选择器返回第一个元素对象

  document.querySelectorAll('选择器')

- 获取特殊元素

  html body



标签名

- documentt.getElementByTagName()     // 返回带有该标签的对象的集合, 以伪数组的形式存储, 不论数量

- element.getElementByTagName('标签名')

```javascript

var ColTagName = document.getElementsByTagName('ol')

console.log(ColTagName[0].getElementsByTagName('li'))

// ColTagName 本身是一个伪数组, 里面的元素才是父元素

```

获取特殊元素

body:

  var bodyEle = document.body;



html: 

  var htmlEle = document.documentElement;





#### 事件

可以被js侦察到的行为

由三部分组成: 事件源, 事件类型, 事件处理程序. 也成为事件三要素



1.事件源: 事件被触发的对象

2.事件类型: 如何触发: 鼠标点击,鼠标经过, 键盘按下

3.事件处理程序: 通过一个函数赋值的方式完成



```javascript

var btn = document.getElementById('btn'); // 事件源

btn.onclick = function() {  // 事件类型: 鼠标点击

  alert('弹出警告框')   // 事件处理程序

}

```



执行事件的步骤:

1. 获取事件源

2. 注册事件(绑定事件)

3. 添加事件处理程序(采取函数赋值形式)