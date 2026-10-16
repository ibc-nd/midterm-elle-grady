muscle -align combined_ref_hsp.fasta -output aligned_hsp.afa |
hmmbuild profile_hsp.hmm aligned_hsp.afa
for proteome in proteomes/*.fasta; do
	name=$(basename "$proteome")
	hmmsearch --tblout pipeline_results_hsp.csv
		profile_hsp.hmm "$proteome"
	hits=$(grep -v "^#" pipeline_results_hsp.csv |
		awk ’$5<0.001’ | wc -l)
	echo "$name,$hits"
done
