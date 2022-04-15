#!/usr/bin/env bash

usage () { echo "Hello, usage!"; exit 1; }

while getopts ":a:bc:" opt; do
    case "${opt}" in
	a) printf 'Got a: "%s"\n' "$OPTARG" ;;
	b) printf "I takes me no arguments" ;;
	c) printf 'Got b: "%s"\n' "$OPTARG" ;;
	:) echo 'missing argument!' >&2
	   exit 1 ;;
	\?) echo 'invalid option!' >&2
	    exit 1
    esac
done
