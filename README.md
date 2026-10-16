1. # Connected to CRC and established git repo
a) cat mcrAgene_0*.fasta>combined_reference_sequences.fasta
muscle -align combined_reference_sequences.fasta -output aligned.afa
# aligned.afa was the output. Afa files are input into hmmer for profile building.
b) hmmbuild profile.hmm aligned.afa 
# name of profile = profile.hmm

2 a) hmmsearch --tblout q2a_results.txt profile.hmm proteome_01.fasta
b) # 0 hits. We didn’t filter because we have 0 hits. We had to look up how to see the full E value because we were not getting any hits.  
c) # This was the smallest E value: 0.067. That means nothing we found was significant. Since we didn’t use many reference files (10), maybe there was an issue finding an mcrA reference gene. 
# This is a command that would have worked to filter with grep: “grep -v "^#" results.txt | awk ’$5 < 0.001’ | wc -l”

3) # Created a script in Q3 directory.
# Copied combined_ref_hsp.fasta, combined_ref_mcrA.fasta, and our script into a new directory. 
# We moved files, wrote a draft of the code, tested it for both hsp70 files first, and then edited the code to accept a command (run for either mcrA or hsp70). 

4) a) # Ran the script twice, using 1) hsp70 and 2) mcrA as arguments.
b) # The proteomes were screened for the presence of mcrA genes and hsp70 genes. Both proteome 19 and 23 possessed two mcrA genes. There was a large portion that did not possess any mcrA genes. When screening for the hsp70, there were many matches. Proteomes 18 and 22 both matched 7 different hsp70 genes. On the flip side, proteomes 2,6,17,28,29,33,40, and 46 possess no hsp70 genes. While proteomes 18 and 22 possess high amounts of hsp genes, they do not possess any mcrA genes. For the total investigation into these archaea, a good candidate will possess at least one mcrA gene and more than one copy of hsp70 gene. Proteome 23 has 2 mcrA genes and 2 hsp70 genes. This archaea isolate could be futher tested to determine methanogenesis and pH resistance. 
c) # For the McrA gene, any hits indicate the given proteome is methanogenic, i.e. capable of performing methanogenesis. Every hit of hsp70 (copies of the hsp70 gene present) indicates
futher ability for the proteome to adapt to stress. More copies suggest greater pH resistance. Combining the list of proteomes with positive hit counts for both show which proteomes
are pH-resistant methanogenic Archaea. 
 
5) a) # Pairwise alignment (muscle) compares two individual sequences directly with each other, analyzing the homology to reveal genetic mutations. Aligment is best used for when DNA/RNA 
sequences have high similarity, and the researcher wants to find perfectly matching segments or the position where one/a few neucleotide(s) differ(s). 
# Profile-based searching (hmmer) uses a probability model to quickly compare multiple homologs. This is best used when there are many variations in sequences, and the researcher
wants to investigate the probability of structural similarities across genes. 
b) # An HMM profile is more flexible and will conserve more data than a BLAST query. HMM profiles incorporate evolutionary information into their probability model, allowing 
for variable positions that tolerate differences in the sequence. A BLAST query will exclude all data that does not exactly match the given reference sequence; all positions 
and substitutions are treated as uniform scoring matrices, regardless of their biological properties/functions. Using HMM profiles for multiple sequences will significantly  
reduce the risk of false negatives.  


# see below for git log --oneline

