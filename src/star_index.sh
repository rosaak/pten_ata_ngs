#!/bin/bash

STAR="/home/padmanr/Softwares/Gits/STAR/bin/Linux_x86_64_static/STAR"
IndexDir="../indexes/star88"
genomefas="../indexes/star88/genome.fa"
genomegtf="../indexes/star88/gencode.v27.annotation.gtf"

mkdir -p $IndexDir;
$STAR --runMode genomeGenerate --runThreadN 30 --genomeDir $IndexDir \
	--genomeFastaFiles $genomefas \
	--sjdbGTFfile $genomegtf \
	--sjdbOverhang 88 

