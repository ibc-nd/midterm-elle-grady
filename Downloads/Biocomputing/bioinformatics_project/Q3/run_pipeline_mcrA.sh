module load bio
cat ../reference_sequences/mcrAgene_*.fasta >> combined_ref_mcrA.fasta
muscle -align combined_ref_mcrA.fasta -output aligned_mcrA.afa
hmmbuild profile_mcrA.hmm aligned_mcrA.afa
for proteome in ../proteomes/*.fasta; do
	name=$(basename "$proteome")
	hmmsearch --tblout tbl_mcrA.csv \
		profile_mcrA.hmm "$proteome"
	hits=$(grep -v "^#" tbl_mcrA.csv |
		awk '$5<0.001' | wc -l)
	echo "$name,$hits" >> pipeline_results_mcrA.csv
done
