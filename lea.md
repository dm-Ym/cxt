# Redis

## Redis数据结构介绍
Redis是一个key-value的数据库, key一般是String类型, 不过value类型多种多样

| 基本类型  |                       |
| ------    | --------------------- |
| String    | hello world           |
| Hash      | {name:"Java", age:11} |
| List      | {A -> B -> c -> C     |
| Set       | A,B,C                 |
| SortedSet | {A:1,B:2,C:3}         |

| 特殊类型 |                     |
|----------|---------------------|
| GEO      | {A:{120.3, 30.5}}   |
| BitMap   | 0110110101110100101 |
| MyperLog | 0110110101110100101 |

## Redis通用命令
- keys: 查看符合模板的所有key,不建议在生产环境使用,因为会很卡
- del: 删除一个指定的key
- exists: 判断key是否存在
- expire: 给一个key设置有效期, 有效期到期时该key会被自动删除
- ttl: 查看一个key的剩余有效期
- help [command]

## String类型
字符串类型更,redis最简单的存储类型

其value是字符串,根据格式不同,又可分为3类:
- string: 普通字符串
- int: 整数类型,可以做自增、自减操作
- float: 浮点类型,可以做自增、自减操作

| key   | value |
|-------|-------|
| msg   | hello |
| num   | 10    |
| score | 9.9   |

### String常见命令
- set: 添加或修改一个String类型的键值对
- get: 根据key获取String的value
- mset: 批量set
- mget: 批量get
- incr: 整形key自增1
- incrby: 让一个整形key自增并设置步长. eg:incrby num 2
- incrfloat: 浮点数自增并**必须**指定步长
- setnx: 添加一个String类型的键值对,前提是这个key不存在,否则不执行
- setex: 添加一个String类型的键值对,并且指定有效期

### String的层级结构
作用: 防止冲突.eg:用户有id, 商品有id

实际效果: 分包

Redis的key允许有多个单词形成层级结构,用":"隔开
> 项目名:业务名:类型:id

## Hash类型
也叫散列,其value是一个无序字典, 类似于java中的HashMap结构

| key        | value |       |
|------------|-------|-------|
|            | field | value |
| cuit:edu:1 | name  | Jake  |
|            | age   | 21    |
| cuit:edu:2 | name  | Rose  |
|            | age   | 18    |

### Hash类型常见命令
- hset key field value: 添加或修改一个Hash类型的field的值
- hget key field: 根据key获取String的value
- hmset: 批量hset
- hmget: 批量hget
- hgetall: 获取一个hash类型的所有的field和value
- hkeys: 获取一个hash类型的key中的所有的field
- hvals: 获取一个hash类型的key中的所有的value
- hincrby: 让一个hash类型的key的字段值自增并设置步长. eg:hincrby age 2
- hsetnx: 添加一个hash类型的key的field值,前提是这个field不存在,否则不执行

## List类型
特征:
- 有序
- 可重复
- 插入和删除快
- 查询速度一般
常用来存储一个有序数据,例如:朋友圈点赞,评论列表等

### List类型常见命令

- lpush key element ... : 向列表左侧插入一个或多个元素
- lpop key: 移除并返回列表左侧的第一个元素,没有则返回nil

- rpush key element ... : 向列表右侧插入一个或多个元素
- rpop key: 移除并返回列表右侧的第一个元素,没有则返回nil

- lrange key start end: 返回一段角标范围内的所有元素.eg: lrange key 1 2 (包含左右,从零开始)
- blpop和brpop: 与lpop和rpop类似,只不过在没有元素时等待指定时间,而不是直接返回nil.在等待时间内,若新插入所查询的key,则可以返回.


## Set类型
类似java的HashSet

- 无序
- 元素不可重复
- 查找快
- 支持交集、并集和差集等功能

### Set类型的常见命令

- sadd key member ... : 向set中添加一个或多个元素
- srem key member ... : 移除set中的指定元素
- scard key: 返回set中元素的个数
- sismember key member: 判断一个元素是否存在于set中
- smembers: 获取set中的所有元素

- sinter key1 key2 ... : 求key1与key2的交集
- sdiff key1 key2 ... : 求key1与key2的差集
- sunion key1 key2 ... : 求key1与key2的并集

## SortedSet类型
- 可排序
- 元素不可重复
- 查询速度快

### SortedSet类型的常见命令

score: 分数;   member: value值

- zadd key score member: 添加一个或多个元素到sorted set, 如果已经存在则更新其score值
- zrem key member: 删除sorted set中的一个指定元素
- zscore key member: 获取指定元素的score值
- zrank key member: 获取指定元素的排名
- zsard key: 获取元素的个数
- zcount key min max: 统计score值在给定范围内的所有元素的个数
- zincrby key increment member: 指定元素自增,指定步长increment
- zrange key min max: 按照score排序后,获取指定排名范围内的元素
- zrangebyscore key min max: 按照score排序后,或i去指定score范围内的元素
- zdiff、zinter、zunion： 求并集、交集、差集
**注意** :所有的排名默认升序,如果要降序则在命令的z后面添加rev即可

# Redis客户端

## jedis
