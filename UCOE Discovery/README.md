Accompanies Manuscript: A Novel Chromatin-Opening Element for Stable Long-Term Transgene Expression
============
Shireen Rudina & Christina Smolke
Some code written with Thomas Bauer 


Code:
	pre_process_Histone.sh - Removes the header from the 
		histone files
	Histone_Selection_Filtered.sh - Intersects and subtracts 
		regions in the histone file in accordance with the 
		markings found on A2UCOE. Removes regions that 
		fall in the middle of genes.  Removes regions that 
		don't have at least a 50% overlap with a CPG island.
	Unmethylated_CpG.sh - Exclude candidates that have 
		methylated areas (>20% of bisulfite read)
	CTCF_TFBS_analysis_GM12878.sh - Finds the difference 
		between the average H3K27 acetylation and H3K4 
		methlyation signals at CTCF binding site and the 
		entire region of interest. 

Outputs
	Outputs2.0 - contains outputs from 
		Histone_Selection_Filtered.sh
	MethData_Outputs - contains outputs from 
		Unmethylated_CpG.sh
	CTCF_Outputs_GM12878 - contains outputs from
		CTCF_TFBS_analysis_GM12878.sh

The included excel file was used to calculate statistics 
and produce plots after the last output.

data
	Made available upon request or can be found in UCSC
	Genome browser. Data used: BroadHistone modifications 
	from the GM12878 cell line.  Encode bisulfite 
	sequence RBBS data. H3k27ac and H3k4me3 
	ENCODE signal data(big wig format)





	     
	
