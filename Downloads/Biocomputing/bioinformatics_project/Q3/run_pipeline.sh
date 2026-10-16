#USage: bash run_pipeline.sh (hsp70gene/mcrAgene), this will create a final file that contains the number of hits to the reference files
set -e
module load bio

#Assign the gene names (hsp70gene/mcrAgene)
set -- hsp70gene mcrAgene

gene1=$1
gene2=$2

#This portion creates the hmm profile from the reference fasta files
for gene in "$gene1" "$gene2"; do
	cat ../ref_sequences/${gene}_*.fasta > combined_ref_${gene}.fasta
	muscle -align combined_ref_${gene}.fasta -output aligned_${gene}.afa
	hmmbuild profile_${gene}.hmm aligned_${gene}.afa
done

#The following portion is used to search the unknown proteomes
echo "proteome,mcrA_hits,hsp70_hits" > pipeline_results.csv
for proteome in ../proteomes/*.fasta; do
	name=$(basename "$proteome")
#Reset counts for each proteome
	mcrA_hits=0
	hsp70_hits=0

	for gene in "$gene1" "$gene2"; do
		hmmsearch --tblout "tbl_${gene}.csv" \
			"profile_${gene}.hmm" "$proteome"
		count=$(awk '!/^#/ && $5 < 0.001 {n++} END {print n+0}' "tbl_${gene}.csv")
		echo "$name: $gene has $count hits"
	if [[ "$gene" == "mcrAgene" ]]; then
		mcrA_hits=$count
	else
		hsp70_hits=$count
	fi
	done
#This is the filter to only include results that have at least one copy of each gene
if ((mcrA_hits > 0 && hsp70_hits > 0 )); then
	echo "$name, $mcrA_hits, $hsp70_hits" >> pipeline_results.csv
fi
done
