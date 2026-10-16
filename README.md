#Project Description
The purpose of this project is take reference sequences, combine them, and build a profile. This profile will be run against the proteomes to determine how many sequences match. Matched sequences indicate candidates that possess both desired genes.  
Our pipeline is listed under run_pipeline.sh (all commands are visible there)
We used both muscle and hmmer to align the sequences and create a profile to run agains the unknown proteomes
The results show that there are a few candidates that possess both the mcrA gene and at least one hsp70 gene. The arachaea that these proteomes belong to would better equipped to withstand higher pH and perform methanogenesis.

# see below for git log --oneline
5407fe9 (HEAD -> main, origin/main, origin/HEAD) Grady: Added assignment06 text file
89d4eb0 Grady: Finalizing script for Q3 and updating READme.md
c647434 Elle: removed old README
2551486 Add files via upload
5fdc527 Elle: worked on updating script to generalize
a689023 Grady: Adding Q3 Directory and potential run_pipeline.sh
4aec475 Elle: added reference sequences for mcrA and hsp70
fb120d6 Elle: added q2a results
a986557 Elle: moved profile.hmm to proteomes folder
851030d Grady: Question 1. Practice creating muscle alignment and hmmer profile
2359971 Merge branch 'main' of github.com:ibc-nd/midterm-elle-grady data and gitignore
fb86274 Grady: Adding Gitignore
3c900d9 Created README file
cb1aed1 Added bioinformatics_project data folder -Elle
