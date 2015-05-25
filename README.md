# dotvim

My ~/.vim directory, with custom plugins and filetype configurations - everything that is not vundle-installable.

## Install instructions

Manually:

    $ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

    $ vim -c 'PluginInstall' -c 'qa!'

... or using ansible-pull:

    $ ansible-pull -U https://github.com/lpenz/dotvim.git -i localhost, ansible-playbook.yml

