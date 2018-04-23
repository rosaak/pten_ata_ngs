HISAT2="/cm/shared/apps/hisat2/2.1.0/hisat2"
#HISAT2_INDEX="/home/padmanr/lustre/projects/LRna/HISAT2Index/hg19/genome"
HISAT2_INDEX="/mnt/isilon/data/w_gmi/engclab/NGS_Working/Ata_Abbas/PTEN_RNASeq/indexes/HISAT2Index/hg19/genome"
BASE_DIR="/mnt/isilon/data/w_gmi/engclab/NGS_Working/Ata_Abbas/PTEN_RNASeq"
BASE_IN=$BASE_DIR"/results/trimmed4"
BASE_OUT=$BASE_DIR"/results/hs2_01"

mkdir -p $BASE_OUT

cat bn | sed s'/_1.fastq//' | xargs -I {} echo "$HISAT2 -p 15 --dta -q -x $HISAT2_INDEX -1 $BASE_IN/{}_1.fastq -2 $BASE_IN/{}_2.fastq -S $BASE_OUT/{}.sam &>$BASE_OUT/{}_hisat2.log"

