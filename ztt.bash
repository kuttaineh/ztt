#! /bin/bash
#  Inspired, in part, by Benson Labs Typing Practice
#  Written for Ezekiel Kuttaineh by his dad https://m.me/Rammy

# Data files location:

	dfl="$HOME/ztt"
	oneletterfile="$dfl/1s.txt"
	two="$dfl/2s.txt"
	thr="$dfl/3s.txt"
	four="$dfl/4s.txt"
	five="$dfl/5s.txt"
	six="$dfl/6s.txt"

# Check for say: if not installed, replace calls to say with a bell sound
	if (("`ls /usr/bin/say > /dev/null 2>&1; echo $?`"!="0"))
	then function say { printf "\a"; }; fi

# Functions used:

	function setrange
	{ RANGE="`wc -l "$1" | awk '{print $1}'`"
	  let "randline %= $RANGE"; }

	function utter
	{ say "$1" & printf "$1"; }

	function instructions
	{ text="You will be asked to choose a word size."
	  utter "$text" && sleep 3
	  echo; }

	function check  ## provide feedback to user ##
	{ if [ "$1" == "$2" ]
	  then utter "Very Good!"; echo;
	  else utter "Try again later."; echo; fi; }

	function presentWord  ## presents a random word from a given word file
	{ setrange "$1"
	  word="`sed "${randline}q;d" $1`" # pull a word      
	  utter "$word"; echo
	  read -r -p "    Type the word: "
	  check "$REPLY" "$word"; }

# What prompt to display:

	prompt="How many letters [ 1 2 3 4 5 or 6 ]? "

utter "Zeke's Typing Tutor" && echo && sleep 3
request="Type your name"; say $request &
read -p "$request: "; IMPRINT=$REPLY
say "Welcome $IMPRINT!"
instructions
say "$prompt"

while read -n1 -s -p "$prompt "; do

randline=$RANDOM

  case $REPLY in
    1) echo; echo -n "  One letter word: "; presentWord "$oneletterfile";;
    2) echo; echo -n "  Two letter word: "; presentWord "$two";;
    3) echo; echo -n "Three letter word: "; presentWord "$thr";;
    4) echo; echo -n " Four letter word: "; presentWord "$four";;
    5) echo; echo -n " Five letter word: "; presentWord "$five";;
    6) echo; echo -n "  Six letter word: "; presentWord "$six";;
    q) say "Goodbye!"; echo "Goodbye!"; break;;
    *) say "$IMPRINT, what?";;
  esac
done
