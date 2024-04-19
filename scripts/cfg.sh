#!/bin/bash

# vim
wget 47.93.11.51:88/install_vim.sh
bash install_vim.sh
rm install_vim.sh

# zsh
sudo apt install -y zsh
chsh -s /bin/zsh
wget 47.93.11.51:88/install_zsh.sh
bash install_zsh.sh
rm install_zsh.sh
git clone https://gitee.com/suyelu/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
perl -i -pe 's/$1/git zsh-syntax-highlighting/g if /plugins=\((git)\)/' ~/.zshrc
mkdir ~/.oh-my-zsh/plugins/incr
wget http://mimosa-pudica.net/src/incr-0.2.zsh -O ~/.oh-my-zsh/plugins/incr/incr.plugin.zsh
sudo apt install -y autojump
echo '
autoload -U colors && colors
PROMPT="%{$fg[green]%}%n%{$reset_color%}@%{$fg[green]%}%m %{$fg[yellow]%}%1~ %{$reset_color%}%# "
RPROMPT="[%{$fg[yellow]%}%?%{$reset_color%}]"
# Useful support for interacting with Terminal.app or other terminal programs
[ -r "/etc/zshrc_$TERM_PROGRAM" ] && . "/etc/zshrc_$TERM_PROGRAM"
source /usr/share/autojump/autojump.sh
source ~/.oh-my-zsh/plugins/incr/incr*.zsh
' >> ~/.zshrc

sudo apt install ctags 
ctags -I __THROW -I __attribute_pure__ -I __nonnull -I __attribute__ --file-scope=yes --langmap=c:+.h --languages=c,c++ --links=yes --c-kinds=+p --c++-kinds=+p --fields=+iaS --extra=+q  -f ~/.vim/systags /usr/include/* /usr/include/x86_64-linux-gnu/sys/* /usr/include/x86_64-linux-gnu/bits/*  /usr/include/arpa/*
echo 'set tags+=~/.vim/systags' >> ~/.vimrc
echo '
__conda_setup="$('~/conda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "~/conda/etc/profile.d/conda.sh" ]; then
        . "~/conda/etc/profile.d/conda.sh"
    else
        export PATH="~/conda/bin:$PATH"
    fi
fi
unset __conda_setup' >> ~/.zshrc

# chinese
# sudo dpkg-reconfigure locales
