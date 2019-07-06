#!/bin/bash

# This script displays various information to the screen


#display 'Hello'
echo 'Hello' 


# Assign a value to a variable 
WORD='script' 

# Dislay that value using the variable.
echo "$WORD" 

# Demosntaret that single quotes cause variables to NOT get expanded. 
echo "$WORD" 

#combine the variable with hard-coded text. 
echo "This is a shell $WORD"

#Display the contents of the variable using an alternative syntax
echo "This is a shell ${WORD}"

#Append text wo the variable. 
echo "${WORD}ing is fun!"

#Show how NOT to append text to a variable.
#This doenst work. 
echo "$WORDing is fun"


#Create a new VAriable
ENDING='ed'

# Combine the varbles.
echo "This is ${WORD}${ENDING}. "


# Change the value stored in the ENDING vriable. (Reassignment.)
ENDING='ing'
echo "${WORD}${ENDING} is fun"

# Reassign value to ENDING. 
echo "You are going to write many ${WORD}${ENDING} in this class."
