## 基础教程

### font
- font-family
- font-style
- font-weight
- font-variant

---
样式:
> font-style: normal | italic | oblique

normal: 正常

italic: 斜体

oblique: "倾斜"

---
粗细:
> font-weight: normal(400) | bold(700)

normal

bold: 加粗

---
变体:
> font-variant: normal | small-caps

small-caps: 将小写字母转为大写字母,但是比正常大写字母小一些

---
大小:
> font-size: px | em

px: 像素单位

1em相当于当前字体大小.浏览器默认文本大小为16px

---
字体属性简写:
> font: style variant weight size/line-height family;

**注意:** size 和 family是必须的,其他缺少会使用默认值

---
### text
- color
- text-align
- text-decoration
- text-transform
- text-indent
- letter-spacing
- line-height
- word-spacing 
- white-space
- text-shadow

颜色:
> color: 颜色名 | 十六进制 | rgb[a]

文本对齐:
> text-align: right | left | center | ...

文本方向:
> direction: rtl  // 正向
> 
> unicode-bidi: bidi-override // 反向

文本中图像的垂直对齐:
> vertical-align: top | middle

- bottom | bottom

文本装饰线:
> text-decoration: underline | none [| line-through | overline]

文本转换:
> text-transform: uppercase | lowercase | capitalize

capitalize: 首字母大写

文本缩进:
> text-indent: px | em; // 第一行的缩进

字母间距:
> letter-spacing

行高:
> line-height: px

字间距:
> word-spacing

空白:
> white-space: nowrap

对空白部分的处理,上面例子:不折行

文本阴影效果:
> text-shadow:h-shadow v-shadow blur color;

h-shadow: 必需,水平阴影的位置,允许负值

v-shadow: 必需,垂直阴影的位置,允许负值

blur: 可选,模糊距离: 阴影的虚实

---
### background
- background-color
- background-image
- background-repeat
- background-attachment
- background-position

background-color: 
> opacity: ;  // 使用 opacity 属性为元素的背景添加透明度时，其所有子元素都继承相同的透明度。这可能会使完全透明的元素内的文本难以阅读。rgba不会对子元素应用不透明度

背景图片:
> background-image: none | url(url)

背景平铺:
> background-repeat: repeat | repeat-x | repeat-y | no-repeat 

**注意:** x只能在y前面

背景位置:
> background-position: x y

可以是精确单位,也可以是方位名词

- 方位名词: position: left | center | right | bottom | center | top

背景附着:
> background-attachment: scroll | fixed

---
简写属性:没有固定顺序,一般约定为
> background: color image repeat attachment position;

### border
- border-style
    - dotted - 定义点线边框
    - dashed - 定义虚线边框
    - solid - 定义实线边框
    - double - 定义双边框
    - groove - 定义 3D 坡口边框。效果取决于 border-color 值
    - ridge - 定义 3D 脊线边框。效果取决于 border-color 值
    - inset - 定义 3D inset 边框。效果取决于 border-color 值
    - outset - 定义 3D outset 边框。效果取决于 border-color 值
    - none - 定义无边框
    - hidden - 定义隐藏边框
- border-width: tink | medium | thick | px(上下) px(左右)
- border-color: name | HEX | RGB | HSL
- border-radius: px
- margin[-top(bottom right left)]
- padding[-top(bottom right left)]
- max-width

简写边框属性:
> border: width style(必需) color;

左(右|上|下)边框:
> border-left(right|top|bottom): width style color;

圆角边框:
> border-radius

外边距:
> margin[-top(bottom right left)]: px px px px | auto | inherit

共可以写四个
- auto: 使其居中
- inherit: 继承

**注意:** 允许负值

内边距:
> padding[-top(bottom right left)]: px px px px | auto | inherit

**注意:** 不允许负值

---
box-sizing: border-box; 作用: 保持块宽度,不被撑大

---
最大宽度: 随页面尺寸改变: max-width

---
### outline

**注意**: 轮廓与边框不同！

不同之处在于：轮廓是在元素边框之外绘制的，并且可能与其他内容重叠。同样，轮廓也不是元素尺寸的一部分；元素的总宽度和高度不受轮廓线宽度的影响。
- outline
  - outline-style
    - 与border-style一样
  - outline-color
  - outline-width
  - outline-offset

简写属性:
> outline: width style(必需) color;

轮廓偏移: 在轮廓与边框之间添加空间
> outline-offset: px


## 更多

三大特性: 层叠性, 继承性, 优先级

优先级: 
```c
继承或者*      0000
元素选择器     0001
类(伪类)选择器  0010
id选择器       0100
行内样式       1000
!important    无穷
```

---
选择器: 后代, 子, 通用兄弟, 相邻兄弟选择器
- 后代选择器(空格)
- 子选择器(>)
- 相邻兄弟选择器(+)
- 通用兄弟选择器(~)
- 并集选择器(,)
- 伪类选择器

**注意**: 只能选择其后的元素

---
属性选择器: css[attribute] css可省略
- a[target]
- a[target="_blank"]
- img[title~="value"]
  - 包含value的类. 词独立
- img[class|="top"]
  -  以top开头的类, 必须是完整或单独的单词: class="top"或class="top-text"
- [class^="top"]
  - 以top开头即可
- [class$="text"] 以text结尾, 可不必完整
- [class*="value"] 包含value的所有

---
链接伪类选择器：

顺序： :link, :visited, :hover, :active

---
> display: none | block | inline | inline-block |...

inline-block: 可设置width和height,一行可有多个(结合了inline和block)

---
visibility: hidden 与 display: none
- visibilisty会占据位置,display隐藏的好像不存在一样

---
overflow[-x(y)]
- visible - 默认。溢出没有被剪裁。内容在元素框外渲染
- hidden - 溢出被剪裁，其余内容将不可见
- scroll - 溢出被剪裁，同时添加滚动条以查看其余内容
- auto - 与 scroll 类似，但仅在必要时添加滚动条

---
阴影效果:
> box-shadow: h-shadow v-shadow blur spread color inset;
- h-shadow: 必需,水平阴影的位置,允许负值
- v-shadow: 必需,垂直阴影的位置,允许负值
- blur: 可选,模糊距离: 阴影的虚实
- spread: 可选,阴影的尺寸: 阴影的大小
- inset: 将外部阴影改为内部阴影(outset默认,不用写出来)

### 三大布局方式

标准流(文档流、普通流)、float、position

浮动和清除: float clear
> float: none | right | left;

float属性用于创建浮动框,将其移动到一边,知道左边缘或右边缘触及包含块或另一个浮动框的边缘

---
特性:
1. 浮动元素会脱离标准流(脱标)
   1. 脱离标准流的控制(脱)浮动到指定位置(动),俗称脱标.
   2. 浮动的盒子**不再保留原先的位置**
2. 浮动元素会一行内显示并且元素顶部对齐
3. 浮动的元素会具有行内块元素的特性

行内块之间默认有间隙

---
清除浮动:
- 清除浮动造成的影响
- 若父盒子本身有高度则不需要清除浮动
- 清除浮动之后,父级就会根据浮动的子盒子自动检测高度.父级有了高度就不会影响后面的标准流了.

清除浮动的方法: 
1. 额外标签法(隔离法),在父级元素后添加额外的块级标签.
2. 父级元素添加overflow属性, hidden,auto,scroll
3. 父级元素添加after伪元素
4. 父级元素添加双伪元素

2, 父元素添加overflow属性

缺点: 会隐藏溢出的部分

3, ::after
```javascript
.clearfix::after{
  content: "";
  display: block;
  height: 0;
  clear: both;
  visibility: hidden;
}
```

---
4, ::before  ::after
```javascript
.clearfix::before,
.clearfix::after{
  conten: "";
  display: table;
}
.clearfix::after{
  clear: both;
}
```

### 案例

5.3 CSS属性书写顺序(重点)

建议遵循以下顺序:

1. 布局定位属性: 
> display / position/ float / clear / visibility/ overflow (建议display第一个写 ,毕竟关系到模式)

2. 自身属性: 
> width/ height / margin/ padding / border/ background

3. 文本属性: 
> color/ font / text-decoration/ text-align/ vertical-align/ white- space / break-word

4. 其他属性( CSS3) : 
> content/ cursor / border-radius / box-shadow / text-shadow/ background:linear-gradien...

---
页面布局整体思路

为了提高网页制作的效率,布局时通常有以下的整体思路:
1. 必须确定页面的版心(可视区) , 我们测量可得知。
2. 分析页面中的行模块,以及每个行模块中的列模块。页面布局第一准则.
3. 一行中的列模块经常浮动布局,先确定每个列的大小，之后确定列的位置.页面布局第二准则
4. 制作HTML结构。我们还是遵循,先有结构,后有样式的原则。结构永远最重要
5. 所以,先理清楚布局结构,再写代码尤为重要这需要我们多写多积累

### 定位
将盒子**定**在某一个位置,**定位也是在摆放盒子,按照定位的方式移动盒子.**
> 定位 = 定位模式 + 边偏移
- static
- relative
- absolute
- fixed
- sticky

---
static:默认方式,无定位的意思(了解)

---
relative:元素在移动的时候,是相对于它**原来的位置**来移动的

特点:
- 相对自己原来的位置移动
- 原本的位置继续占有,后面的盒子任以标准流方式对准.(不脱标,继续保留原本位置)

**典型应用:**给'绝对定位'定位的

---
absolute:相对它的**祖先元素**来说的

特点:
- 若无祖先元素或祖先元素没有定位,则以浏览器为准来定位
- 若祖先元素有定位(相对绝对固定),则以最近一级的有定位祖先元素为参考点移动位置
- **不再占有原先的位置.(脱标)**

---
fixed:元素固定在浏览器可视区的位置

主要使用场景: 浏览器页面滚动时,元素的位置不会改变.
- 跟父元素没有任何关系
- 不随滚动条滚动
- 不占有原本的位置(脱标)

---
让固定定位固定在版心的右侧?
> left: 50%;
> 
> margin-left: 版心宽度的一半;

---
sticky:了解

特点:
- 以浏览器可视窗口为参照移动
- 粘性定位占有原本的位置
- 必须添加top/bottom/right/left其中一个才能生效

---
定位叠放次序z-index

z-index: 
- 整数(数字越大,越靠上)
- 若值相同,后者在上
- 数字后面没有单位
- 只有定位的盒子才有z-index

#### 定位和浮动

浮动: 只会压住下面标准流的盒子,但是不会压住标准流盒子里面的文字和图片. 浮动最初的设计是为了文字环绕图片.

绝对定位会压住标准流下面所有的内容.

---
元素的显示和隐藏
- display
- visibility
- overflow

---
display: none;

隐藏元素后,不再占有原来的位置

---
visibility: hidden | visible(可见的);

隐藏元素后,继续占有原来的位置

---
overflow: visible(默认) | hidden | scroll | auto;

### 精灵图

就是把多个小背景图整合到一张大图中,然后通过background-position平移来获取需要的图片
1. 主要针对小的背景图片使用
2. 借助background-position实现
3. 一般情况小都是负值.

### 字体图标(iconFont)
- 轻量级: 一个图标字体要比一系列的图像要小。一旦字体加载了,图标就会马上渲染出来,减少了服务器请求
- 灵活性:本质其实是文字,可以很随意的改变颜色、产生阴影、透明效果、旋转等
- 兼容性:几乎支持所有的浏览器,请放心使用

**注意:** 字体图标不能替代精灵技术,只是对工作中图标部分技术的提升和优化。


### 三角

给一个没有宽度的盒子设置边框,其中一个边框显示颜色,其他三个边框透明就可得到

e.g. :
```html
.box {
  width: 0;
  height: 0;
  border: 10px solid transparent;
  border-bottom-color: red;
}
```

### 鼠标样式
cursor: 
- default
- pointer 小手
- move  移动
- text  文本
- not-allowed 禁止

### 一些小技巧

---
文本框防止拖动:
> resize: none;

---
> vertical-align

经常用于设置图片或表单等行内块元素(或行内元素)与文字垂直对齐.
- baseline  默认
- top
- middle
- bottom

--
解决图片底部默认空白缝隙问题

原因: 行内块(行内)元素与文字默认基线(baseline)对齐

解决办法: 
1. vertical-align: top | middle | bottom
2. 把图片转为块元素display: block;

---
溢出文字省略号显示
1. 单行文本溢出
   1. 强制一行内显示文本
    white-space: nowrap;
   2. 超出部分隐藏
   overflow: hidden;
   3. 文字用省略号代替溢出部分
   text-overflow: ellipsis;
2. 多行文本溢出
   - 了解就好,让后台来做

---
margin负值应用: 边框重复

解决: margin-left: -1px;

---
若按照上面描述,右边框会被后面的盒子压住,显示不出来

解决:
1. 没有定位的情况

position: relative; 增加相对定位,压住其他盒子

2. 有定位情况

z-index: 1;提高等级

## h5

## c3
