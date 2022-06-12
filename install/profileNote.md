# 关于配置

## jdk:

export JAVA_HOME=/usr/lib/jvm/java1.8.0_321
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HONE}/lib
export PATH=$PATH:${JAVA_HOMR}/bin



## maven:

export MAVEN_HOME=全路径名
export PATH=$PATH:${MAVEN_HOME}/bin


## about alacritty ranger preview_image

sudo pacman -S ueberzug

set preview_images true
set use_preview_script true
set preview_images_method ueberzug


## sddm theme

sudo nvim /etc/sddm.conf.d/autologin.conf

[Theme] 主题默认放在/usr/share/sddm/themes/

```
[Autologin]
User=username
Session=plasma.desktop		//自动登录

[Theme]
Current=Starcraft
```

