# Spring配置文件

.1 Bean(可复用组件)标签基本配置
  用于配置对象交由Spring来创建
  默认情况下它调用的是类中的`无数构造函数` ,如果没有无参构造函数则不能创建成功.
  基本属性:
	- id:Bean实例在Spring容器中的唯一标识
	- class:Bean的全限定名称.
.2 Bean标签范围配置
_1. scope:指对象的作用范围,取值(常见两个):
	singleton
	prototype
	request
	session
	global-session

_2. 当scope的数值为singleton时
	Bean的实例化个数:1个
	Bean的实例化时机:当Spring核心文件被加载时,实例化配置的Bean实例.
	Bean的生命周期:
		- 对象创建:当应用加载,创建容器时,对象就被创建了
		- 对象运行:只要容器在,对象就一直存在
		- 对象销毁:当应用卸载,销毁容器时,对象就销毁了

_3. 当scope的数值为prototype时
	Bean的实例化个数:多个
	Bean的实例化时机:当调用getBean()时,实例化Bean.
	Bean的生命周期:
		- 对象创建:当应用加载,创建容器时,对象就被创建了
		- 对象运行:只要容器在,对象就一直活着.
		- 对象销毁:当对象长时间不用时,被Java的垃圾回收器回收.

.3 Bean的生命周期配置
	<bean id="" class="" init-method="" destory-method=""></bean>
init-method:指定类中的初始化方法名称	
destory-method:指定类中的销毁方法名称

.4 Bean实例化三种方式
- 无参`构造` 方法实例化
	<bean id="" class=""></bean>
- 工厂`实例` 方法实例化(使用某个类中的某个方法创建对象)
	<bean id="ID1" class=""></bean>
	<bean id="ID2" factory="ID1" factory-method="方法名"></bean>
- 工厂`静态` 方法实例化(使用某个类中的某个静态方法创建对象)
	<bean id="" class="" factory-method=""></bean>

.5 依赖注入(Dependency Injection)
	IOC的作用:
		降低程序之间的耦合(依赖关系)
	依赖关系的管理:
		交给Spring来维护.在当前类需要用到其他类对象,有Spring提供,我们只需要在配置文件中说明依赖关系的维护.
	依赖注入:
	 能注入的数据:三类
		基本类型和String
		其他bean类型(在配置文件中或者注解配置过的bean)
		复杂类型/集合类型
	 注入方式:三种
		一:使用构造函数提供
		二:使用set方法提供
		三:使用注解提供
	
_1:构造函数注入:
	使用的标签:constructor-arg
	标签出现的位置,bean标签的内部
	属性:
		type:用于指定要注入的数据的数据类型,该shujuleiixng也是构造函数中某个或某些参数的类型
		index:用于指定要注入的数据给构造函数中指定索引位置的参数赋值.索引的位置是从0开始
		name:用于指定给构造函数中指定名称的参数赋值
		value:用于提供基本类型和String的数据
		ref:用于指定其他bean类型数据(引用)
优势:获取对象时,注入数据是必需的操作,否则对象无法创建成功.
弊端:改变了bean对象的实例化方式,在获取对象时,如果用不到这些数据,也必须提供.

_2: set方法注入:
- 设计标签:property
- 出现位置:bean标签的内部
- 标签的属性:
	name:用于指定注入时所调用的set方法名称
	value:用于提供基本类型和String的数据
	ref:用于指定其他bean类型数据(引用)
优势:创建对象是没有限制,可以直接使用默认构造函数.
弊端:如果有某个成员必须有值,获取对象市有可能set方法没有执行

.6 使用注解
- 用于创建对象的: 
	Component:把当前类对象存入Spring容器中
	属性:value:用于指定bean的id,当不写时,默认是当前类名,且首字母改小写.

	Controller:一般用于表现层
	Service:一般用在业务层
	Reposaiory:一般用于持久层	//提供明确使用的注解,使三层对象更加清晰.这仨与Component作用和属性一样.

- 用于注入数据的:
	<property>标签作用一样
	Autowired:自动按照类型注入.只要容器中有唯一一个bean对象类型和要注入的变量类型匹配,就可以注入成功.
		出现位置:可以是变量上,也可以是方法上 
		在使用注解注入时,set方法就不是必须的了.
	如果ioc容器中没有任何bean的类型和要注入的变量类型匹配,则报错.
	如果ioc容器中有多个类型匹配时.按照变量名继续匹配.

	Qualifier:
	作用:在按照类型注入的基础之上再按照名称注入.它给类成员注入时不能单独使用.但是给方法参数注入时可以.
	属性:value,用于指定bean的id.

	Resource:
	作用:直接按照bean的id注入,它可以独立使用
	属性:name,用于指定bean的id.

	以上三个注入都只能注入其他bean类型的数据,而基本类型和String类型无法使用上述注解实现.另,集合类型的注入只能通过xml实现.

	Value:
	作用:用于注入基本类型和String类型的数据.
	属性:value,用于指定数据的值.它可以使用Spring中的SpEL(Spring的EL表达式)
		SpEL写法:$(表达式)
- 用于改变作用范围的:
	<scope>属性实现的功能是一样的
	Scope:
	作用:用于指定bean的范围.
- 和生命周期相关:
	init-method和destroy-method作用一样.
	PreDestroy
	PostConstrut
