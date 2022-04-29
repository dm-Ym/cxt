# About archlinux installation guide

可参考官方教程:https://wiki.archlinux.org/title/Installation_guide_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)

## 一

### 联网

lwctl

```
device list

station <device> scan

station <device> get-networks

station <device> connect <network>

`ping archlinuxcn.org` 测试
```

### 换源

vim /etc/pacman.d/mirrorlist

> Server = https://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch

vim /etc/pacman.conf

> [archlinuxcn]
Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch

### 更新系统时间

> timedatectl set-ntp true 之后可以使用 timedatectl status检查服务状态

### 分区

#### `lsblk` 查看分区情况

> EFI	300MB
swap	可选
root	随意,越大越好

`cfdisk <disk name>` 我的是`/dev/nvme0n1`

#### 格式化

`mkfs.vfat /dev/nvme0n1p1` 格式化引导分区

`mkfs.ext4 /dev/nvme0n1p2` 格式化root分区为ext4(多种可选,自己百度){}

`mkswap` /dev/<disk>

#### 挂载分区

```
mount /dev/nvme0n1p2 /mnt
mkdir -p /mnt/boot/efi
mount /dev/nvme0n1p1 /mnt/boot/efi
swapon /dev/<disk>
lsblk	#查看分区情况
```

### 安装系统

> pacstrap /mnt linux linux-firmware base base-devel bash-completion

#### 生成文件系统的表文件

> genfstab -U /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab

#### 进入新系统

> arch-chroot /mnt

## 二

### 设置时区

> ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc

运行hwclock,生成/etc/adjtime

> hwclock --systohc

### 本地化

#### 设置系统语言

vim /etc/locale.gen

将以下两行取消注释(删除前面的井号)

> en_US.UTF-8 UTF-8
zh_CN.UTF-8 UTF-8

#### 生成本地语言信息

> locale-gen

#### 设置本地语言环境变量

vim /etc/locale.conf

> LANG=en_US.UTF-8

## 三

### 主机设置

vim /etc/hostname

> hostname	主机名,随意改,无影响

### 生成对应的hosts

vim /etc/hosts

> 127.0.0.1   localhost
::1         localhost
127.0.1.1   hostname.localdomain hostname   # 这里的hostname是主机名

#### 安装相关包

> pacman -S grub efibootmgr efivar networkmanager dhcpcd iwd sudo neovim amd-ucode 

### 配置grub到EFI分区

> grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=Arch
grub-mkconfig -o /boot/grub/grub.cfg

### 激活启用NetworkManager

> systemctl enable NetworkManager

### 给root用户建立密码

> passwd 

### 新建用户

> useradd -m -G wheel newName

> passwd newName

vim /etc/sudoers 去掉%wheel ALL=(ALL:ALL) ALL的注释

### 退出重启

> exit
umount /mnt/boot/efi
umount /mnt
reboot

## 基本配置

### 添加ArchLinuxCN 存储库

该仓库是由archlinux中文社区驱动的一个非官方的软件仓库。我们使用的很多软件都需要使用这个库去下载，比如typora。

nvim /etc/pacman.conf

> [archlinuxcn]
Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch

> sudo pacman -S archlinuxcn-keyring

*注*： 如果以上更新密钥步骤出现错误，就是那种连着一串ERROR的情况，请执行以下步骤

> rm -rf /etc/pacman.c/gnupg
pacman-key --init
pacman-key --populate archlinux archlinuxcn
pacman -Syy


### 显卡驱动

> sudo pacman -S xf86-video-amdgpu

### 声卡配置

> sudo pacman -S alsa-utils pulseaudio pulseaudio-bluetooth cups

## 图形界面

### 显示服务

> sudo pacman -S xorg

### 安装字体

#### 英文字体

> sudo pacman -S ttf-dejavu ttf-droid ttf-hack ttf-font-awesome otf-font-awesome ttf-lato ttf-liberation ttf-linux-libertine ttf-opensans ttf-roboto ttf-ubuntu-font-family

#### 中文字体

> sudo pacman -S ttf-hannom noto-fonts noto-fonts-extra noto-fonts-emoji noto-fonts-cjk adobe-source-code-pro-fonts adobe-source-sans-fonts adobe-source-serif-fonts adobe-source-han-sans-cn-fonts adobe-source-han-sans-hk-fonts adobe-source-han-sans-tw-fonts adobe-source-han-serif-cn-fonts wqy-zenhei wqy-microhei

### 安装桌面环境（KDE）

> sudo pacman -S plasma-desktop alacritty sddm dolphin

#### 设置sddm登录

> sudo systemctl enable sddm


### 中文输入法

> sudo pacman -S fcitx5 fcitx5-*

nvim .pam_environment

> export GTK_IM_MODULE=fcitx5
export QT_IM_MODULE=fcitx5
export XMODIFIERS="@im=fcitx5"
