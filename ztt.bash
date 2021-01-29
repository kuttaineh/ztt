#! /bin/bash
#  Inspired, in part, by Benson Labs Typing Practice
#  Written for Ezekiel Kuttaineh by his dad https://m.me/Rammy

# Data files location:

	dfl="$HOME/ztt"
	one="$dfl/1s.txt"
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
    1) echo; echo -n "One letter word: "

	setrange "$one"
	oneword="`sed "${randline}q;d" $one`"
	utter "$oneword"; echo
	read -r -p "  Type the word: "
	check "$REPLY" "$oneword"
	;; 		# end case 1

    2) echo; echo -n "Two letter word: "

	setrange "$two"
	twoword="`sed "${randline}q;d" $two`"
	utter "$twoword"; echo
	read -r -p "  Type the word: "
	check "$REPLY" "$twoword"
	;;		# end case 2

    3) echo; echo -n "Three letter word: "

	setrange "$thr"
        threword="`sed "${randline}q;d" $thr`"
	utter "$threword"; echo
	read -r -p " Type the word:    "
	check "$REPLY" "$threword"
        ;;              # end case 3

    4) echo; echo -n "Four letter word: "

	setrange "$four"
        fourword="`sed "${randline}q;d" $four`"
        utter "$fourword"; echo
        read -r -p " Type the word:   "
	check "$REPLY" "$fourword"
        ;;              # end case 4

    5) echo; echo -n "Five letter word: "

	setrange "$five"
	fiveword="`sed "${randline}q;d" $five`"
	utter "$fiveword"; echo
	read -r -p " Type the word:   "
	check "$REPLY" "$fiveword"
	;; 		# end case 5

    6) echo; echo -n "Six letter word: "

        setrange "$six"
        sixword="`sed "${randline}q;d" $six`"
        utter "$sixword"; echo
        read -r -p " Type the word:  "
        check "$REPLY" "$sixword"
	;;              # end case 6

    q) say "Goodbye!"; echo "Goodbye!"; break;;
    *) say "$IMPRINT, what?";;
  esac
done

