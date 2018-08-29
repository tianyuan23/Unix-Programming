#!/bin/bash
#Script name: createcontacts.sh
#Author: Tianyuan Li
#Date: 03/05/2018
#Description: A bash script that creates a contacts file and stores contact info.

echo "1. Enter a contact"
echo "2. Show contacts"
echo "3. Exit"

read option

while [ $option != 3 ]
do
    if (( $option == 1 ))
    then
        read -p "1. friend's full name: first, last. " name
        read -p "2. his/her birth date (dd-mm) " birthday
        read -p "3. his/her phone number (xxx-yyy-yyyy) " phonenum
        read -p "4. his/her email (name@domain.xyz) " email
        echo ""
        echo "$name  $birthday  $phonenum  $email" >> mycontacts.txt
    elif (( $option == 2 ))
    then
        cat mycontacts.txt
    fi
    echo "1. Enter a contact"
    echo "2. Show contacts"
    echo "3. Exit"

    read option
done
