#! /bin/bash

file=/etc/startup_was_launched
if [[ -f "$file" ]]
then
    echo "$file exists, hence doing nothing."
else
    echo "Doing user management..."
    groupadd anupamgp
    adduser anupamusr
    echo "anupamusr:anupamusr" | chpasswd
    usermod -g anupamgp anupamusr
    usermod -aG wheel anupamusr

    sudo -u anupamusr echo "sample file" > /home/anupamusr/"log-`date '+%Y-%m-%d'`.log"

    touch $file
fi
