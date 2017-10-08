[![Build Status](https://travis-ci.org/lpenz/dotvim.png?branch=master)](https://travis-ci.org/lpenz/dotvim)

# dotvim

My ~/.vim directory, with custom plugins and filetype configurations - everything that is not vundle-installable.

## Install instructions

Manually:

    $ curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    $ vim -c 'PlugInstall' -c 'qa!'


... or using ansible-pull:

    $ ansible-pull -U https://github.com/lpenz/dotvim.git -i localhost, ansible-playbook.yml

