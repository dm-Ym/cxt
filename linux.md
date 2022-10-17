# linux学习



## 一、linnux常用命令

### 1.1命令格式与目录处理命令

#### **ls**

​	打印当前目录的子目录及文件

​	**语法** : ls 选项[-ald] [文件或目录]

> -a	显示所有文件
>
> -l 	显示详细信息
>
> -d 	查看目录属性
>
> -h 	显示大小
>
> -i 	显示文件的索引编号

#### **pwd**

​	显示当前所在目录

#### **cd**

​	(change directory)

​	切换目录

#### **-rw-r--r--**

​	文件权限

> 文件类型 : - 文件 d 目录 l 软链接文件
>
> rw-  r--  r--分别对应user group other
>
> user所有者 group所属组 other其他人
>
> r读	w写	x执行

### 1.2目录处理命令

#### **mkdir**

​	创建目录(make directories)

> -p 递归创建

#### **cp** 

​	复制文件或目录(copy)

​	**语法** : cp -[选项] [原文件或目录] [目标目录]

> -r	复制目录
>
> -p	保留文件属性(同步更新)

#### **mv**

​	剪切文件、改名(move)

​	mv [原文件或目录] [目标目录]

#### **rm**

​	删除文件或目录(remove)

​	语法 : rm -rf [文件或目录]

> -r	删除目录
>
> -f	强制执行

### 1.3文件处理i命令

#### **touch**

​	创建空文件

#### **cat**

​	显示文件内容

​	cat [选项] [文件名]

> -n	显示行号

#### **tac**

​	倒过来显示文件内容, 与cat相反

#### **more**

​	分页显示文件内容

​	more [文件名]

> <空格> or f	翻页
>
> <CR>			  换行
>
> q	or	Q	  退出
>
> 方向键

#### **less**

​	分页显示文件内容

> 可用/进行搜索。用n查找下一个。N上一个

#### **head**

​	显示文件前几行

> -n	显示指定行数

#### **tail**

​	显示文件后面几行

> -n	指定行数
>
> -f	动态显示文件末尾内容(若文件有变化)

### **1.4链接命令**

#### **ln**

​	生成链接文件(link)。

​	语法格式 : ln [选项] [原文件] [目标文件]

> -s	创建软链接
>
> 若选项为空,生成硬链接

​	硬链接文件可与原文件同步更新。硬链接不能跨分区，不能针对目录使用。

### 2.1权限管理命令

#### **chmod**

​	改变文件或目录权限(change the permissions mode of file)

​	语法 : chmod {[usgoa] [+-=] [rwx]} [文件或目录]

​	r 读	w 写	x 执行

​	语法 : chmod [mode=**421**(rwx分别对应数字421)] [文件或目录]

> -R	递归修改(改变目录权限的同时,改变其所有子目录权限)

```python
eg:
chyx@CH ~ $ ls -l .vimrc
-rw-r--r-- 1 chyx chyx 7703  5月 22 09:29 .vimrc
chyx@CH ~ $ chmod u+x,o+w .vimrc
chyx@CH ~ $ ls -l .vimrc
-rwxr--rw- 1 chyx chyx 7703  5月 22 09:29 .vimrc
chyx@CH ~ $ chmod 521 .vimrc
chyx@CH ~ $ ls -l .vimrc
-r-x-w---x 1 chyx chyx 7703  5月 22 09:29 .vimrc
```

#### **chown**

​	改变文件或目录的所有者

​	语法 : chown [用户] [文件或目录]

```c
eg:
chown chyx shenchao
改变文件shenchao的所有者为chyx
```

#### **chgrp**

​	改变文件或目录的所属组

​	语法 : chgrp [用户组] [文件或目录]

```c
eg:
chgrp chyx shenchao
改变文件shenchao的所属组为chyx
```

#### **umask**

​	显示、设置文件的缺省权限

​	语法 : umask -S

> -S	以rwx形式显示新建文件缺省权限

```python
eg:
chyx@CH ~/.local $ umask -S
u=rwx,g=rx,o=rx
```



### **3.1文件搜索命令**

#### **find**

​	文件搜索

​	语法 : find [搜索范围]  [匹配条件]

>-**name**	按文件名
>
>​	-iname	不区分大小写
>
>eg:find /etc -name init	在目录etc中查找文件init
>
>-**size**	按文件大小
>
>​	+n 大于	-n 小于	n等于
>
>eg:find / -size +204800	在根目录下查找大于100MB的文件(512字节为单位)
>
>-**user**	按文件所有者
>
>​	-**group**	按所素组
>
>eg:find /home -user chyx	在home目录下查找所有者为chyx的文件
>
>-[min](minute)	按时间
>
>​	-amin	访问时间 access
>
>​	-cmin	文件属性 changge
>
>​	-mmin	文件内容 modify
>
>eg:find /etc -cmin -5	五分钟内被修改过属性的文件和目录
>
>-**a**	同时满足
>
>-**o**	满足其一即可
>
>eg:find /etc -size +163840 -a -size -204800	大于80MB小于100MB的文件
>
>-**type**	根据文件类型分类
>
>​	f 文件	d 目录	l 软链接文件
>
>eg:find /etc -name [init*](init开头的文件/) -a -type f	同时满足init开头和是文件两个要求
>
>**-exec / -ok 命令 {} \;**
>
>eg:find /etc -name init* -a -typr f -exec ls -l {} \;	查找init开头的文件并显示详细信息
>
>eg:find /etc -name init* -a -typr f -ok ls -l {} \;		会询问是否进行后面的ls -l命令
>
>-**inum**	按i节点查找

#### **locate**

​	在[文件资料库](/var/lib/miocate/miocate.db 会定期更新)中查找文件updatedb手动更新

​	语法 : locate [文件名]

> -i	不区分大小写

#### **which**

​	显示命令所在目录

```c
eg:
which mv
/usr/bin/mv
```

#### **whereis**

​	搜索命令所在目录及帮助文档路径

> 1	命令的帮助
>
> 5	配置文件的帮助

#### **grep**

​	搜寻字串匹配的行并输出

​	语法 : grep [选项] [指定字串] [文件]

> -i	不区分大小写
>
> -v	反向查找
>
> -n	输出行号
>
> --color=auto	结果颜色显示

**4.1帮助命令**

#### **man**

​	获取帮助信息(manual)

​	语法 : [命令或配置文件名称(不需要路径)]

> man 5 passwd	查看配置文件的帮助

#### **help**

​	获取shell内置命令的帮助信息

#### **whatis**

​	查看命令简短信息

#### **apropos**

​	查看配置文件的简短信息

### 4.1用户管理命令

#### **useradd**

​	添加新用户

passwd

​	设置用户密码

who

​	查看登录用户信息

### 5.1**压缩解压命令**

#### **gzip**

​	压缩文件为.gz(GNU zip)

​	只能压缩文件,不能压缩目录。

gunzip

​	解压缩.gz

#### **tar**

​	打包目录为.tar.gz

​	语法 : tar [选项] [压缩后文件名] [目录]

> -c	打包
>
> -v	显示详细信息
>
> -f	指定打包文件名(该参数只能放选项最后面)
>
> -z	打包同时压缩
>
> -z	解压缩
>
> -x	解包

压缩 : tar -zcvf newname.tar.gz [目标目录]

解压 : tar -zxvf [目标目录]

压缩 : tar -cjf [newfiname] [目标文件]	压缩为.tar.bz2

解压 : tar -xjf [目标文件]						解压.tar.bz2

#### **zip**

​	压缩文件或目录为.zip

​	语法 : zip [选项] [压缩后] [目标文件或目录]

> -r	压缩目录

umzip

​	解压缩.zip文件

​	unzip [目标文件]

#### **bzip2**

​	压缩文件为.bz2

​	语法 : bzip2 [选项] [文件]

> -k	产生压缩文件后保留源文件

bunzip2

​	解压缩.bz2

> -k 	解压缩后保留原文件

### **6.1网络命令**

#### **write**

​	给用户发信息, 以<C-D>保存结束

​	语法 : write [用户名]

#### **wall**

​	发广播消息(write all)

​	语法 : wall [message]

#### **ping**

​	测试网路连通性

​	语法 : ping [选项] IP地址

> -c	指定发送次数

eg: ping -c 3 www.baidu.com

#### **ip**

​	查看和设置网卡信息(interface configure)

#### **mail**

​	查看、发送邮件

​	mail [用户名]

​	mail查看

​	然后在home目录可以看到一封latter

#### **last**

​	列出目前与过去登入系统的用户信息

lastlog

​	最后一次登录信息

traceroute

​	显示数据包到主机间的路径

betstart

​	显示网路相关信息

> -t	TCP协议
>
> -u	UDP协议
>
> -l	监听
>
> -r	路由
>
> -n	显示IP地址和端口号

### **7.1挂载命令**

#### **mount**

​	语法 : mount [选项] 设备文件名 挂在点



### **8.1关机重启命令**

#### **shutdown** 

​	关机

​	shutdown [选项] [时间]

> -c	取消前一个关机命令
>
> -h	关机
>
> -r	重启

```c
eg:
shutdown -h 20:30	晚上八点半关机
init 0	关机(仅了解)
```

#### **reboot**

​	重启

​	init 6(仅了解)



系统运行级别

> 0	关机
>
> 1	单用户
>
> 2	不完全多用户,不含NFS(网络文件系统)
>
> 3	完全多用户
>
> 4	未分配
>
> 5	图形界面
>
> 6	重启

## 二、用户和用户组管理

​	了解一下这些文件就行

> /etc/[passwd](用户信息文件)	/etc/shadow	/etc/group	/etc/gshadow	
>
> /home/用户名	/var/spoool/mail/用户名	
>
> /etc/default/useradd	/etc/login.defs

用户配置文件

​	/etc/[passwd](用户信息文件)	/etc/[shadow](影子文件/密码文件)	/etc/[group](组信息文件)	/etc/[gshadow](组密码文件)

用户模板目录

​	/etc/skel/

用户管理相关文件、用户管理命令、用户组管理命令

useradd

​	添加用户命令

passwd

​	修改用户密码

usermod

​	修改用户信息

chage

​	修改用户密码状态

userdel

​	删除用户

> -r	删除用户同时删除家目录

su

​	切换用户

> -: 	只使用"-",连带用户的环境变量一起切换
>
> -c	仅执行一次命令,而切换用户身份

id	

​	查看用户

grooup

​	添加用户组

> -g GID	指定组ID

groupmod

​	修改用户组

> -g GID	修改组ID
>
> -n			修改组名
>
> eg: groupmod -n testgroup group1	把组名group1修改为testgroup

groupdel

​	删除用户组

gpasswd

​	把用户添加或从组中删除

​	语法 : gpasswd [选项] [组名]

> -a 用户名	添加用户
>
> -d 用户名	从组中删除

## 三、权限管理

### 1.1ACL权限

### 1.2文件特殊权限

SetUID

SetGID

Sticky BIT

### 1.3文件系统属性chattr权限

​	语法 : chattr [+-=] [选项] 文件或目录名

> +:	增加权限
>
> -:	删除权限
>
> =:	等于某权限
>
> -i
>
> -a

lsattr

​	查看文件系统属性

​	语法 : lsattr [选项] [文件名]

> -a	显示所有文件和目录
>
> -d	列出目录本身属性,非子文件

### 1.4系统命令sudo权限

​	/etc/sudoers

## 四、文件系统管理

分区类型:主分区、扩展分区、逻辑分区

文件系统：ext2、ext3、ext4

文件系统常用命令

df

​	文件系统查看

> -a	显示所有文件系统信息
>
> -h	一个人性化的选项
>
> -T	显示文件系统类型\

du

​	统计目录或文件大小

> -a	显示每个子文件的磁盘占用量
>
> -h	同上
>
> -s	统计总占用量,而不列出子目录和子文件的占用量

fsck

​	文件系统修复命令

> -a	不显示用户提示,自动修复文件系统
>
> -y	与-a一致有些系统不支持-a

dumpe2fs

​	显示磁盘状态

​	语法 : dumpe2fs [分区设备文件名]

fdisk分区

​	partprobe

​		重新读取分区表信息,避免重启

#### **/etc/fstab**

​	文件系统静态信息。**<u>此文件出错会导致系统崩溃</u>**

​	只读文件,系统启动报错时不能修改。

> mount -o renmount,rw /			重挂载,读写权限,[根](/)目录。然后进行修复。

​	只能在fstab文件出错报错时才能依靠这个解决。而且,使用这个文件修复的前提是能看到这个文件的报错信息,也就是说[根](/)分区没有问题。	

#### **ntfs-3g**

​	使系统识别NTFS文件系统

​	[使系统识别NTFS文件系统的另一个方法是重新编译内核](了解一下就行)。

os-prober

​	探测系统上其他操作系统的磁盘，并将它们添加到引导加载程序中

分配swap分区





## 五、Shell编程

shell解释器：翻译终端命令，使内核去作用于硬件。

echo

​	echo [选项] [输出内容]

> -e	支持反斜杠控制的字符转换

alias

​	命令别名

​	语法 : alias 别名='原命令'

​	alias查询命令别名

### 输出重定向

| 正确和错误输出都保存到同一文件 | 命令 &> 文件                              | 覆盖                            |
| ------------------------------ | ----------------------------------------- | ------------------------------- |
|                                | 命令 &>> 文件                             | 追加                            |
|                                | 命令 >> 文件1 [2>>](2和>>不能有空格)文件2 | 正确输出放文件1,错误输出放文件2 |

输入重定向

wc

​	语法 : wc [选项] [文件名]

> -c	统计字节数
>
> -w	统计单词数
>
> -l	统计行数

```python
eg:
chyx@CH ~ $ wc -l < .vimrc
237
```

### 多命令顺序执行与管道符

| ;    | 命令1 ; 命令2    | 多命令顺序执行,没什么关系      |
| ---- | ---------------- | ------------------------------ |
| &&   | 命令1 && 命令2   | 命令1正确才会执行命令2；反之   |
| \|\| | 命令1 \|\| 命令2 | 命令1不正确才会执行命令2；反之 |

### |(管道符)

​	命令1 | 命令2		命令1的正确操作作为命令2的操作对象。命令1必须正确输出。

```python
eg:
ll /etc | more		分屏显示etc文件
```

### 通配符

| ?    | 匹配任意一个字符                                   |
| ---- | -------------------------------------------------- |
| *    | 0个或多个字符,也就是可以匹配任何内容               |
| []   | 匹配中括号中任意一个字符 ---------1                |
| [-]  | 匹配括号中任意一个字符eg:[a-z]  [0-9] -----------2 |
| [^]  | 匹配不是括号中的字符----------3                    |

```python
eg:
chyx@CH /tmp $ ls
0abc  aabc  abc  dkabc
chyx@CH /tmp $ ls ?abc
0abc  aabc
chyx@CH /tmp $ ls *abc
0abc  aabc  abc  dkabc
chyx@CH /tmp $ ls [a-z]abc
aabc						----------2
chyx@CH /tmp $ ls [^a-z]abc
0abc						----------3
chyx@CH /tmp $ ls [da0]abc
0abc  aabc					----------1
```

### shell基础

​	**<u>注意</u>**:等号左右不能有空格。若想要空格,要用引号括起来。环境变量名建议大写,易于区分。

#### 用户自定义变量

​	可自定义

​	调用变量echo	变量查看set	变量删除unset name

```python
chyx@CH ~ $ aa=123
chyx@CH ~ $ echo $aa
123
chyx@CH ~ $ aa="$aa"456
chyx@CH ~ $ aa=${aa}789
chyx@CH ~ $ echo $aa
123456789
```

```python
chyx@CH ~ $ set | grep aa		set查看所有变量
aa=123456789
chyx@CH ~ $ unset aa | grep aa
chyx@CH ~ $
```



#### 环境变量

​	有一部分和系统相关的变量不能更改

​	设置环境变量export name=value		查询变量env		删除变量unset name

​	PS1

#### 位置参数变量

​	不能自定义变量,可以更改值

#### 预定义

​	同上			(位置参数变量包含于预定义)

read

​	接受键盘输入

​	read [选项] [变量名]

> -p "提示信息"	  在等待时打印提示信息
>
> -[t](单位s)						等待
>
> -n						只接收指定的字符数,就会执行
>
> -s						隐藏输入数据。就像输入密码那样看不见

#### 数值计算

declare	

​	声明变量类型

​	declare [+-] [选项] [变量名]

> -:	"-"给变量设定类型属性
>
> +:	"+"给变量取消类型属性
>
> -i	将变量声明为整数型
>
> -x	将变量声明为环境变量
>
> -p	显示指定的被声明的类型

```python
方法一:declare
chyx@CH ~ $ aa=11
chyx@CH ~ $ bb=22
chyx@CH ~ $ declare -i cc=$aa+$bb
chyx@CH ~ $ echo $cc
33
方法二:expr("+"两边空格不能少)/let
chyx@CH ~ $ dd=$(expr $aa + $bb)
chyx@CH ~ $ echo $dd
33
方法三:$(())/$[]
chyx@CH ~ $ cc=$(($aa+$bb))
chyx@CH ~ $ echo $cc
33
chyx@CH ~ $ cc=$(($aa + $bb))
chyx@CH ~ $ echo $cc
33
```

#### 变量测试与内容替换

soure

​	使文件直接生效

​	语法 : soure 文件	/ 	. 文件("."与soure同义)

#### 正则表达式

#### 字符截取命令

cut

​	字段提取命令

​	cut [选项] [文件名]

> -f 列号		提取第几列
>
> -d 分割符	按照指定分割符割列

printf

awk

sed
