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

<<<<<<< HEAD
```java
psvm{
    Integer[] a = {2,6,8,4,2,7,9,2,0,3};
      Integer[] a = {2,6,7,3,4,0,1,5};

    /**
     *  归并排序
     *
     *  1. 拆分
     *  2. 合并, 排序
     */
    int lo = 0;
    int hi = a.length-1;
    sort(a, lo, hi);
    System.out.println(Arrays.toString(a));

}

/**
 *  分组
 */
public static void sort(Integer[] a, int lo, int hi){

    if (lo>=hi)
        return;

    int mid = lo + (hi - lo) / 2;

    sort(a,lo,mid);
    sort(a,mid+1, hi);

    merge(a,lo,mid,hi);
}

/**
 *  合并 排序
 */
public static void merge(Integer[] a, int lo, int mid, int hi) {
    Integer[] assist = new Integer[a.length];
    int i = lo;
    int p1 = lo;
    int p2 = mid+1;

    while (p1<=mid && p2<=hi){
        if (a[p1] < a[p2])
            assist[i++] = a[p1++];
        else
            assist[i++] = a[p2++];
    }

    while (p1<=mid)
        assist[i++] = a[p1++];

    while (p2<=hi)
        assist[i++] = a[p2++];

    for (int index=lo; index<=hi; index++)
        a[index] = assist[index];

}

```

O(nlogn)


- 快速排序

```java
public static void main(String[] args) {
    Integer[] a = {2, 6, 8, 4, 2, 7, 9, 2, 0, 3};

    /**
     *  快速排序
     */
    int lo = 0;
    int hi = a.length - 1;

    sort(a, lo, hi);
    System.out.println(Arrays.toString(a));

}

public static void sort(Integer[] a, int lo, int hi){

    if (lo>=hi)
        return;

    // 找到分界值下标进行分组
    int partition = partition(a, lo, hi);

    sort(a, lo, partition-1);
    sort(a, partition+1, hi);

}

public static int partition(Integer[] a, int lo, int hi){

    int key = a[lo];
    int left = lo;
    int right = hi + 1;

    while (true){
        // 从右往左, 直到找到比key小的数
        while (key < a[--right]){
            if (right <= left)
                break;
        }

        // 从左往右, 直到找到比key大的数
        while (key > a[++left]){
            if ((left >= right))
                break;
        }

        if (left >= right)
            break;
        else
            exch(a, right, left);
    }
    // 交换key和right停止位置的值, 此处只能是right, 因为left会大于right
    exch(a, lo, right);

    // 返回key值的下标
    return right;
}

public static void exch(Integer[] a, int right, int left){
    Integer temp;

    temp = a[right];
    a[right] = a[left];
    a[left] = temp;
}

```


平均O(nlogn)
最坏O(n^2)

- 堆排序
```java
package sty;

import java.util.Arrays;

public class TestHeap {
    public static void main(String[] args) {
        int[] arrHeap = {20,30,90,40,70,110,60,10,100,50,80};
        heapAscending(arrHeap, arrHeap.length);
        System.out.println(Arrays.toString(arrHeap));
    }

    /**
     * 堆排序, 从小到大
     * @param arr 堆数组
     * @param N   数组长度
     */
    public static void heapAscending(int[] arr, int N){
        int i;
        // 得到一个二叉堆
        for (i = N / 2 - 1; i >= 0; i--)
            maxSink(arr, i, N - 1);

        // 排序
        for (i = N - 1; i > 0; i--){
            exch(arr, 0, i);
            maxSink(arr, 0, i - 1);
        }
    }

    /**
     * 下沉
     * @param arr   堆数组
     * @param start 一定范围(0~n)的起始点
     * @param end   一定范围(0~n)的末尾需要交换的点
     */
    public static void maxSink(int[] arr, int start, int end){
        int left = 2 * start + 1; // 左节点, 右节点为left+1

        while (left <= end){
            // 此处必须是left<end, 不然会导致混乱.  比较后取左右子节点较大的那个
            if (left < end && arr[left] <= arr[left+1])
                left++;
            // 比较子节点和父节点大小
            if (arr[start] >= arr[left])
                break;
            else
                exch(arr, start, left);
            // 继续向下比较
            start = left;
            left = 2 * left + 1;
        }

    }

    /**
     * 交换方法
     * @param arr  堆数组
     * @param i    索引i
     * @param j    索引j
     */
    public static void exch(int[] arr, int i, int j){
        int temp;
        temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
    }
}

```


- 桶排序和基数排序
- 外部排序


## 5. 树
- 二叉树
- AVL树


## 6. 散列


## 7. 图及应用

### 加权图及应用

## 8. 集合流的聚合操作
