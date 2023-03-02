## SQL
- DDL-数据定义语言

- DDL-数据库操作

	+ 查询
	> 查询所有数据库
	>
	> show databases;
	
	> 查询当前数据库
	> 
	> select database();
	
	+ 创建
	> create database [if not exists] 数据库名 [default charset 字符集] [collate 排序规则];
	
	+ 删除
	> drop database [if exists] 数据库名;
	
	+ 使用
	> use 数据库名;
	


- DDL-表操作-查询

	+ 查询当前数据库所有表
	> show tables;
	
	+ 查询表结构
	> desc 表名;
	
	+ 查询指定表的建表语句
	> show create table 表名;
	


- DDL-表操作-创建

```mysql
create table 表名 {
	字段1 字段1类型 [comment 字段1注释],
	字段2 字段2类型 [comment 字段2注释],
	...
	字段n 字段n类型 [comment 字段n注释]
}[comment 表注释];
```



- DDL-表操作-数据类型
	数值型,字符串型,日期类型

- DDL-表操作-修改

	+ 添加字段
	> alter table 表名 add 字段名 类型(长度) [comment 注释] [约束];

	+ 修改数据类型
	> alter table 表名 modify 字段名 新数据类型(长度);

	+ 修改字段名和数据类型
	> alter table 表名 change 旧字段名 新字段名 类型(长度) [comment 注释] [约束];

	+ 删除字段
	> alter table 表名 drop 字段名;

	+ 修改表名
	> alter table 表名 rename to 新表名;



- DDL-表操作-删除

	+ 删除表
	> drop table [if exists] 表名;
	
	+ 删除指定表,并重新创建该表
	> truncate table 表名;
	
- DML-数据操作语言
	对表中数据增删改

	+ 增-insert
	+ 删-delete
	+ 改-update


* 增

> 给指定字段添加数据
>
> insert into 表名 (字段1,字段2,...) values (值1,值2,...);

> 给全部字段添加数据
>
> insert into 表名 values (值1, 值2, ...);

> 批量添加数据
>
> insert into 表名 (字段1,字段2,...) values (值1,值2,...),(值1,值2,...), ... ;
> insert into 表名 values (值1,值2,...),(值1,值2,...), ... ;


* 改

> update 表名 set 字段名1 = 值1, 字段名2 = 值3, ... [where 条件];


* 删

> delete from 表名 [where 条件];


- DQL-数据查询语言

+ DQL-语法

```mysql
select 字段列表
from 表名列表
where 条件列表
group by 分组字段列表
having 分组后条件列表
order by 排序字段列表
limit 分页参数
```

+ DQL-聚合函数

null值不参与计算

| 函数名字 | 作用     |
|----------|----------|
| count    | 统计数量 |
| max      | 最大值   |
| min      | 最小值   |
| avg      | 平均值   |
| sum      | 求和     |

执行顺序: where > 聚合函数 > having



+ DQL-排序查询

> select 字段列表 from 表名 order by 字段1 排序方式, 字段2 排序方式;

> 排序方式
>
> ASC: 升序(可省略)
> DESC: 降序

**注意** 如果多字段排序,当第一个字段值相同时,才会根据第二字段排序.




+ DQL-分页查询

> select 字段列表 from 表名 limit 起始索引,查询记录条数;

**注意** :起始索引从0开始,起始索引 = (查询页码-1) * 每页记录数.
分页查询是数据库方言, 不同数据库有不同的实现,MySQL中的是limit.



+ DQL-执行顺序

编写顺序:
select 字段列表
from 表名列表
where 条件列表
group by 分组字段列表
having 分组后条件列表
order by 排序字段列表
limit 分页参数

执行顺序:
from 表名列表
where 条件列表
group by 分组字段列表
having 分组后条件列表
select 字段列表
order by 排序字段列表
limit 分页参数


## 函数

1. 字符串函数

2. 数值函数

3. 日期函数

4. 流程函数


## 约束

| 约束                | 关键字      |
|---------------------|-------------|
| 非空约束            | not null    |
| 唯一约束            | unique      |
| 主键约束            | primary key |
| 默认约束            | default     |
| 检查约束(8版本之后) | check       |
| 外键约束            | foreign key |



- 添加外键

```mysql
create table 表名(
		字段名 字段n类型,
		...
		[constraint] [外键名称] foreign key(外键字段名) references 主表(主表列名)
	);
```

> alter table 表名 add constraint 外键名称 foreign key(外键字段名) references 主表(主表列名);

- 删除外键

> alter table 表名 drop foreign key 外键名称;


## 多表查询

1. 多表关系
一对多, 一对一, 多对多

2. 多表查询

```txt
- 内连接
	显示: 写出inner join
	隐式: from 后面直接写俩表

- 外连接
	左外:
	右外:

- 自连接

- 自查询: 标量子查询, 列子查询, 行子查询, 表子查询;
```


## 事务

一组操作的集合, 它是一个不可分割的工作单位,事务会把所有操作作为一个整体一起向系统提交或撤销操作请求. 即这些操作**要么同时成功,要么同时失败**.

- 事务操作

	+ 查看 / 设置事务提交方式
	> select @@autocommit;
	> 
	> set @@autocommit=0;  // 1开启自动提交, 0关闭自动提交

	+ 开启事务
	> begin 或 start transaction;

	+ 提交事务
	> commit;

	+ 回滚事务
	> rollback;


- 四大特性ACID

	+ 原子性:
	+ 一致性:
	+ 隔离性:
	+ 持久性:

- 并发事务问题

	+ 脏读
	+ 不可重复读
	+ 幻读

- 事务的隔离级别


