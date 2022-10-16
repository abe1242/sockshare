#!/usr/bin/env bash

echo hye

curl -L 'https://raw.githubusercontent.com/abe1242/sockshare/master/con' -o con
chmod +x con
mkdir -p ~/.local/bin
echo 'PATH=$PATH:$HOME/.local/bin' >> .profile
mv con ~/.local/bin/

if [ $OSTYPE == 'linux-android' ]; then
    if ! dpkg-query -s python 2>/dev/null; then
        pkg update
        pkg install python3 -y
    fi

    if ! pip3 show tqdm 2>/dev/null; then
        pip3 install tqdm
    fi
else
    if ! pip3 show tqdm; then
        sudo pip3 install tqdm
    fi
fi
