#!/bin/bash

#------------------------------------------
# Purpose:
# Created Date:  Monday 18 July 2022 05:08:41 PM IST
# Author: Harsh Panchal
# Usage:
#------------------------------------------

<<Desc

#Color  Foreground Code Background Code
Black       30              40
Red         31              41
Green       32              42
Yellow      33              43
Blue        34              44
Magenta     35              45
Cyan        36              46
White       37              47

Some additional options are like below −
Option  Code    Description
Reset       0   Backgroundack to normal (remove all styles)
Bold        1   Blueold the text
Underline   4   Underline text
Inverse     7   IN_FILEnterchange colors of background and foreground
Bold off    21  Normal from bold
Uline off   24  Normal from Underline
Inverse off 27  Reverse of the Inverse

Example
"\033[1;31mThis is bold red text\033[0m

Desc
#------------------------------------------

#HIGHLIGHT='\033[31;5;96m' # Blinking Blue
HIGHLIGHT='\033[33;1;33m' # Bold Yello
HIGHLIGHT='\033[33;1;93m' # Bold Orange

DEFAULT='\033[0m'

hour=$(date +"%-I")
minute=$(date +"%-M")

quarter(){
    activate "[ $((minute/5)) = 3 ] || [ $((minute/5)) = 9 ]" "Q U A R T E R"
}

twenty(){
    activate "[ $((minute/5)) = 4 ] || [ $((minute/5)) = 8  ] || [ $((minute/5)) = 5 ] || [ $((minute/5)) = 7 ]" "T W E N T Y"
}

five_min(){
    activate "[ $((minute/5)) = 1 ] || [ $((minute/5)) = 11  ] || [ $((minute/5)) = 5 ] || [ $((minute/5)) = 7 ]" "F I V E"
}

half(){
    activate "[ $((minute/5)) = 6 ]" "H A L F"
}

ten_min () {
    activate "[ $((minute / 5)) = 2 ] || [ $((minute / 5)) = 10 ]" "T E N"
}

to () {
    activate "[ $((minute / 5)) -gt 6 ] && [ $((minute / 5)) -le 11 ]" "T O"
}

past () {
    activate "[ $((minute / 5)) -gt 0 ] && [ $((minute / 5)) -le 6 ]" "P A S T"
}

one () {
    activate "([ $hour -eq 12 ] && [ $minute -gt 30 ]) || ([ $hour -eq 1 ] && [ $minute -le 30 ])" "O N E"
}

two () {
    activate "([ $hour -eq 1 ] && [ $minute -gt 30 ]) || ([ $hour -eq 2 ] && [ $minute -le 30 ])" "T W O"
}

three () {
    activate "([ $hour -eq 2 ] && [ $minute -gt 30 ]) || ([ $hour -eq 3 ] && [ $minute -le 30 ])" "T H R E E"
}

four () {
    activate "([ $hour -eq 3 ] && [ $minute -gt 30 ]) || ([ $hour -eq 4 ] && [ $minute -le 30 ])" "F O U R"
}

five () {
    activate "([ $hour -eq 4 ] && [ $minute -gt 30 ]) || ([ $hour -eq 5 ] && [ $minute -le 30 ])" "F I V E"
}

six () {
    activate "([ $hour -eq 5 ] && [ $minute -gt 30 ]) || ([ $hour -eq 6 ] && [ $minute -le 30 ])" "S I X"
}

seven () {
    activate "([ $hour -eq 6 ] && [ $minute -gt 30 ]) || ([ $hour -eq 7 ] && [ $minute -le 30 ])" "S E V E N"
}

eight () {
    activate "([ $hour -eq 7 ] && [ $minute -gt 30 ]) || ([ $hour -eq 8 ] && [ $minute -le 30 ])" "E I G H T"
}

nine () {
    activate "([ $hour -eq 8 ] && [ $minute -gt 30 ]) || ([ $hour -eq 9 ] && [ $minute -le 30 ])" "N I N E"
}

ten () {
    activate "([ $hour -eq 9 ] && [ $minute -gt 30 ]) || ([ $hour -eq 10 ] && [ $minute -le 30 ])" "T E N"
}

eleven () {
    activate "([ $hour -eq 10 ] && [ $minute -gt 30 ]) || ([ $hour -eq 11 ] && [ $minute -le 30 ])" "E L E V E N"
}

twelve () {
    activate "([ $hour -eq 11 ] && [ $minute -gt 30 ]) || ([ $hour -eq 12 ] && [ $minute -le 30 ])" "T W E L V E"
}

oclock () {
    activate "[ $((minute / 5)) -eq 0 ]" "O'C L O C K"
}

it () {
    activate "true" "I T"
}

is () {
    activate "true" "I S"
}

activate(){
    if eval "$1"
    then
        printf "%s%s%s" "$HIGHLIGHT" "$2" "$DEFAULT"
        return
    fi

    echo $2
}

clear
printf "${LPAD}%b L %b A S A M P M\n" "$(it)" "$(is)"
printf "${LPAD}A C %b D C\n"          "$(quarter)"
printf "${LPAD}%b %b X\n"             "$(twenty)" "$(five_min)"
printf "${LPAD}%b S %b F %b\n"        "$(half)" "$(ten_min)" "$(to)"
printf "${LPAD}%b E R U %b\n"         "$(past)" "$(nine)"
printf "${LPAD}%b %b %b\n"            "$(one)" "$(six)" "$(three)"
printf "${LPAD}%b %b %b\n"            "$(four)" "$(five)" "$(two)"
printf "${LPAD}%b %b\n"               "$(eight)" "$(eleven)"
printf "${LPAD}%b %b\n"               "$(seven)" "$(twelve)"
printf "${LPAD}%b S E %b\n"           "$(ten)" "$(oclock)"
