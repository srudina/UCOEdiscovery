#!/bin/sh

for file in "$@"
do
	cat $file | awk '{print $2 "\t" $3 "\t" $4}' | tail -n +2 > $file.bed
done