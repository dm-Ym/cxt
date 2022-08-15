## 1. 泛型

定义泛型类和接口

泛型方法

原生类型和向后兼容

通配泛型

泛型的擦除和限制


## 2. 线性表,栈,队列和优先队列

2.1 

集合: Collection接口

映射: Map接口

2.2 迭代器(Iterator)

2.3 forEach方法

2.4 线性表(List)

Comparator接口

2.5 向量类和栈类

2.6 队列和优先队列

Queue接口


## 3. 规则集和映射

规则集(set)

映射(map)

### 3.1 规则集和线性表的性能

单元素与不可变的集合和映射


## 4. 排序
- 插入排序
```java
Integer[] a = {2,6,8,4,2,7,9,2,0};
Integer temp;

for (int i = 1; i < a.length; i++) {
    for (int j = i; j > 0; j--) {
        if (a[j] < a[j - 1]){
            temp = a[j];
            a[j] = a[j - 1];
            a[j - 1] = temp;
        }else {
            break;
        }
    }
}
System.out.println(Arrays.toString(a));

```


O(N^2)


- 冒泡排序
```java
Integer[] a = {2,6,8,4,2,7,9,2,0};
Integer temp;

for (int i = 0; i < a.length; i++) {
    for (int j = i + 1; j < a.length; j++) {
        if (a[i] > a[j]){
            temp = a[i];
            a[i] = a[j];
            a[j] = temp;
        }
    }
}
System.out.println(Arrays.toString(a));

```


O(N^2)


- 选择排序
```java
Integer[] a = {2,5,1,3,7,8,3,6,6};
Integer temp;

for (int i=0; i < a.length - 1; i++){
    int minIndex = i;
    for (int j = i+1; j<a.length; j++){
        if(a[minIndex] > a[j])
            minIndex = j;
    }
    temp = a[i];
    a[i] = a[minIndex];
    a[minIndex] = temp;
}
System.out.println(Arrays.toString(a));
```

O(N^2)


- 希尔排序
```java
Integer[] a = {2,6,8,4,2,7,9,2,0,3};
Integer temp;
int h = 1;

/**
 *  希尔排序
 *  1. 确定增值量h的长度 h不小于数组长度的二分之一, 且按照2*h+1来计算
 *  2. 排序
 */

while (h < a.length / 2){
    h = 2 * h + 1;
}

while (h>=1){
    for (int i = h; i < a.length; i++) {
        for (int j = i; j >= h; j-=h) {
            if (a[j] < a[j-h]){
                temp = a[j];
                a[j] = a[j-h];
                a[j-h] = temp;
            }else {break;}
        }
    }
    h = h / 2;
}
System.out.println(Arrays.toString(a));

```



- 归并排序

O(nlogn)


- 快速排序

平均O(nlogn)
最坏O(n^2)

- 堆排序
- 桶排序和基数排序
- 外部排序


## 5. 树
- 二叉树
- AVL树


## 6. 散列


## 7. 图及应用

### 加权图及应用

## 8. 集合流的聚合操作
