## 基础教程

### font
- font-family
- font-style
- font-weight
- font-variant

样式:
font-style: normal | italic | oblique
normal: 正常
italic: 斜体
oblique: "倾斜"

粗细:
font-weight: normal(400) | bold(700)
normal
bold: 加粗

变体:
font-variant: normal | small-caps
small-caps: 将小写字母转为大写字母,但是比正常大写字母小一些

大小:
font-size: px | em
px: 像素单位
1em相当于当前字体大小.浏览器默认文本大小为16px

字体属性简写:
font: style variant weight size/line-height family;
**注意:** size 和 family是必须的,其他缺少会使用默认值

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
color: 颜色名 | 十六进制 | rgb[a]

文本对齐:
text-align: right | left | center | ...

文本方向:
direction: rtl
unicode-bidi: bidi-override

文本中图像的垂直对齐:
vertical-align: top | middle | bottom

文本装饰线:
text-decoration: underline | none [| line-through | overline]

文本转换:
text-transform: uppercase | lowercase | capitalize
capitalize: 首字母大写

文本缩进:
text-indent: px | em
第一行的缩进

字母间距:
letter-spacing

行高:
line-height: 

字间距:
word-spacing

空白:
white-space: nowrap
对空白部分的处理,上面例子:不折行

阴影效果:
text-shadow: px px [ px color];
第三个px: 向阴影添加模糊效果

### background
- background-color
- background-image
- background-repeat
- background-attachment
- background-position

背景图片:
background-image: none | url(url)

背景平铺:
background-repeat: repeat | repeat-x | repeat-y | no-repeat 
**注意:** x只能在y前面

背景位置:
background-position: x y
可以是精确单位,也可以是方位名词
方位名词: position: left | center | right | bottom | center | top

背景附着:
background-attachment: scroll | fixed

复合写法:没有固定顺序,一般约定为
background: color image repeat attachment position;


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
border: width style(必需) color;
左(右|上|下)边框:
border-left(right|top|bottom): width style color;

圆角边框:
border-radius

外边距:
margin[-top(bottom right left)]: px px px px | auto | inherit
共可以写四个
auto: 使其居中
inherit: 继承
**注意:** 允许负值

内边距:
padding[-top(bottom right left)]: px px px px | auto | inherit
**注意:** 不允许负值
box-sizing: border-box; 作用: 保持块宽度,不因内部padding导致总宽度增大

最大宽度: 随页面尺寸改变
max-width

### outline
**注意：**轮廓与边框不同！不同之处在于：轮廓是在元素边框之外绘制的，并且可能与其他内容重叠。同样，轮廓也不是元素尺寸的一部分；元素的总宽度和高度不受轮廓线宽度的影响。
- outline
  - outline-style
    - 与border-style一样
  - outline-color
  - outline-width
  - outline-offset

简写属性:
outline: width style(必需) color;

轮廓偏移: 在轮廓与边框之间添加空间
outline-offset: px



## 中级教程
display: none | block | inline | inline-block |...

visibility: hidden 与 display: none
visibilisty会占据位置,display隐藏的好像不存在一样

inline-block: 可设置width和height,一行可有多个(结合了inline和block)


position: 
- static: 静态的, 不受方位名词(top/bottom/right/left的影响)
- relative: 相对的
- fixed: 固定的
- absolute: 绝对的
- sticky: 粘性

堆叠顺序:
z-index: 


overflow[-x(y)]
- visible - 默认。溢出没有被剪裁。内容在元素框外渲染
- hidden - 溢出被剪裁，其余内容将不可见
- scroll - 溢出被剪裁，同时添加滚动条以查看其余内容
- auto - 与 scroll 类似，但仅在必要时添加滚动条


浮动和清楚: float clear