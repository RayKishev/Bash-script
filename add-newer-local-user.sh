#!/bin/bash

# This script will only be executed as superuser, otherwise it will exit. 

if [[ "${UID}" -eq 0 ]] 
then 
	echo "Creating new user"
else 
	echo "You need to be root to execute this script"
	exit 1 
fi 

# If the user does not supply at least one argument, the  give them help.
if [[ "${#}" -lt 1 ]]
then 
	echo "Usage: ${0} USER_NAME [COMMENT]..."
	echo 'Create an account on ythe local system with the name of USER_NAME and a comments field of COMMENT'
	exit 1
fi


# The first parameter is the user name. 
USER_NAME="${1}"

# The rest of the parameters are for the account comments. 
shift 
COMMENT="${@}"

# Generate password 

PASSWORD=$(date +%s%N | sha256sum | head  -c48)

# Get the username 
#read -p 'Enter your username: ' USER_NAME

# Get the real name 
#read -p 'Enter your real name: ' COMMENT

# create the initial password 
#read -p 'Create your initial password: ' PASSWORD

# Create a new user with the input provided 
useradd -c "${COMMENT}" -m ${USER_NAME}

#SPECIAL_CHARACTER=$(echo '!@#$%^&*()_+=' | fold -w1 | shuf | head -c1 )
#echo "${PASSWORD}${SPECIAL_CHARACTER}"

# Check to see if the useradd command succeded. 

if [[ "${?}" -ne 0 ]]
then 
	echo "The account could not be created"
	exit 1
fi 
# Set the password 
echo -e "$PASSWORD\n$PASSWORD" | passwd ${USER_NAME}

# Check to see if the password command succeded

if [[ "${?}" -ne 0 ]]
then 
	echo 'The password for the account could not be set.'
	exit 1
fi
# Force password change on first login 
passwd -e ${USER_NAME}

# Display the username, password, and the host where the user was created. 

echo
echo 'username:'
echo "${USER_NAME}"
echo
echo 'password:'
echo "${PASSWORD}"
echo
echo 'host:'
echo "${HOSTNAME}"
exit 0

