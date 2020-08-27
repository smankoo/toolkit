#!/bin/bash

# check if we have python3 installed
python3 --version
if [ $? -ne 0 ]; then
    sudo apt install -y python3 python3-pip
    python3 --version
    if [ $? -ne 0 ]; then
        echo "Failed to install python3. Exiting."
        exit 1
    fi
fi

# Create virtual environment
DIR="$( cd "$( dirname "$0" )" && pwd )"
basedirname=`basename $DIR`

python3 -m venv venv --prompt $basedirname && \
. venv/bin/activate && \
if [ -f "requirements.txt" ]; then
    python3 -m pip install -r requirements.txt
    python3 -m pip install wheel
fi
