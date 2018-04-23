
KALLISTO_INDEX="/mnt/lustre/padmanr/projects/LRna/kallistoIndex/hg19_kallisto_index"
GTF="/mnt/lustre/padmanr/projects/LRna/kallistoIndex/gencode.v27lift37.annotation.gtf"
BASE_DIR="/home/padmanr/isilon/NGS_Working/Ata_Abbas/PTEN_RNASeq"
BASE_IN=$BASE_DIR"/results/trimmed3"
BASE_OUT=$BASE_DIR"/results/kallisto_run02"
KALLISTO="/home/padmanr/isilon/ngs_PreMar2018/niazif-share/Roshan/opt/rnaseq/tools/kallisto_linux-v0.44.0/kallisto"

cat $BASE_DIR/results/sample_ids | sed s'/_R1_001.fastq.gz//' | xargs -I {} echo \
    "$KALLISTO quant --index=$KALLISTO_INDEX \
    --output-dir=$BASE_OUT/{} --threads=10 --bootstrap-samples=30 \
    $BASE_IN/{}_fbres_1.fastq.gz  $BASE_IN/{}_fbres_2.fastq.gz"

