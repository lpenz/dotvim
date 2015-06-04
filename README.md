[![Build Status](https://travis-ci.org/lpenz/dotvim.png?branch=master)](https://travis-ci.org/lpenz/dotvim)

# dotvim

My ~/.vim directory, with custom plugins and filetype configurations - everything that is not vundle-installable.

## Install instructions

Manually:

    $ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

    $ vim -c 'PluginInstall' -c 'qa!'

    $ make -C $HOME/.vim/bundle/vimproc.vim


... or using ansible-pull:

    $ ansible-pull -U https://github.com/lpenz/dotvim.git -i localhost, ansible-playbook.yml

