#!/bin/bash

# This shell script will only be exectuted with root privileges, otherwise it will not create a user and returns an exit status of 1. 

if [[ "${UID}" -eq 0 ]]
then 
	echo "Creating new user"
else 
	echo "You are not root"
exit 1
fi


# Ask to enter the username 
read -p 'Enter your username: ' USER_NAME

# Ask for the real name of the user 
read -p 'Enter your real full name: ' COMMENT

#create the initial password
read -p 'Enter your initial password: ' PASSWORD

# Create a new user with the input provided
useradd -c "${COMMENT}" -m ${USER_NAME}


# Check to see if the useradd command succeeded. 
# We don't want to tell the user that an account was created when it has not been. 

if [[ "${?}" -ne 0 ]]
then 
	echo "The account could not been created."
	exit 1
fi

# Set the password for the user
echo -e "$PASSWORD\n$PASSWORD" | passwd  ${USER_NAME}

if [[ "${?}" -ne 0 ]]
then 
	echo 'The password for the account could not be set.'
	exit 1
fi 
# Force to change passsword 
passwd -e ${USER_NAME}

#inform the user if the account wasnt able to create. If the account is not created script returns exit status 1. 

#Display the USER_NAME PASSWORD and HOST where account created.
echo 
echo 'username:'
echo "${USER_NAME}"
echo
echo 'password:'
echo "${PASSWORD}"
echo 'host:'
echo "${HOSTNAME}"
exit 0

