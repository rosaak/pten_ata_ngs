#!/bin/bash
STAR="/home/padmanr/Softwares/Gits/STAR/bin/Linux_x86_64_static/STAR"
IndexDir="../indexes/star88"
genomegtf="../indexes/star88/gencode.v27.annotation.gtf"
OutDir="../results/starAlign06"
FastqLoc="../results/trimmed4"

mkdir -p $OutDir;

for R in $FastqLoc/*_fbres_1.fastq ;
	do
	R1=$(echo $R | sed 's/..\/results\/trimmed4\///');
	R2=$(echo $R1 | sed 's/_fbres_1.fastq/_fbres_2.fastq/');
	bn=$(echo $R1 | sed s'/_fbres_1.fastq//');
	#echo $OutDir/Mapped_$bn , $FastqLoc/$R1, $FastqLoc/$R2
	echo $STAR 	--runThreadN 15 --runMode alignReads \
			--quantMode TranscriptomeSAM GeneCounts \
			--outFileNamePrefix $OutDir/Mapped_$bn \
			--outSAMtype BAM SortedByCoordinate Unsorted \
			--outSAMorder Paired \
			--twopassMode Basic \
			--outWigType bedGraph \
			--outWigStrand Stranded \
			--outSAMstrandField intronMotif \
			--outSAMattributes Standard \
			--genomeLoad NoSharedMemory \
			--genomeDir $IndexDir \
			--sjdbGTFfile $genomegtf \
			--readFilesIn $FastqLoc/$R1 $FastqLoc/$R2 ;
done ;

