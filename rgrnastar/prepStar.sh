# automate star index generation 
# from existing fasta genomes
# assumes genome dirs have an rnastar directory containing
# the relevant reference genome scaffolds gff3 for
# use in building the splice database into the index
# YOU WILL NEED TO CHANGE THIS !!!
# send code

INDEXROOT=/data/ucsc
REFGFF3="ref_*scaffolds.gff3"

# fix that
for genome in hg19 hg18 mm9 mm10 rn4 rn5
do
  TARGET=${INDEXROOT}/${genome}/rnastar
  mkdir -p $TARGET
  cd $TARGET
  if test -n "$(find . -maxdepth 1 -name '$REFGFF3' -print -quit)"
  then
    STAR --runMode genomeGenerate --genomeDir $TARGET --genomeFastaFiles ${TARGET}/$genome.fa --runThreadN 4  --sjdbOverhang 30 --sjdbGTFfile $REFGFF3 --sjdbGTFtagExonParentTranscript Parent
  else
    STAR --runMode genomeGenerate --genomeDir $TARGET --genomeFastaFiles ${TARGET}/$genome.fa --runThreadN 4  --sjdbOverhang 30
  fi
done

