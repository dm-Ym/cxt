## 1. 继承和多态


继承语法
- public class subClass extends SuperClass


super()
> 语句super()或super(arguments)必须出现在子类构造方法的第一行,这是显示点用父类构造方法的唯一方式


构造方法链: 构造一个类的实例时, 将会调用父类的构造方法, 若父类也继承自一个父类, 则继续向上执行父类的构造方法.


@Override 用于标注该方法为重写方法


多态:
> 向上转型


## 2. 异常处理和文本IO

声明一个异常:
> public void Method() throws Exception1, Exception2, ...
>
> 若父类中的方法没有声明异常, 那么就不能在子类中对其重写时声明异常


finally子句必定执行


何时使用异常?


File类


## 3. 抽象类和接口

### 3.1 抽象类

有构造方法

抽象类不可以创建对象

```java
public class abstract ObgName{
	public abstract double getArea();
}

```

抽象类可以用作一种数据类型.


### 3.2 接口

public interface InterfaceName{}

接口所有数据域都是public static final, 而且所有方法都是public abstract, 所以可以忽略这些修饰符


Comparable接口


Cloneable接口


### 3.3 接口和抽象类

类可以实现多个接口, 但是只能继承一个父类


### 3.4 类的设计原则
1. 内聚性
2. 一致性
3. 封装性
4. 清晰性
5. 完整性
6. 实例和静态
7. 继承和聚合
8. 接口和抽象类



## 二进制I/O

文本IO,二进制和javaIO的关系

对象IO

Serializable接口


## 递归

递归辅助方法

递归选择排序

递归二分查找

递归与迭代

尾递归
