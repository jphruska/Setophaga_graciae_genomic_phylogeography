#!/bin/sh
#SBATCH --chdir=./
#SBATCH --job-name=setophaga_rohan_45_individuals
#SBATCH --partition quanah
#SBATCH --nodes=1 --ntasks 8
#SBATCH --time=48:00:00
#SBATCH --mem-per-cpu=8G
#SBATCH --array=1-45

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/jmanthey/anaconda2/envs/rohan/lib/

basename_array=$( head -n${SLURM_ARRAY_TASK_ID} dataset6.keep.txt | tail -n1 )

/lustre/work/jmanthey/rohan/src/rohan --tstv 1.971 --size 50000 --auto chromosomes.txt -t 8 -o ${SGE_TASK_ID} \
/lustre/scratch/johruska/central_america_pine_oak/parulidae_ref/GCA_001746935.2_mywa_2.1_genomic.fna \
/lustre/scratch/johruska/setophaga/01_bam_files/${basename_array}_final.bam
