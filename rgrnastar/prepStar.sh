# automate their generation f
# from existing fasta genomes
INDEXROOT=/data/ucsc
# fix that
for genome in hg19 hg18 mm9 mm10 rn4 rn5
do
  TARGET=${INDEXROOT}/${genome}/rnastar
  mkdir -p $TARGET
  cd $TARGET
  STAR --runMode genomeGenerate --genomeDir $TARGET --genomeFastaFiles ${TARGET}/$genome.fa --runThreadN 4
done

