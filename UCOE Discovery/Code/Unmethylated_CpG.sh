#!/bin/bash

queryseq=$HOME/git/UCOEdiscovery/Outputs2.0/raw_data_uniq.bed

#methyl_data=$HOME/git/UCOEdiscovery/data/GM12878_MethylRRBSRep1_percentlessthan20.bed

#methyl_data=$HOME/git/UCOEdiscovery/data/GM12878_MethylRRBSRep1_percentgreater20.bed

methyl_data=$HOME/git/UCOEdiscovery/data/GM12878_MethylRRBSRep1_percentgreater10.bed

methyl_folder=$HOME/git/UCOEdiscovery/MethData_Outputs

output=$methyl_folder/ExcludeGreaterThan10
#rm -rf $output
#mkdir $output

#overlapSelect -nonOverlapping $methyl_data $queryseq $output/unmethylated_out_overlap.bed

new_bedtools_dir=/usr/local/Cellar/bedtools/2.21.0/bin

#$new_bedtools_dir/bedtools intersect -wa -a $queryseq -b $methyl_data | uniq > $output/unmethylated_out_bedtools.bed

#Excludegreaterthan10 is too harsh (removes A2UCOE)
#Excludegreaterthan20 only gets rid of 3 entries (148)
#Only include if there's a read <20 (98)

#Only items that meet both of last two

#overlapSelect $methyl_folder/MustHaveLessThan20/unmethylated_out_overlap.bed $methyl_folder/NothingGreaterThan20/unmethylated_out_overlap.bed $methyl_folder/Strict.bed

#added length and sorted by length in terminal
