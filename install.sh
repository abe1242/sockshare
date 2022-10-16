#!/usr/bin/env bash

#bit.ly/insconn

conprsnt=true

if [ ! -f con ]; then
    conprsnt=false
    echo con binary does not exist, downloading...
    curl -L 'https://raw.githubusercontent.com/abe1242/sockshare/master/con' -o con
fi
chmod +x con
mkdir -p ~/.local/bin

if ! echo $PATH | grep -q $HOME/.local/bin; then
    echo 'PATH=$PATH:$HOME/.local/bin' >> ~/.profile
fi

if [ $conprsnt == true ]; then
    cp con ~/.local/bin/
else
    mv con ~/.local/bin/
fi

if [ $OSTYPE == 'linux-android' ]; then
    if dpkg-query -s python >/dev/null 2>/dev/null; then
        echo python3 is installed
    else
        pkg upgrade -y
        pkg install python3 -y
    fi

    if pip3 show tqdm >/dev/null 2>/dev/null; then
        echo tqdm is installed
    else
        pip3 install tqdm
    fi
else
    if ! pip3 show tqdm; then
        sudo pip3 install tqdm
    fi
fi
