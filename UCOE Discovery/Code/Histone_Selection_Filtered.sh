#!/bin/sh

#check parameters
if [ $# -eq 0 ]; then 
	echo "Error: no arguments"
	echo "usage: quick_analysis/*.bed"
	echo "assumes you are calculating stats on all bed files in specified in args"

	exit 1
fi

i=1

echo $1
cat $1 > temp2.bed
for file in "$@"
do
	cat $file | sort -k1,1 -k2,2n > cur_histone
	bedtools merge -i cur_histone > cur_histone_merged

	mv temp2.bed temp.bed 

	if [[ $i -ne 5 && $i -ne 12 ]]; then
		#if [ $i -ne 12 ]; then
		echo $i
		echo $file 
		bedtools intersect -a cur_histone_merged -b temp.bed > temp2.bed
		#fi
		
	else 
		echo "$i subtract"
		echo $file
		bedtools subtract -a temp.bed -b cur_histone_merged > temp2.bed
	fi
	wc -l temp2.bed
	i=$((i+1))
done

#bedtools subtract -a temp2.bed -b ../data/knownGene_track.bed > temp.bed

echo "regions after histones"
wc -l temp2.bed

bedtools subtract -a temp2.bed -b ../data/knownGene_track.bed | bedtools intersect -a temp2.bed -b stdin -wa > temp.bed 

echo "regions after genes"
wc -l temp.bed

bedtools intersect -a temp.bed -b ../data/CpG.bed -wa -f 0.5 | sort -u > raw_data.bed

echo "regions after 50% cpg island overlap"
wc -l raw_data.bed

cat raw_data.bed | awk '{print $0 "\t" $3-$2}' | sort -k4gr | uniq > raw_data_with_lengths.bed 

cat raw_data_with_lengths.bed | awk '{if( $4 > 2000) print $0}' > raw_data_with_lengths_over_2000.bed

mv raw_data.bed ../Outputs2.0/
mv raw_data_with_lengths.bed ../Outputs2.0/
mv raw_data_with_lengths_over_2000.bed ../Outputs2.0/

#clean up 
rm cur_histone_merged
rm cur_histone
rm temp.bed
#rm temp2.bed

#Useful commands
#grep "chr7\t" raw_data_with_lengths.bed | sort -k1,1 -k2,2g

