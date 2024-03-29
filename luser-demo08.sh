#!/bin/bash



FILE="/tmp/data"
head -n1 /etc/passwd > ${FILE}

# Redirect STDIN to a program. 
read LINE < ${FILE}
echo "LINE contains: ${LINE}"

# Redirect STDOUT to a file, overwriting the file. 
head -n3 /etc/passwd > ${FILE}
echo
echo "Contents of ${FILE}:"
cat ${FILE}

# Redirect STDOUT to a file, appending to the file. 
echo "${RANDOM} ${RANDOM}" >> ${FILE}
echo "${RANDOM} ${RANDOM}" >> ${FILE}
echo 
echo "Contents of ${FILE}:"
cat ${FILE}

# Redirect STDIN to a prgramm, using FD 0. 
read LINE 0< ${FILE}
echo
echo "LINE contains: ${FILE}"

#Redirect STDOUT to a file using FD 1, overwriting the file. 
head -n3 /etc/passwd 1> ${FILE}
echo 
echo "Contents of ${FILE}:"
cat ${FILE}

#Redirect STDOUT and STDERR through a pipe. 
echo
head -n3 /etc/passwd /fakefile |& cat -n

# Send output to STDERR
echo "This is STDERR!" >&2

# Discard STDOUT 
echo
echo "Discarding STDOUT:"
head -n3 /etc/passwd /fakefile > /dev/null

# Discard STDERR
echo 
echo "Discarding STDERR:"
head -n3 /etc/passwd /fakefile 2> /dev/null

# Discard STDOUT and STDERR 
echo
echo "Discarding STDOUT and STDERR:"
head -n3 /etc/passwd /fakefile &> /dev/null

# Clean up
rm ${FILE} ${ERR_FILE} &> /dev/null

