#log into Teddy Server
#ssh user@165.112.66.11
# $1 is the folder name from NextSeq run such as 200311_NB552222_0005_AHVT77AFXY
# rsync

mkdir -p /Disk12tb_2/NextSeq/$1
rsync -aP guanb@biowulf2.nih.gov:/data/OGL/NextSeq/$1/fastq /Disk12tb_2/NextSeq/$1