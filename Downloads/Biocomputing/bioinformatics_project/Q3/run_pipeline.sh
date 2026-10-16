#USage: bash run_pipeline.sh (hsp70gene/mcrAgene), this will create a final file that contains the number of hits to the reference files
set -e
module load bio

#Specify the gene of interest following the script (hsp70gene/mcrAgene)
gene=$1

#This portion creates the hmm profile from the reference fasta files
cat ../ref_sequences/${gene}_*.fasta > combined_ref_${gene}.fasta
muscle -align combined_ref_${gene}.fasta -output aligned_${gene}.afa
hmmbuild profile_${gene}.hmm aligned_${gene}.afa

#The following portion is used to search the unknown proteomes
echo "proteome,hits" > pipeline_results_${gene}.csv
for proteome in ../proteomes/*.fasta; do
	name=$(basename "$proteome")
	hmmsearch --tblout tbl_${gene}.csv \
		profile_${gene}.hmm "$proteome"
	awk '!/^#/ && $5 < 0.001 {n++}
        	END {print n+0}' tbl_${gene}.csv > count_${gene}.txt
	hits=$(cat count_${gene}.txt)
	echo "$name,$hits" >> pipeline_results_${gene}.csv
done
