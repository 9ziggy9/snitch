#!/usr/bin/env bash

usage () { echo "Hello, usage!"; exit 1; }

while getopts ":a:bc:" opt; do
    case "${opt}" in
	a) printf 'Got a: "%s"\n' "$OPTARG" ;;
	b) printf "I takes me no arguments\n" ;;
	c) printf 'Got c: "%s"\n' "$OPTARG" ;;
	:) echo 'missing argument!' >&2
	   exit 1 ;;
	\?) echo 'invalid option!' >&2
	    exit 1
    esac
done
shift $((OPTIND - 1))
printf "%s\n" "$1"

# NOTE: IFS indicates input field seperator, in our case since this is CSV we choose ","
while IFS="," read -r first_name last_name gh
do
    echo "First Name: $first_name"
    echo "Last Name: $last_name"
    echo "GitHub repo: $gh"
    echo "" # new line
done < <(tail -n +2 input.csv)
