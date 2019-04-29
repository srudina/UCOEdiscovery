#!/bin/bash

CTCF_data=$HOME/git/UCOEDiscovery/data/TfBS_CTCF.bed

Query_seq=$HOME/git/UCOEDiscovery/Outputs2.0/raw_data_uniq.bed #pre CpG meth analysis

#check that everything that made it through our intersect has a true CTCF binding site

#overlapSelect $CTCF_data $Query_seq stdout | uniq > TrueCTCF_overlap.bed 
#length was 132 while original queries was 151, so true CTCF is a real filter.

#So apply CTCF TfBS filter to the data that made it through methylation analysis
Unmethylated_query=$HOME/git/CS273A_Final/MethData_Outputs/Strict.bed

Unmeth_trueCTCF=$HOME/git/CS273A_Final/MethData_Outputs/Strict_trueCTCF.bed

overlapSelect $CTCF_data $Unmethylated_query stdout | uniq > $Unmeth_trueCTCF
#went from 94 to 88 entries

