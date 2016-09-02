#!/bin/bash
# that was a shebang, it's used to tell which shell should execute this file

# get the username so we can log into the server and install everything properly
USERNAME=$1

SERVER1=eecslinab2.case.edu
SERVER2=eecslinab3.case.edu
SERVER3=eecslinab7.case.edu

# if they entered their username, then continue.  Else, print out proper usage and exit
if [ "$USERNAME" ];
then

        # if we have a pubkey already, don't make one
        if [ -e ~/.ssh/id_rsa.pub ];
        then
		# we already have a pubkey, NO-OP because bash syntax is annoying.
                :
        else
                # otherwise, make one with the default parameters
                echo keypair not found.  Generating...
                ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
        fi

        echo This script will ask you for your password six times: once to copy over your pubkey, once to install it on the server, and this will be done for each of the three servers you have access to
        for SERVER in "$SERVER1" "$SERVER2" "$SERVER3"
        do
                echo enter your password to copy your pubkey to $SERVER
                scp -o StrictHostKeyChecking=no ~/.ssh/id_rsa.pub $USERNAME@$SERVER:~
                echo enter your password to install your pubkey to $SERVER
                ssh -o StrictHostKeyChecking=no $USERNAME@$SERVER -t "mkdir -p ~/.ssh; cat ~/id_rsa.pub >> ~/.ssh/authorized_keys; chmod -R 700 ~/.ssh; rm ~/id_rsa.pub; exit"
        done

else
        echo USAGE: ./auto_ssh_keys.sh your_case_id
fi
