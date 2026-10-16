module load bio
cat ../ref_sequences/$1gene_*.fasta >> combined_ref_$1.fasta
muscle -align combined_ref_$1.fasta -output aligned_$1.afa
hmmbuild profile_$1.hmm aligned_$1.afa
for proteome in ../proteomes/*.fasta; do
	name=$(basename "$proteome")
	hmmsearch --tblout tbl_$1.csv \
		profile_$1.hmm "$proteome"
	hits=$(grep -v "^#" tbl_$1.csv |
		awk '$5<0.001' | wc -l)
	echo "$name,$hits" >> pipeline_results_$1.csv
done
