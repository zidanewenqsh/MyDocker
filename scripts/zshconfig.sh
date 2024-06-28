#!/bin/bash
# 停止脚本执行当命令返回非零返回码
set -e

# 下载Vim安装脚本
# wget 47.93.11.51:88/install_vim.sh
bash install_vim.sh

# 安装zsh
sudo apt install -y zsh

# 将默认shell改为zsh
chsh -s /bin/zsh

# 下载oh-my-zsh安装脚本
# wget 47.93.11.51:88/install_zsh.sh
bash install_zsh.sh

# 安装zsh-syntax-highlighting插件
git clone https://gitee.com/suyelu/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# 编辑.zshrc文件，在plugins=(git)行添加zsh-syntax-highlighting
perl -i.bak -pe 's/$1/git zsh-syntax-highlighting/g if /plugins=\((git)\)/' ~/.zshrc
# 或者使用sed命令
# sed -i 's/plugins=(git)/plugins=(git zsh-syntax-highlighting)/' /home/ai/.zshrc

# 下载并安装incr插件
mkdir ~/.oh-my-zsh/plugins/incr
wget http://mimosa-pudica.net/src/incr-0.2.zsh -O ~/.oh-my-zsh/plugins/incr/incr.plugin.zsh

# 安装autojump工具
sudo apt install -y autojump

# 修改终端提示符颜色和布局，确保易于阅读和使用
echo '
autoload -U colors && colors
PROMPT="%{$fg[green]%}%n%{$reset_color%}@%{$fg[green]%}%m %{$fg[yellow]%}%1~ %{$reset_color%}%# "
RPROMPT="[%{$fg[yellow]%}%?%{$reset_color%}]"
# Useful support for interacting with Terminal.app or other terminal programs
[ -r "/etc/zshrc_$TERM_PROGRAM" ] && . "/etc/zshrc_$TERM_PROGRAM"
source /usr/share/autojump/autojump.sh
source ~/.oh-my-zsh/plugins/incr/incr*.zsh
' >> ~/.zshrc

# 安装ctags并生成系统标签，便于在Vim中进行代码导航
sudo apt install ctags 
ctags -I __THROW -I __attribute_pure__ -I __nonnull -I __attribute__ --file-scope=yes --langmap=c:+.h --languages=c,c++ --links=yes --c-kinds=+p --c++-kinds=+p --fields=+iaS --extra=+q  -f ~/.vim/systags /usr/include/* /usr/include/x86_64-linux-gnu/sys/* /usr/include/x86_64-linux-gnu/bits/*  /usr/include/arpa/*
echo 'set tags+=~/.vim/systags' >> ~/.vimrc
