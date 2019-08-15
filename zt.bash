#! /bin/bash
#  Inspired, in part, by Benson Labs Typing Practice
#  Written for Ezekiel Kuttaineh by his dad https://m.me/Rammy

# Data files location:

	dfl="$HOME/Documents/code/typer/Zeke"
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

	function comm  ## comm is short for communicate ##
	{ say "$1" & printf "$1"; }

	function instructions
	{ text="You will be asked to choose a word size."
	  comm "$text" && sleep 3
	  echo; }

	function check  ## provide feedback to user ##
	{ if [ "$1" == "$2" ]
	  then comm "Very Good!"; echo;
	  else comm "Try again later."; echo; fi; }

# What prompt to display:

	prompt="Now how many letters [ 4 5 or 6 ]? "

comm "Zeke's Typing Tutor" && echo && sleep 3
request="Type your name"; say $request &
read -p "$request: "; IMPRINT=$REPLY
say "Welcome $IMPRINT!"
instructions
say "$prompt"

while read -n1 -s -p "$prompt "; do

randline=$RANDOM

  case $REPLY in
    3) echo; echo -n "Three letter word: "

	setrange "$thr"
        threword="`sed "${randline}q;d" $thr`"
	comm "$threword"; echo
	read -r -p " Type the word:    "
	check "$REPLY" "$threword"
        ;;              # end case 3

    4) echo; echo -n "Four letter word: "

	setrange "$four"
        fourword="`sed "${randline}q;d" $four`"
        comm "$fourword"; echo
        read -r -p " Type the word:   "
	check "$REPLY" "$fourword"
        ;;              # end case 4

    5) echo; echo -n "Five letter word: "

	setrange "$five"
	fiveword="`sed "${randline}q;d" $five`"
	comm "$fiveword"; echo
	read -r -p " Type the word:   "
	check "$REPLY" "$fiveword"
	;; 		# end case 5

    6) echo; echo -n "Six letter word: "

        setrange "$six"
        sixword="`sed "${randline}q;d" $six`"
        comm "$sixword"; echo
        read -r -p " Type the word:  "
        check "$REPLY" "$sixword"
	;;              # end case 6

    q) say "Goodbye!"; echo "Goodbye!"; break;;
    *) say "$IMPRINT, what?";;
  esac
done

