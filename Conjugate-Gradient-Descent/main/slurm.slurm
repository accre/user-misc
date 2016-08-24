#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=1G
#SBATCH --time=10:00:00
#SBATCH --output=test.txt
#SBATCH --mail-user=whoever@email.com
#SBATCH --mail-type=ALL

./energy
