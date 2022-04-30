## 检查现有的SSH密钥

1.查看是否存在现有的SSH密钥

> ls -la ~/.ssh
> 
> 列出 .ssh 目录中的文件（如果存在）

2.检查目录列表以查看您是否已经拥有公共 SSH 密钥。默认情况下，GitHub 支持的公钥的文件名是以下之一。

- id_rsa.pub

- id_ecdsa.pub

- id_ed25519.pub

## 生成新的密钥

1.打开终端,粘贴下面的文本，替换为您的 GitHub 电子邮件地址。

> ssh-keygen -t ed25519 -C "your_email@example.com"

> **注意**：如果您使用的是不支持 Ed25519 算法的旧系统，请使用：
> 
> $ ssh-keygen -t rsa -b 4096 -C "your_email@example.com"

这将使用提供的电子邮件作为标签创建一个新的 SSH 密钥。

> Generating public/private algorithm key pair.

当系统提示您“输入要在其中保存密钥的文件”时，按 Enter。这接受默认文件位置。

> Enter a file in which to save the key (/home/you/.ssh/algorithm): [Press enter]

在提示符处，键入安全密码。

> Enter passphrase (empty for no passphrase): [Type a passphrase]
> 
> Enter same passphrase again: [Type passphrase again]			//不输入则不用密码

2.将SSH密钥添加到ssh-agent

在向 ssh-agent 添加新的 SSH 密钥以管理您的密钥之前，您应该检查现有的 SSH 密钥并生成一个新的 SSH 密钥。

在后台启动 ssh-agent。

> $ eval "$(ssh-agent -s)"
> 
> \> Agent pid 59566

根据您的环境，您可能需要使用不同的命令。例如，您可能需要通过`sudo -s -H`在启动 ssh-agent 之前运行来使用 root 访问权限，或者您可能需要使用`exec ssh-agent bash`或`exec ssh-agent zsh`运行ssh-agent。

> $ ssh-add ~/.ssh/id_ed25519

## 添加新的SSH密钥到github账户

1.将 SSH 公钥复制到剪贴板。

如果您的 SSH 公钥文件的名称与示例代码不同，请修改文件名以匹配您当前的设置。复制密钥时，请勿添加任何换行符或空格。

> $ cat ~/.ssh/id_ed25519.pub
> 
> Then select and copy the contents of the id_ed25519.pub file
> 
> displayed in the terminal to your clipboard

2.打开Github个人设置

> settings -> SSH and GPG keys -> New SSH key or Add SSH key -> ... -> Add SSH key.

## Testing your SSH connection

Open Terminal.

Enter the following:

> $ ssh -T git@github.com



## Attempts to ssh to GitHub

You may see a warning like this:

> The authenticity of host 'github.com (IP ADDRESS)' can't be established.
> 
> RSA key fingerprint is SHA256:nThbg6kXUpJWGl7E1IGOCspRomTxdCARLviKw6E5SY8.
>
> Are you sure you want to continue connecting (yes/no)?

验证您看到的消息中的指纹是否与GitHub 的公钥指纹匹配。如果是，则键入yes：

> Hi username! You've successfully authenticated, but GitHub does not
> 
> provide shell access.

您可能会看到以下错误消息：

> ...
> 
> Agent admitted failure to sign using the key.
> 
> debug1: No more authentication methods to try.
> 
> Permission denied (publickey).

www.baidu.com
