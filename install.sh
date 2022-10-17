#!/usr/bin/env bash

#bit.ly/insconn

# Check if python3 and tqdm are installed on android
# And check for tqdm on desktop linux
if [ $OSTYPE == 'linux-android' ]; then
    conprsnt=true

    # Checking the program file is present
    # If not, then downloading it from github
    if [ ! -f con ]; then
        conprsnt=false
        echo con binary does not exist, downloading...
        curl -L 'https://raw.githubusercontent.com/abe1242/sockshare/master/con' \
            -o con
    fi
    chmod +x con

    mkdir -p ~/.local/bin
    if ! echo $PATH | grep -q $HOME/.local/bin; then
        echo 'PATH=$PATH:$HOME/.local/bin' >> ~/.profile
    fi

    # Copy the program if it was already present
    # Move it otherwise
    if [ $conprsnt == true ]; then
        cp con ~/.local/bin/
    else
        mv con ~/.local/bin/
    fi

    # Install python if it's not installed
    if dpkg-query -s python >/dev/null 2>/dev/null; then
        echo python3 is installed
    else
        apt upgrade -y \
            -o Dpkg::Options::="--force-confdef" \
            -o Dpkg::Options::="--force-confold"
        pkg install python3 -y
    fi

    # Install tqdm
    if pip3 show tqdm >/dev/null 2>/dev/null; then
        echo tqdm is installed
    else
        pip3 install tqdm
    fi
else
    curl -L 'https://raw.githubusercontent.com/abe1242/sockshare/master/con' \
        -o con
    chmod +x con

    sudo mv con /usr/local/bin

    if ! pip3 --version >/dev/null 2>/dev/null; then
        sudo apt install python3-pip
    else
        echo pip3 is installed
    fi

    if ! pip3 show tqdm >/dev/null 2>/dev/null; then
        sudo pip3 install tqdm
    else
        echo tqdm is installed
    fi
fi
