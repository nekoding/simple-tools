#!/usr/bin/env bash

# COLOR SCHEME
##################
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
##################

start_program()
{
    banner
    boot $@
    check_git
    clone_project $@
    running_skeleton $@
}

banner()
{
echo """
█░░ ▄▀█ █▀█ ▄▀█ █░█ █▀▀ █░░   █▀█ ▄▀█ █▀▀ █▄▀ ▄▀█ █▀▀ █▀▀   █▀▀ █▀▀ █▄░█ █▀▀ █▀█ ▄▀█ ▀█▀ █▀█ █▀█
█▄▄ █▀█ █▀▄ █▀█ ▀▄▀ ██▄ █▄▄   █▀▀ █▀█ █▄▄ █░█ █▀█ █▄█ ██▄   █▄█ ██▄ █░▀█ ██▄ █▀▄ █▀█ ░█░ █▄█ █▀▄

-- Tools by      : Enggar Tivandi <https://github.com/nekoding>
-- Skeleton from : Spatie <https://github.com/spatie/package-skeleton-laravel>
"""
}

boot()
{
    echo -e "Starting jobs..." && sleep 2s
    if [ -z $1 ]
    then
        echo -e "${RED}[✘] package name not found ${NC}"
        echo "how to run : ./laravelpack.sh your-package-name"
        exit 1
    fi
}

check_git()
{
    echo -e "check is git installed ? " && sleep 1s
    if ! command -v git &> /dev/null
    then
        echo -e "${RED}[✘] Need install git${NC}"
        sudo apt install git
    else
        echo -e "${GREEN}[✓] Git found${NC}"
    fi
}

clone_project()
{
    git clone https://github.com/spatie/package-skeleton-laravel.git $1
}

running_skeleton()
{
    echo -e "running configure-skeleton.sh ..." && sleep 2s
    cd $1 && ./configure-skeleton.sh
}

# Start Script
start_program $1