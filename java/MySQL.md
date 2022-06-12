#  MySQL

## 数据库、数据库管理系统和SQL

>  数据库: DataBase 简称DB,是一堆数据集合.具有特定格式的数据集.

> 数据库管理系统: DataBaseManagement, 简称DBMS.
>
> 是用来管理数据库中的数据的,DBMS可以对数据库中的数据进行增删改查.
>
> 常见的DBMS有: MySQL, Oracle, MS SqlServer, DB2, sybase等等

> SQL: 结构化查询语言.
>
> ​	是一套标准, 在MySQL、Oracle和DB2中都可以使用

三者之间的关系。

> DBMS--执行-->SQL--操作-->DB

## 安装DBMS(MySQL)

端口号: 3306, 编码方式:UTF-8, 服务名称MySQL, 账户名: root(不能更改), 密码: 随意(kl), 可激活非本机登录.

## 卸载

## 是否开机启动

命令启动和关闭MySQL(此处为windows除命令)

​	net stop 服务名称;(此处有分号)

​	net start 服务名称;

​	其他服务的启动和暂停都可以用以上命令.

## 客户端登录MySQL数据库.(win)

mysql -uroot -pkl		-u(user) -p(passwd)

## 常用命令

**退出MySQL**: exit quit

**查看mysql中有哪些数据库**

​	show databases;(此处有分号)

**使用某个数据库**

​	use test(存在的数据库);

**创建数据库**

​	create database test(数据库名称);

**某个数据库下有哪些表**

​	show tables;

**注意**: 以上命令不区分大小写.

**查看数据库的版本号**

​	select version;

**查看当前使用的是哪个数据库**

​	select database();

**查看表中的数据**: 

​	select * from 表名;		//从表名中查询所有数据

**只看表结构**: 

​	desc(describe缩写) 表名;		//只看表结构，不看数据，

## 表

数据库当中**最基本的单元**的表: **table**

数据库当中是以表格的形式表示数据的.比较直观.

**任何一张表都有行和列**:

​	行(row): 被称为数据/记录.

​	列(column): 被称为字段.

每个字段都有: 字段名、数据类型、约束类型等属性。

​	**数据类型**: 字符串, 数字, 日期等等

​	**约束**: 有很多,后面慢慢了解. 

## 分类

DQL: 数据查询语言(凡是带有select的)

DML: 数据操作语言(对表中的**数据**进行增删改的)

​	insert(增) dalete(删) update(改). 针对数据data

DDL: 数据定义语言(凡是有creat(新增), drop(删除), alter(修改)).

​	更改表的**结构**, 不是表的数据(例如, 删除一行一列), 针对表结构

TCL: 事务控制语言.

​	事务提交: commit

​	事务回滚: rollback	

DCL: 数据控制语言

​	例如: 授权grant, 撤销权限revoke...





## 简单查询

- 查询一个字段
  - select 字段名 from 表名；
- 查询多个字段
  - select 字段名, 字段名 from 表名；
- 查询所有字段
  - 一：把所有字段写上。
  - 二：select * from 表名；
    - 缺点：效率低(先将*转化为所有字段)，可读性差。实际开发中不建议。

**给查询列起别名**

​	select 列名 as 别名 from 表名；		//as关键字可以省略

​		只是将显示的列名更改，原表中名字不变		//别名若为中文,则要用单引号括起来(双引号不标准(可以,但没必要))

> mysql> select plugin , host as pluginpro, hosts from user;	//只能起一个别名,否则出错
> ERROR 1054 (42S22): Unknown column 'hosts' in 'field list'
>
> mysql> select plugin , host as pluginpro from user;				//只能起后面那个列的别名
> +-----------------------------------+---------------+
> | plugin                                |pluginpro|
> +------------------------------------+--------------+
> | auth_socket                      | localhost |
> | mysql_native_password | localhost |
> | mysql_native_password | localhost |
> | mysql_native_password | localhost |
> +------------------------------------+---------------+
> 4 rows in set (0.00 sec)
>
> mysql> select host, plugin as pluginpro from user;
> +--------------+------------------------------------+
> | host         | pluginpro                          |
> +--------------+------------------------------------+
> | localhost | auth_socket                      |
> | localhost | mysql_native_password |
> | localhost | mysql_native_password |
> | localhost | mysql_native_password |
> +---------------+-----------------------------------+
> 4 rows in set (0.00 sec)



**字段可以使用数学表达式**



## 条件查询

条件查询需要用到where语句, where必须放到from语句表后面

> 语法格式: select 字段1, 字段2, ... from 表名 where 条件;

> 条件: 字符串字段 符号(大于小于等于等等) '字符串'
>
> eg: 查询SMITH的编号和薪资select empno, sal from emp where ename = 'SMITH';
>
> 数字字段 符号 数字

支持如下运算符:

| =                | 等于                                      |
| ---------------- | ----------------------------------------- |
| <>或!=           | 不等于                                    |
| <       >        | 小于和大于                                |
| <=     >=        | 小于等于和大于等于                        |
| between...and... | 等同于>=and<=(两者之间)。必须遵循左小右大 |
| is null          | 为null (is not null 不为空)               |
| and    or        | 并且和或者                                |
| in               | 包含,相当于多个or. (not in不包含)         |
| not              | 主要用在is和in中                          |
| like             | 模糊查询,支持%或下划线匹配(正则?有点像)   |

> 在数据库中, null不能用'='衡量, 得用is null	因为数据库中的null代表什么也没有, 所以不能用'='衡量.

>  and优先级高于or

>  **in**: 
>
> select empno, ename, job from emp where job = 'MANAGER' or job = 'SALESMAN';
>
> select empno, ename, job from emp where in('MANAGER', 'SALESMAN');			//两条语句等价,这也是in的用法.
>
> **注意**: in不是一个区间, 跟的是具体的值.

not in 表示不在这几个值之中的数据. 

## 排序

**单字段排序**

order by 	//默认升序

eg: select ename, sal from emp order by sal;	//以员工薪资升序排列.

指定降序:	select ename, sal from emp order by sal desc;

指定升序:	select ename, sal from emp order by sal asc;

**多个字段排序**

按照薪资升序, 若薪资相同, 按名字升序排列.以逗号分隔.

> select ename, sal from emp order by sal asc, ename asc;

**根据字段位置来排序**

select ename, sal from emp order by 2; 		// 2 表示按照查询结果的第二列(此处为sal)排序.	**了解一下**.列的顺序可能会变化.

**综合实例**

找出工资在1250到3000的员工信息, 按照薪资降序排列.

select ename, sal from emp where sal between 1250 and 3000 order by sal desc;

**注意**: 关键字顺序不能变.select from where order by

执行顺序: from where select order by(反复确认,没有出错)

## 数据处理函数

又称为**单行处理函数**. 一个输入对应一个输出.

多行处理函数.多个输入对应一个输出.

| lower                                               | 转小写             |
| --------------------------------------------------- | ------------------ |
| supper                                              | 转大写             |
| substr(被截取的字符串, 起始下标(1开始), 截取的长度) | 取子串             |
| length                                              | 取长度             |
| trim                                                | 去空格             |
| str_to_date                                         | 将字符串转换成日期 |
| date_fomat                                          | 格式化日期         |
| format                                              | 设置千分位         |
| round                                               | 四舍五入           |
| rand()                                              | 生成随机数         |
| ifnull                                              | 将null转换成具体值 |
| case .. when .. then .. whem .. then .. else .. end |                    |

一百以内随机数保留整数select round(rand()*100, 0) from emp;

只要有null参与的数学运算,最后结果就是null.为了避免这种情况,使用ifnull(数据,被当作哪个值).如果"数据"为null时,把这个"数据"换成一个值处理.

## 多行处理函数

count	计数

sum		求和

avg 	平均值

max		最大值

min		最小值

**注意**: 分组函数在使用的时候必须进行分组,然后才能使用.若未分,整张表默认为一组.

分组函数自动忽略null,不需要提前处理.

分组函数不能直接使用在where中

## 分组查询(非常重要)

select ... from ... where ... group by ... order by .... 关键字**顺序不能颠倒**.

**执行顺序**: from where group by select order by

分组查询: 	select ... from ... group by ...;

**注意**: 在一条select语句当中,如果有group语句,select后面只能跟: 参加分组的字段和分组函数,其他的一律不能跟.

### having

使用having对分完组后的数据进一步过滤.不过having不能单独使用,having不能代替where, having必须和group by联合使用.

## 去除重复记录(查询结果)

> 需要使用关键字: distinct

eg: select distinct job from emp;

**注意**: 下面例子是错误的. distinct 只能出现在所有字段的最前方.

select ename, distinct job from emp;	//ename 有十四个字段,而distinct筛选后不足十四个字段.	

select distinct job, deptno from emp;	//distinct出现在前方表示对后面的字段联合进行去重.

## 连接查询

- 什么是连接查询?
  - 从一张表中查询, 称为单表查询.
  - 多张表联合起来查询数据, 被称为连接查询.
- 分类
  - 根据年代分类
    - SQL92
    - SQL99
  - 根据连接方式
    - 内连接
      - 等值连接	//条件等值
      - 非等值连接
      - 自连接    //自己连接自己
    - 外连接
      - 左外连接(左连接)  //left
      - 右外连接(右连接)  //right
    - 全连接

- 当两张表进行连接查询时没有任何限制会发生什么?
  - 表一数据 * 表二数据
    - eg: 表一有14行, 表二有3行, 联合查询得到的数据有14 * 3 = 42行
  - 这种现象被称为笛卡尔积现象(笛卡尔发现的,是一种数学现象)
  - select 字段一(表一中字段), 字段二(b2), from b1, b2;

- 92语法

  - select e.ename, d.dname from emp e, dept d where e.deptno = d.deptno;

- 99语法

  ​	//inner表示内连接,可以省略. 不省略可读性更好. 内连接

  - select e.ename, d.dname from emp e inner join(关键字:连接) dept d on(后跟条件) e.deptno = d.deptno;

- 外连接

  select e.ename, d.dname from emo e right outer join dept d on e.deptno = d.deptno;	//右外连接. outer可省略, 有之可读性强

right的含义:表示将join右边的表看成主表, 主要是为了将这张表的数据全部查询出来, 稍带关联查询左边的表.

内外连接区别:	

- 内连接: 内匹配的查询出来, 否则不能, 没有主次之分.
- 外连接: 有主次之分.



三张表和四张表连接

select 

​	...

from 

​	a 

join 

​	b 

on 

​	ab之间的条件 

join 

​	c 

on 

​	(ab)c之间的条件 

join 

​	d 

on 

​	(abc)d之间的连接条件;

 //一条SQL语句中内外连接可以混合出现. 

## 子查询

//了解即可

- 什么是子查询?

  ​	select 嵌套select, 被嵌套的select被称为子查询.

- 子查询都可以出现在哪里?

   	select ...(select) from ...(select) where ...(select)

## union

//合并查询结果集

减少笛卡尔积现象的匹配次数(表连接时)的情况下, 还可以完成两个结果集的拼接.  提升了效率(越多表连接越体现其效率).

select ename, job from emp where job = 'MANAGER' union select ename, job from emp where job = 'SALEMAN';

- **注意**: 要求两个结果集列数相同, 列和列的数据类型一致.

## limit

//将查询结果集的一部分取出, 通常使用在分页查询当中. 

怎么用	完整用法	limit sartIndex(起始下标), length(长度).起始下标从零开始.
缺省用法:limit 5(length);	//取前5

​	按照薪资降序, 取出排名前五的员工

​	select ename, sal from emp order by sal desc limit 5;	//取前五

**注意**: MySql中,limit在order by之后执行.

取出排名在[3-5]名的员工

		select ename, sal from emp order by sal desc limit 2, 3;  //2表示从下标2开始, 也就是第三条记录, 3表示长度.

**分页**

每页显示4条记录.
	第一页:limit 0,3
	第二页:limit 3,3
	第三页:limit 6,3
	第四页:limit 9,3
每页显示pageSize条记录
	第pageNo页:limit (pageNo -  1) * pageSize , pageSize;

## **DQL**总结
select ...
from ...
where ...
group by ...
having ...
order by ..
limit ...

执行顺序:
1. from
2. where
3. group by
4. having
5. select
6. order by 
7. limit

## 建表

//表的创建
建表的语法格式: (建表属于DDL语句)

DDL: creat drop alter ...
	creat table 表名(字段1 数据类型, 字段2 数据类型, ...);
eg: creat table t_student(
num int, 
name varchar(32),
sex char(1) default 'm',   //指定默认值为'm(男)'
age int(3),
email varchar(255)
);

MySQL数据类型: 建议以t_或者tbl_开始,可读性强.见名知意.

varchar(255) 可变长度的字符串,比较只能, 节省空间.会根据实际的数据长度动态分配空间. 优点:节省空间.缺点:动态分配空间, 速度慢

char(255) 定长字符串.不管实际传入数据长度是多少,分配固定空间存储数据.使用不恰当可能会导致空间浪费或数据丢失. 优点: 速度快.缺点: 使用不当空间浪费

int(最长11) 整数型

bigint 长整型

float 单精度浮点型

double 双精度浮点型

date 短日期类型

datetime 长日期类型

clob 字符大对象,最多可以存储4G的字符串. 超过255个字符的都要用clob存储. Character Large OBject: CLOB

blob 二进制大对象.Binary Large OBject: BLOB(用来存储图片视频等等).往blob类型的字段上插入数据的时候,例如插入一个图片或者视频等,需要用IO流才可以. 

删除表: 
	drop table 表名；//表不存在报错
	drop table if exists 表名; //如果存在则删除. 

## insert (SML)
	//插入数据
语法格式: 
	insert into 表名(字段1, 字段2, ...) values(值1, 值2, ...)	

insert插入多条记录
语法格式: 
	insert into 表名() values(
	(第一列数据),
    (第二列数据),
    ...
    );

**注意**: 字段名和值要一一对应(数量要对应,数据类型要对应.)

​	insert into t_student(num, name, sex, age, email) values(1, 'zhangsan', 'm', 20, 'zhangsan@123.com')
​	insert into t_student(email, name, sex, age, num) values('lisi@123.com', 'lisi', 'f(注:female)',20, 2);

**注意** : insert语句但凡执行成功了, 就会多一条记录(多出一行). 没有 给其他字段赋值的话, 默认是null.


insert插入日期 //默认格式: %Y-%m-%d
数字格式化: format
//format(数字, '格式')

str_to_date : 将字符串varchar类型转换成date类型.

date_format : 将date类型转换成具有一定格式的varchar字符串类型.

date和datetime的区别?

date是短日期: 只包括年月日信息. //默认格式: %Y-%m-%d
datetime是长日期: 包括年月日时分秒信息. //默认格式: %Y-%m-%d %h:%i:%s

## 修改update(DML)
//语法格式: update 表名 set 字段1=值1, 字段2=值2, ... where 条件;
**注意**: 没有条件限制会更新全部数据.

## 删除数据delete(DML)
//语法格式: delete from 表名 where 条件;
**注意**: 没有条件限制会删除全部数据 

## 快速创建表
	creat table emp2 as select * from emp; //将查询结果当作一张新表创建.
//完成表的快速复制.

## 删除大表

delete from 表名; //比较慢
delete 语句删除数据的原理: 将数据一个一个删掉, 空间不释放, 数据在硬盘上的真实存储空间不会被释放.误删可以回滚.删除效率比较低.	//若有张大表(比如有上亿条), 可能会要几个小时.

truncate(DDL)	//删除数据
语法格式: truncate table 表名;
   这种效率比较高,表被一次截断, 物理删除.
   缺点:不支持回滚
   优点:快
   使用truncate删除数据之前需要反复询问客户是否真的需要删除,并且警告删除后不可恢复.

   删除表:	drop table 表名;	//这不是删除表中的数据,这是把表删除.

## 对表结构的增删改

   使用关键字: alter

   属于DDL, DDL包括: create, drop, alter

   不重要:	
   第一: 在实际开发中,需求一旦确定后,表结构一旦设定,很少会进行表结构的更改.开发进行中的时候, 修改表结构成本较高.

   第二: 需求少, 所以不需要掌握.若有一天需要修改表结构, 可以使用工具.

## 约束

   //constraint

   概念: 给表中的字段加上一些约束,来保证表中数据的完整性、有效性。

   约束的作用就是为了保证表中数据有效.

   分类:
   非空约束:	not null
   唯一性约束:  unique
   主键约束:	primary key(PK)
   外键约束:	foreign key(FK)
   检查约束:	check(MySQL不支持, oracle支持)

非空约束:
   //只允许列级约束
	create table t_vip(
		id int,
		name varchar(255) not null
	);

唯一性约束:
   //唯一性约束unique约束的字段不能重复,但可以为NULL.
	creat table t_vip(
		id int,
		name varchar(255) unique, //列级约束
		email varchar(255)
	);

两个字段联合起来具有唯一性:
	creat table t_vip(
		id int,
		name varchar(255),
		email varchar(255),
		unique(name, email) //表级约束
	);

联合使用:
	creat table t_vip(
		id int,
		name varchar(255) not null unique //name字段变为主键字段(在MySQL中, oracle中不一样)
	);

主键约束: 
    相关术语:
- 主键约束: 就是一种约束
- 主键字段: 该字段上添加了主键约束
- 主键值:	主键字段中的每一个值.

什么是主键,有什么用?
- 主键值是每一行记录的唯一标识.

**注意**: 每一张表都应该有主键, 没有主键表无效.

主键的特征: not null + unique (主键值不能为NULL, 也不能重复.)

怎么给一张表添加主键约束?
	creat table t_vip(
		id int primary key, //列级约束
		name varchar(255)
	); //单一主键

	creat table t_vip( 
		id int,
		name varchar(255),
		email varchar(255),
		primary key(id, name)		//表级约束 
	); //复合主键.(实际开发不建议. 因为主键存在的意思就是这行的唯一标识,意义达到即可(单一主键即可达到))

主键约束数量:
	creat table t_vip( 
		id int primary key,
		name varchar(255) primary key
	); //error
**结论**: 主键约束只能有一个.

主键值建议使用:
int, bigint, char等类型. 不建议使用varchar来做主键.主键值一般都是数据, 一般都是定长的.

	creat table t_vip(
		id int primary key auto_increment, //auto_increment表示自增, 从1开始递增
		name varchar(255)
	);

外键约束
- 相关术语
	- 外键约束: 一种约束(foreign key)
	- 外键值  : 外键字段当中的每一个值
	- 外键字段: 该字段加上了外键约束
	//父表
	creat table t_class( 
		classno int primary key,
		classname varchar(255)
	);
	//子表
	creat table t_student(
		no int primary key auto_increment,
		name varchar(255),
		cno int,
		foreign key(cno) references t_class(classno)
	);

**注意**: 子表中的外键引用的父表中的某个字段, 被引用的字段不一定是主键, 但至少具有unique约束.外键可以为NULL.

## 存储引擎
	//存储引擎的区别和索引的原理(可以去了解了解)
	MySQL中特有的术语.
	
	//是一个表存储/组织数据的方式, 不同的存储引擎表存储的方式不同.
	
	查看当前存储引擎
	- show create table 表名;

建表时指定存储引擎, 以及编码方式:
	create table 表名(
		id int primary key,
		name varchar(255)
	)engine=InnoDB default oharset=utf8;


怎么查看MySQL支持哪些存储引擎
> show engines \G
MySQL支持九大存储引擎.

常用存储引擎:
- MyISAM
	- 具有以下特征:
		格式文件 - 存储表结构的定义(mytable.frm)
		数据文件 - 存储表行的内容(mytable.MYD) 
		索引文件 - 存储表上索引(mytable.MYI)
		可被转换为压缩和只读表来节省空间.

- InnoDB
	MySQL默认存储引擎.
	InnoDB支持事务, 支持数据库崩溃后自动恢复机制.
	InnoDB存储引擎最主要的特点是: 非常安全.
	主要特征:
		- 每个InnoDB表在数据库目录中以.frm格式文件表示
		- InnoDB表空间tablespace被用于存储表的内容
		- 提供一组用来记录事务性活动的日志文件
		- 用commit(提交),savepoint(保存点)和rollback(回滚)支持事务处理
		- 提供全ACID兼容
		- 在MySQL服务器崩溃后提供自动恢复
		- 多版本(MVCC)和行级锁定
		- 支持外键及引用的完整性, 包括级联删除和更新
	
	最大的特点就是支持事务:以保证数据的安全.效率不是很高,不能转换为只读, 不能很好的节省存储空间.

- MEMORY
	使用MEMORY存储引擎的表, 其数据存储在内存中, 且行的行读固定. 这使得MEMORY存储引擎非常快.
	
	特征:
	- 在数据库目录内, 每个表均以.frm格式文件表示.
	- 表数据及索引被存储在内存中
	- 表级锁机制
	- 不能包含TEXT或BLOB字段
	MEMORY存储引擎以前被称为HEAP引擎

	优点:查询效率最高
	缺点:不安全, 关机后数据消失, 因为数据和索引都是在内存中.

## 事务

	什么是**事务**?
		一个事务其实就是一个完整的业务逻辑.
	
	完整的业务逻辑?
		假设A账户向C账户转账***元.将A账户的q减去***,将C账户的q加上***.
		以上操作是一个最小的工作单元, 要么同时成功, 要么同时失败, 不可再分.

只有DML语句才有事务.
	insert, delete, update
	只有这三个语句和事务有关系,其他都没有. 
	因为只有以上的三个语句是数据库表中进行增删改的.只要你的操作一旦涉及到数据的增删改, 那么就一定要考虑安全问题.

事务就是多条DML语句同时成功或者同时失败.

怎么做到同时?
> InnoDB存储引擎: 提供一组用来记录事务性活动的日志文件

事务开启了: insert insert update update delete ... 事务结束了
在事务的执行过程中,每一条DML的操作都会记录倒"事务性活动日志文件"中,可以提交事务,回滚事务.
提交事务:
	清空事务性活动的日志文件,将数据全部彻底持久话倒数据库表中.提交事务标志着事物的结束.并且是一种全部成功的结束.

回滚事务:
	将之前所有的DML操作全部撤销,并且清空事务性活动的日志文件.回滚事务标志着事务的结束, 并且是一种全部失败的结束.
	
怎么提交回滚事务?
	提交事务: commit;	语句
	回滚事务: rollback; 语句  //回滚到上次提交点

事务: transaction

MySQL默认情况下是支持自动提交事务的. //每执行一条DML语句,就提交一次 //每执行一条DML语句,就提交一次

关闭默认自动提交: start transaction;

事务四个特性:
A:原子性  //A是原子性的英语单词首字母
	说明事务是最小的工作单元,不可再分.
C:一致性
	所有事务要求,在同一个事务当中,所有操作必须同时成功,或同时失败,以保证数据的一致性.
I:隔离性
	A事务和C事务之间具有一定的隔离.eg:教室A和教室C之间有一道墙.
D:持久性
	事务最终结束的一个保障.事务提交,就相当于将没有保存到硬盘上的数据保存到硬盘上

**隔离性**: 
教室A和教室C之间有一道墙.可以很厚,也可以很薄.这就是事务的隔离级别.墙越厚,级别越高.

4个级别.
- 读未提交:read uncommitted //最低的隔离级别
	事务A可以读取倒事务C未提交的数据.
	问题: 脏读现象(dirty read), 读到了脏数据.
	这种隔离级别一般都是理论上, 大多数数据库隔离级别都是第二级别起步.

- 读已提交:read committed
	事务A只能读取到事务C提交后的数据.
	解决了脏读现象.
	存在不可重复读取数据.(在事务开启之后,第一次读到的数据是3条,当前事务还没有结束,可能第二次再读取的时候,读到的数据是4条,3!=4, 称为不可重复读取)

- 可重复读:repeatable read 
	事务A开启之后,不管是多久,每一次在事务A中读取到的数据都是一致的,即使事务C将数据已经修改,并且提交了,事务A读取到的数据还是没有发生改变,这就是可重复读.
	可重复读解决了不可重复读问题.
	存在幻影读(每一次读取的数据都是幻象.不论事务C发生了什么(增删改),只要事务A没有提交,查到的数据永远一样,但不一定准确.)

- 序列化/串行化: serializable(最高隔离级别)
	最高隔离级别,效率最低.解决了所有的问题.
	这种隔离级别表示事务排队,不能并发.
	事务A与事务C操作同一张表,若事务A未commit,则事务C会一直等待,直到事务Acommit,事务C则会马上执行等待的命令.


## 索引
	//数据库表的字段上添加的,是为了提高查询效率的一种机制.一张表的一个字段可以添加一个索引,多个字段联合起来也可以添加索引.索引相当于一本书的字段,是为了缩小扫描范围而存在的一种机制.
	//eg:字典查找一个汉字有两种方式:一:一页一页翻.二:目录定位缩小范围. 

MySQL在查询方面主要就是两种方式:
	一:全表扫描
	二:索引检索

索引需要排序

**注意**: 
	在任何数据库当中,主键和有unique约束的字段会自动创建索引对象.
	在任何数据库当中,任何一张表的任何一条记录在硬盘存储上都有一个硬盘的物理存储编号.
	在MySQL中,索引是一个单独的对象,不同的存储引擎以不同形式存在.
		- MyISAM存储引擎:索引存储在一个.MYI文件中.
		- InnoDB存储引擎:索引存储在一个逻辑名称叫做tablespace当中.
		- MEMORY存储引擎:索引存储在内存当中.
	不管索引存储在哪里,索引在MySQL当中都是一个树的形式存在(自平衡二叉树:B-Tree)

什么条件给字段添加索引?
	条件1:数据量庞大
	条件2:该字段经常出现在where后面,以条件形式存在.
	条件3:该字段很少的DML操作.因为DML后索引需要重新排序.

**注意**: 不要随意添加索引, 索引也需要维护. 过犹不及.可通过主键和unique查询,效率反而比较高.

创建索引:
```python
creat index 索引名 on 表名(字段名); 
```
删除索引:
```python
drop index 索引名 on 表名; 
```

查看MySQL数据库中是否使用索引?
```python
explain select * from 表名 where 条件(eg:ename = 'KING');
//扫描记录type=ALL, 说明没有使用索引
//typr=ref,说明使用索引
```

索引失效1:
> select * from emp where ename like '%T';
失效:因为模糊匹配以'%'开头.尽量避免'%'开头.

索引失效2:
使用or时.入股使用or那么要求or两边的条件字段都要有索引,才会走索引.

索引失效3:
使用复合索引的时候,没有使用左侧的列查找.
	复合索引:
		多个字段联合起来添加一个索引.

索引失效4:
在where中索引列(设置了索引的列)参与了运算.

索引失效5:
在where当中索引列使用了函数.

索引失效...

索引是各种数据库优化的重要手段,优化的时候优先考虑的就是索引.
	单一索引:一个字段上添加了索引.
	复合索引:多个字段上添加索引.
	主键索引:主键上添加索引.
	唯一性索引:具有unique约束的字段上添加索引.
	...
**注意**:唯一性比较弱的字段添加索引用处不打.

## 视图
	//view
	//站在不同的角度去看待同一份数据.

创建视图对象.
> creat view 视图名 as select * from 表名;

删除视图对象.
> drop view 视图名;
**注意**: 只有DQL语句才能以view的形式创建

视图的作用? ----->方便,简化开发,利于维护
面向视图对象进行增删改查,对视图对象的增删改查,会导致原表被操作.这是视图最大的特点.
> 假设有一条非常复杂的SQL语句,而这条SQL语句需要在不同位置上反复使用,每一次使用这个SQL语句的时候都需要重新编写,很长,很麻烦.可以把这条复杂的SQL语句以视图对象的形式新建.在需要编写这条SQL语句的位置直接使用视图对象,可以大大简化开发,并且利于后期的维护,因为修改的时候只需要修改一个位置就行.
> 在面向视图开发的时候,使用视图的时候可以像使用table一样,可以对视图进行进行增删改查等操作.视图不是在内存当中,视图对象也是存储在硬盘上的,不会丢失.

**注意**: 视图对应的语句只能是DQL语句.但是视图对象创建完成之后,可以对视图进行增删改查等操作.

另:增删改查又叫做:CRUD
C:creat(增)
R:retrive(查:检索)
U:update(改)
D:delete(删)


## DBA
数据导出
数据导入:
	创建数据库:creat database 数据库名;
	使用数据库:use 数据库名;
	初始化数据库:soure xxxx.sql文件


## 数据库开发三范式
	//什么是---?
		数据库表的设计依据.教你怎么进行数据库表的设计.
	
	第一范式:要求任何一张表必须有主键,每一个字段原子性不可再分.
	第二范式:建立在第一范式基础之上,要求所有非主键字段完全依赖主键,不要产生部分依赖.
	第三范式:建立在第二范式基础之上,要求所有非主键字段直接依赖主键,不要产生传递依赖.
	熟记在心.

	设计数据库表的时候,按照以上规范进行,可以规避表中数据的冗余,空间的浪费.

第一范式:
	最核心,最重要的范式,所有表的设计都需要满足
	必须有主键,并且每一个字段都是原子性不可再分.

第二范式:
	建立在第一范式基础之上
	要求所有非主键字段完全依赖主键,不要产生部分依赖.

	多对多怎么设计?
		多对读,三张表,关系表两个外键.
	
第三范式:
	建立在第二范式基础之上
	要求所有非主键字段直接依赖主键,不要产生传递依赖.

	一对多,两张表,多的表加外键.

总结表的设计
一对多:
	一对多,两张表,多的表加外键.
多对多:
	多对读,三张表,关系表两个外键.
一对一:
	一对一放到一张表不就行了嘛,为啥要拆分表?
		在实际开发中,可能存在一张表字段太多,太庞大,这时候就要拆分表.
	一对一着呢么设计?
		一对一,外键唯一(拆表,添加一个字段,加上unique约束,保证两张表能够对应上.)




实践和理论存在偏差,最终的目的是满足客户的需求.有时候会用空间换速度,有时可能会存在冗余,但是为了减少表的连接次数,这样做也合理,并且对于开发人员来说,SQL语句的编写难度也会降低.
