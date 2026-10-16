module load bio 
../ref_sequences cat hsp70_*.fasta > combined_ref_hsp.fasta
muscle -align combined_ref_hsp.fasta -output aligned_hsp.afa
hmmbuild profile_hsp.hmm aligned_hsp.afa
for proteome in ../proteomes/*.fasta; do
	name=$(basename "$proteome")
	hmmsearch --tblout tbl_hsp.csv \
		profile_hsp.hmm "$proteome"
	hits=$(grep -v "^#" tbl_hsp.csv |
		awk '$5<0.001' | wc -l)
	echo "$name,$hits" >> pipeline_results_hsp.csv
done
