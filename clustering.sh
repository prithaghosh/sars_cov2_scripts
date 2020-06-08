#  clustering.sh
#  Copyright 2020 Nithin C
# Laboratory of Bioinformatics and Protein Engineering
# International Institute of Molecuar and Cell Biology in Warsaw
# ul. Ks. Trojdena 4, 02-109 ​Warsaw, Poland
# 
# Head of the Laboratory
# Prof. Janusz M. Bujnicki, PhD, DSc, Professor of Biological Sciences
# Email: iamb@genesilico.pl 
#  
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#  
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#  
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.
#  
#  

cd SARSCoV2-RNA-00001-00149
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-00001-00149_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-00001-00149_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-00001-00149_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-00001-00149_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ../..
cd SARSCoV2-RNA-00150-00394
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-00150-00394_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-00150-00394_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-00150-00394_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-00150-00394_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ..
mkdir pocket_2
mv *_pocket_2.pdb pocket_2
cd pocket_2
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_2.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-00150-00394_ALL_LowE_1000_pocket_2.trafl
clustering SARSCoV2-RNA-00150-00394_ALL_LowE_1000_pocket_2.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-00150-00394_ALL_LowE_1000-000001_AA_pocket_2.pdb SARSCoV2-RNA-00150-00394_ALL_LowE_1000_pocket_2_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_2_clusters
cp *_AA.pdb ../pocket_2_clusters/

cd ../..
cd SARSCoV2-RNA-00407-00478
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-00407-00478_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-00407-00478_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-00407-00478_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-00407-00478_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ../..
cd SARSCoV2-RNA-00564-01026
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-00564-01026_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-00564-01026_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-00564-01026_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-00564-01026_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/
cd ..
mkdir pocket_2
mv *_pocket_2.pdb pocket_2
cd pocket_2
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_2.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-00564-01026_ALL_LowE_1000_pocket_2.trafl
clustering SARSCoV2-RNA-00564-01026_ALL_LowE_1000_pocket_2.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-00564-01026_ALL_LowE_1000-000001_AA_pocket_2.pdb SARSCoV2-RNA-00564-01026_ALL_LowE_1000_pocket_2_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_2_clusters
cp *_AA.pdb ../pocket_2_clusters/

cd ../..
cd SARSCoV2-RNA-01106-01282
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-01106-01282_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-01106-01282_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-01106-01282_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-01106-01282_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ..
mkdir pocket_2
mv *_pocket_2.pdb pocket_2
cd pocket_2
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_2.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-01106-01282_ALL_LowE_1000_pocket_2.trafl
clustering SARSCoV2-RNA-01106-01282_ALL_LowE_1000_pocket_2.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-01106-01282_ALL_LowE_1000-000001_AA_pocket_2.pdb SARSCoV2-RNA-01106-01282_ALL_LowE_1000_pocket_2_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_2_clusters
cp *_AA.pdb ../pocket_2_clusters/

cd SARSCoV2-RNA-01683-01895
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-01683-01895_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-01683-01895_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-01683-01895_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-01683-01895_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ..
mkdir pocket_2
mv *_pocket_2.pdb pocket_2
cd pocket_2
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_2.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-01683-01895_ALL_LowE_1000_pocket_2.trafl
clustering SARSCoV2-RNA-01683-01895_ALL_LowE_1000_pocket_2.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-01683-01895_ALL_LowE_1000-000001_AA_pocket_2.pdb SARSCoV2-RNA-01683-01895_ALL_LowE_1000_pocket_2_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_2_clusters
cp *_AA.pdb ../pocket_2_clusters/

cd ../..
cd SARSCoV2-RNA-02281-02380
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-02281-02380_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-02281-02380_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-02281-02380_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-02281-02380_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ../..
cd SARSCoV2-RNA-02459-02639
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-02459-02639_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-02459-02639_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-02459-02639_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-02459-02639_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ../..
cd SARSCoV2-RNA-03139-03640
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-03139-03640_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-03139-03640_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-03139-03640_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-03139-03640_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ..
mkdir pocket_2
mv *_pocket_2.pdb pocket_2
cd pocket_2
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_2.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-03139-03640_ALL_LowE_1000_pocket_2.trafl
clustering SARSCoV2-RNA-03139-03640_ALL_LowE_1000_pocket_2.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-03139-03640_ALL_LowE_1000-000001_AA_pocket_2.pdb SARSCoV2-RNA-03139-03640_ALL_LowE_1000_pocket_2_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_2_clusters
cp *_AA.pdb ../pocket_2_clusters/

cd ../..
cd SARSCoV2-RNA-04160-04264
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-04160-04264_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-04160-04264_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-04160-04264_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-04160-04264_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ../..
cd SARSCoV2-RNA-04938-05156
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-04938-05156_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-04938-05156_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-04938-05156_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-04938-05156_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ../..
cd SARSCoV2-RNA-05240-05569
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-05240-05569_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-05240-05569_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-05240-05569_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-05240-05569_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ..
mkdir pocket_2
mv *_pocket_2.pdb pocket_2
cd pocket_2
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_2.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-05240-05569_ALL_LowE_1000_pocket_2.trafl
clustering SARSCoV2-RNA-05240-05569_ALL_LowE_1000_pocket_2.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-05240-05569_ALL_LowE_1000-000001_AA_pocket_2.pdb SARSCoV2-RNA-05240-05569_ALL_LowE_1000_pocket_2_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_2_clusters
cp *_AA.pdb ../pocket_2_clusters/
##############################################################
cd ../..
cd SARSCoV2-RNA-06115-06311
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-06115-06311_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-06115-06311_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-06115-06311_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-06115-06311_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ../..
cd SARSCoV2-RNA-06641-06696
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-06641-06696_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-06641-06696_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-06641-06696_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-06641-06696_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ../..
cd SARSCoV2-RNA-06974-07167
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-06974-07167_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-06974-07167_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-06974-07167_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-06974-07167_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ..
mkdir pocket_2
mv *_pocket_2.pdb pocket_2
cd pocket_2
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_2.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-06974-07167_ALL_LowE_1000_pocket_2.trafl
clustering SARSCoV2-RNA-06974-07167_ALL_LowE_1000_pocket_2.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-06974-07167_ALL_LowE_1000-000001_AA_pocket_2.pdb SARSCoV2-RNA-06974-07167_ALL_LowE_1000_pocket_2_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_2_clusters
cp *_AA.pdb ../pocket_2_clusters/

cd ../..
cd SARSCoV2-RNA-07808-08229
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-07808-08229_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-07808-08229_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-07808-08229_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-07808-08229_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ..
mkdir pocket_2
mv *_pocket_2.pdb pocket_2
cd pocket_2
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_2.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-07808-08229_ALL_LowE_1000_pocket_2.trafl
clustering SARSCoV2-RNA-07808-08229_ALL_LowE_1000_pocket_2.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-07808-08229_ALL_LowE_1000-000001_AA_pocket_2.pdb SARSCoV2-RNA-07808-08229_ALL_LowE_1000_pocket_2_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_2_clusters
cp *_AA.pdb ../pocket_2_clusters/

cd ../..
cd SARSCoV2-RNA-09035-09577
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-09035-09577_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-09035-09577_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-09035-09577_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-09035-09577_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ..
mkdir pocket_2
mv *_pocket_2.pdb pocket_2
cd pocket_2
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_2.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-09035-09577_ALL_LowE_1000_pocket_2.trafl
clustering SARSCoV2-RNA-09035-09577_ALL_LowE_1000_pocket_2.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-09035-09577_ALL_LowE_1000-000001_AA_pocket_2.pdb SARSCoV2-RNA-09035-09577_ALL_LowE_1000_pocket_2_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_2_clusters
cp *_AA.pdb ../pocket_2_clusters/

cd ../..
cd SARSCoV2-RNA-10165-10300
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-10165-10300_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-10165-10300_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-10165-10300_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-10165-10300_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ../..
cd SARSCoV2-RNA-12871-13016
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-12871-13016_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-12871-13016_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-12871-13016_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-12871-13016_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ../..
cd SARSCoV2-RNA-13367-13546
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-13367-13546_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-13367-13546_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-13367-13546_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-13367-13546_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ../..
cd SARSCoV2-RNA-13635-13796
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-13635-13796_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-13635-13796_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-13635-13796_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-13635-13796_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ../..
cd SARSCoV2-RNA-13857-14338
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-13857-14338_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-13857-14338_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-13857-14338_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-13857-14338_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ..
mkdir pocket_2
mv *_pocket_2.pdb pocket_2
cd pocket_2
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_2.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-13857-14338_ALL_LowE_1000_pocket_2.trafl
clustering SARSCoV2-RNA-13857-14338_ALL_LowE_1000_pocket_2.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-13857-14338_ALL_LowE_1000-000001_AA_pocket_2.pdb SARSCoV2-RNA-13857-14338_ALL_LowE_1000_pocket_2_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_2_clusters
cp *_AA.pdb ../pocket_2_clusters/

cd ..
mkdir pocket_3
mv *_pocket_3.pdb pocket_3
cd pocket_3
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_3.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-13857-14338_ALL_LowE_1000_pocket_3.trafl
clustering SARSCoV2-RNA-13857-14338_ALL_LowE_1000_pocket_3.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-13857-14338_ALL_LowE_1000-000001_AA_pocket_3.pdb SARSCoV2-RNA-13857-14338_ALL_LowE_1000_pocket_3_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_3_clusters
cp *_AA.pdb ../pocket_3_clusters/

cd ../..
cd SARSCoV2-RNA-14973-15136
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-14973-15136_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-14973-15136_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-14973-15136_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-14973-15136_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ..
mkdir pocket_2
mv *_pocket_2.pdb pocket_2
cd pocket_2
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_2.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-14973-15136_ALL_LowE_1000_pocket_2.trafl
clustering SARSCoV2-RNA-14973-15136_ALL_LowE_1000_pocket_2.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-14973-15136_ALL_LowE_1000-000001_AA_pocket_2.pdb SARSCoV2-RNA-14973-15136_ALL_LowE_1000_pocket_2_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_2_clusters
cp *_AA.pdb ../pocket_2_clusters/

cd ..
mkdir pocket_3
mv *_pocket_3.pdb pocket_3
cd pocket_3
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_3.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-14973-15136_ALL_LowE_1000_pocket_3.trafl
clustering SARSCoV2-RNA-14973-15136_ALL_LowE_1000_pocket_3.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-14973-15136_ALL_LowE_1000-000001_AA_pocket_3.pdb SARSCoV2-RNA-14973-15136_ALL_LowE_1000_pocket_3_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_3_clusters
cp *_AA.pdb ../pocket_3_clusters/

######################################################################################################
cd ../..
cd SARSCoV2-RNA-15482-15608
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-15482-15608_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-15482-15608_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-15482-15608_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-15482-15608_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ../..
cd SARSCoV2-RNA-16096-16265
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-16096-16265_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-16096-16265_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-16096-16265_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-16096-16265_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ..
mkdir pocket_2
mv *_pocket_2.pdb pocket_2
cd pocket_2
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_2.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-16096-16265_ALL_LowE_1000_pocket_2.trafl
clustering SARSCoV2-RNA-16096-16265_ALL_LowE_1000_pocket_2.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-16096-16265_ALL_LowE_1000-000001_AA_pocket_2.pdb SARSCoV2-RNA-16096-16265_ALL_LowE_1000_pocket_2_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_2_clusters
cp *_AA.pdb ../pocket_2_clusters/

cd ../..
cd SARSCoV2-RNA-16441-16605
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-16441-16605_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-16441-16605_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-16441-16605_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-16441-16605_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ../..
cd SARSCoV2-RNA-17021-17368
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-17021-17368_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-17021-17368_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-17021-17368_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-17021-17368_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ../..
cd SARSCoV2-RNA-17452-17650
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-17452-17650_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-17452-17650_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-17452-17650_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-17452-17650_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ../..
cd SARSCoV2-RNA-17955-18476
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-17955-18476_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-17955-18476_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-17955-18476_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-17955-18476_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ..
mkdir pocket_2
mv *_pocket_2.pdb pocket_2
cd pocket_2
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_2.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-17955-18476_ALL_LowE_1000_pocket_2.trafl
clustering SARSCoV2-RNA-17955-18476_ALL_LowE_1000_pocket_2.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-17955-18476_ALL_LowE_1000-000001_AA_pocket_2.pdb SARSCoV2-RNA-17955-18476_ALL_LowE_1000_pocket_2_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_2_clusters
cp *_AA.pdb ../pocket_2_clusters/

cd ..
mkdir pocket_3
mv *_pocket_3.pdb pocket_3
cd pocket_3
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_3.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-17955-18476_ALL_LowE_1000_pocket_3.trafl
clustering SARSCoV2-RNA-17955-18476_ALL_LowE_1000_pocket_3.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-17955-18476_ALL_LowE_1000-000001_AA_pocket_3.pdb SARSCoV2-RNA-17955-18476_ALL_LowE_1000_pocket_3_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_3_clusters
cp *_AA.pdb ../pocket_3_clusters/

cd ..
mkdir pocket_4
mv *_pocket_4.pdb pocket_4
cd pocket_4
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_4.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-17955-18476_ALL_LowE_1000_pocket_4.trafl
clustering SARSCoV2-RNA-17955-18476_ALL_LowE_1000_pocket_4.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-17955-18476_ALL_LowE_1000-000001_AA_pocket_4.pdb SARSCoV2-RNA-17955-18476_ALL_LowE_1000_pocket_4_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_4_clusters
cp *_AA.pdb ../pocket_4_clusters/

###################################################################################################################

cd ../..
cd SARSCoV2-RNA-18715-18917
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-18715-18917_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-18715-18917_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-18715-18917_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-18715-18917_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ..
mkdir pocket_2
mv *_pocket_2.pdb pocket_2
cd pocket_2
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_2.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-18715-18917_ALL_LowE_1000_pocket_2.trafl
clustering SARSCoV2-RNA-18715-18917_ALL_LowE_1000_pocket_2.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-18715-18917_ALL_LowE_1000-000001_AA_pocket_2.pdb SARSCoV2-RNA-18715-18917_ALL_LowE_1000_pocket_2_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_2_clusters
cp *_AA.pdb ../pocket_2_clusters/

cd ..
mkdir pocket_3
mv *_pocket_3.pdb pocket_3
cd pocket_3
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_3.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-18715-18917_ALL_LowE_1000_pocket_3.trafl
clustering SARSCoV2-RNA-18715-18917_ALL_LowE_1000_pocket_3.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-18715-18917_ALL_LowE_1000-000001_AA_pocket_3.pdb SARSCoV2-RNA-18715-18917_ALL_LowE_1000_pocket_3_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_3_clusters
cp *_AA.pdb ../pocket_3_clusters/

cd ../..
cd SARSCoV2-RNA-20241-20411
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-20241-20411_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-20241-20411_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-20241-20411_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-20241-20411_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ../..
cd SARSCoV2-RNA-20241-20411
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-20241-20411_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-20241-20411_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-20241-20411_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-20241-20411_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ..
mkdir pocket_2
mv *_pocket_2.pdb pocket_2
cd pocket_2
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_2.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-20241-20411_ALL_LowE_1000_pocket_2.trafl
clustering SARSCoV2-RNA-20241-20411_ALL_LowE_1000_pocket_2.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-20241-20411_ALL_LowE_1000-000001_AA_pocket_2.pdb SARSCoV2-RNA-20241-20411_ALL_LowE_1000_pocket_2_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_2_clusters
cp *_AA.pdb ../pocket_2_clusters/

cd ../..
cd SARSCoV2-RNA-20976-21124
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-20976-21124_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-20976-21124_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-20976-21124_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-20976-21124_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ../..
cd SARSCoV2-RNA-22095-22223
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-22095-22223_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-22095-22223_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-22095-22223_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-22095-22223_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ..
mkdir pocket_2
mv *_pocket_2.pdb pocket_2
cd pocket_2
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_2.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-22095-22223_ALL_LowE_1000_pocket_2.trafl
clustering SARSCoV2-RNA-22095-22223_ALL_LowE_1000_pocket_2.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-22095-22223_ALL_LowE_1000-000001_AA_pocket_2.pdb SARSCoV2-RNA-22095-22223_ALL_LowE_1000_pocket_2_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_2_clusters
cp *_AA.pdb ../pocket_2_clusters/

cd ../..
cd SARSCoV2-RNA-22615-22678
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-22615-22678_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-22615-22678_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-22615-22678_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-22615-22678_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

###########################################################################################################
cd ../..
cd SARSCoV2-RNA-22780-22913
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-22780-22913_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-22780-22913_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-22780-22913_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-22780-22913_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ../..
cd SARSCoV2-RNA-23236-23521
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-23236-23521_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-23236-23521_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-23236-23521_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-23236-23521_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ..
mkdir pocket_2
mv *_pocket_2.pdb pocket_2
cd pocket_2
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_2.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-23236-23521_ALL_LowE_1000_pocket_2.trafl
clustering SARSCoV2-RNA-23236-23521_ALL_LowE_1000_pocket_2.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-23236-23521_ALL_LowE_1000-000001_AA_pocket_2.pdb SARSCoV2-RNA-23236-23521_ALL_LowE_1000_pocket_2_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_2_clusters
cp *_AA.pdb ../pocket_2_clusters/

cd ..
mkdir pocket_3
mv *_pocket_3.pdb pocket_3
cd pocket_3
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_3.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-23236-23521_ALL_LowE_1000_pocket_3.trafl
clustering SARSCoV2-RNA-23236-23521_ALL_LowE_1000_pocket_3.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-23236-23521_ALL_LowE_1000-000001_AA_pocket_3.pdb SARSCoV2-RNA-23236-23521_ALL_LowE_1000_pocket_3_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_3_clusters
cp *_AA.pdb ../pocket_3_clusters/

cd ../..
cd SARSCoV2-RNA-23908-24118
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-23908-24118_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-23908-24118_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-23908-24118_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-23908-24118_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ..
mkdir pocket_2
mv *_pocket_2.pdb pocket_2
cd pocket_2
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_2.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-23908-24118_ALL_LowE_1000_pocket_2.trafl
clustering SARSCoV2-RNA-23908-24118_ALL_LowE_1000_pocket_2.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-23908-24118_ALL_LowE_1000-000001_AA_pocket_2.pdb SARSCoV2-RNA-23908-24118_ALL_LowE_1000_pocket_2_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_2_clusters
cp *_AA.pdb ../pocket_2_clusters/

cd ../..
cd SARSCoV2-RNA-25196-25578
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-25196-25578_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-25196-25578_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-25196-25578_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-25196-25578_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ..
mkdir pocket_2
mv *_pocket_2.pdb pocket_2
cd pocket_2
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_2.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-25196-25578_ALL_LowE_1000_pocket_2.trafl
clustering SARSCoV2-RNA-25196-25578_ALL_LowE_1000_pocket_2.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-25196-25578_ALL_LowE_1000-000001_AA_pocket_2.pdb SARSCoV2-RNA-25196-25578_ALL_LowE_1000_pocket_2_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_2_clusters
cp *_AA.pdb ../pocket_2_clusters/

cd ..
mkdir pocket_3
mv *_pocket_3.pdb pocket_3
cd pocket_3
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_3.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-25196-25578_ALL_LowE_1000_pocket_3.trafl
clustering SARSCoV2-RNA-25196-25578_ALL_LowE_1000_pocket_3.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-25196-25578_ALL_LowE_1000-000001_AA_pocket_3.pdb SARSCoV2-RNA-25196-25578_ALL_LowE_1000_pocket_3_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_3_clusters
cp *_AA.pdb ../pocket_3_clusters/

cd ../..
cd SARSCoV2-RNA-25834-26427
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-25834-26427_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-25834-26427_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-25834-26427_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-25834-26427_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ..
mkdir pocket_2
mv *_pocket_2.pdb pocket_2
cd pocket_2
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_2.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-25834-26427_ALL_LowE_1000_pocket_2.trafl
clustering SARSCoV2-RNA-25834-26427_ALL_LowE_1000_pocket_2.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-25834-26427_ALL_LowE_1000-000001_AA_pocket_2.pdb SARSCoV2-RNA-25834-26427_ALL_LowE_1000_pocket_2_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_2_clusters
cp *_AA.pdb ../pocket_2_clusters/

###################################################################################################
cd ../..
cd SARSCoV2-RNA-27253-27358
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-27253-27358_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-27253-27358_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-27253-27358_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-27253-27358_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ../..
cd SARSCoV2-RNA-27534-27668
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-27534-27668_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-27534-27668_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-27534-27668_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-27534-27668_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ../..
cd SARSCoV2-RNA-27816-27874
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-27816-27874_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-27816-27874_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-27816-27874_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-27816-27874_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ../..
cd SARSCoV2-RNA-27929-28118
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-27929-28118_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-27929-28118_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-27929-28118_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-27929-28118_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ..
mkdir pocket_2
mv *_pocket_2.pdb pocket_2
cd pocket_2
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_2.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-27929-28118_ALL_LowE_1000_pocket_2.trafl
clustering SARSCoV2-RNA-27929-28118_ALL_LowE_1000_pocket_2.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-27929-28118_ALL_LowE_1000-000001_AA_pocket_2.pdb SARSCoV2-RNA-27929-28118_ALL_LowE_1000_pocket_2_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_2_clusters
cp *_AA.pdb ../pocket_2_clusters/


#################################################################################################
cd ../..
cd SARSCoV2-RNA-28357-28956
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-28357-28956_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-28357-28956_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-28357-28956_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-28357-28956_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ..
mkdir pocket_2
mv *_pocket_2.pdb pocket_2
cd pocket_2
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_2.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-28357-28956_ALL_LowE_1000_pocket_2.trafl
clustering SARSCoV2-RNA-28357-28956_ALL_LowE_1000_pocket_2.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-28357-28956_ALL_LowE_1000-000001_AA_pocket_2.pdb SARSCoV2-RNA-28357-28956_ALL_LowE_1000_pocket_2_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_2_clusters
cp *_AA.pdb ../pocket_2_clusters/

cd ..
mkdir pocket_3
mv *_pocket_3.pdb pocket_3
cd pocket_3
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_3.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-28357-28956_ALL_LowE_1000_pocket_3.trafl
clustering SARSCoV2-RNA-28357-28956_ALL_LowE_1000_pocket_3.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-28357-28956_ALL_LowE_1000-000001_AA_pocket_3.pdb SARSCoV2-RNA-28357-28956_ALL_LowE_1000_pocket_3_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_3_clusters
cp *_AA.pdb ../pocket_3_clusters/

cd ../..
cd SARSCoV2-RNA-29396-29547
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-29396-29547_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-29396-29547_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-29396-29547_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-29396-29547_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ../..
cd SARSCoV2-RNA-29548-29870
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-29548-29870_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-29548-29870_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-29548-29870_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-29548-29870_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ..
mkdir pocket_2
mv *_pocket_2.pdb pocket_2
cd pocket_2
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_2.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-29548-29870_ALL_LowE_1000_pocket_2.trafl
clustering SARSCoV2-RNA-29548-29870_ALL_LowE_1000_pocket_2.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-29548-29870_ALL_LowE_1000-000001_AA_pocket_2.pdb SARSCoV2-RNA-29548-29870_ALL_LowE_1000_pocket_2_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_2_clusters
cp *_AA.pdb ../pocket_2_clusters/

cd ..
mkdir pocket_3
mv *_pocket_3.pdb pocket_3
cd pocket_3
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_3.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-29548-29870_ALL_LowE_1000_pocket_3.trafl
clustering SARSCoV2-RNA-29548-29870_ALL_LowE_1000_pocket_3.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-29548-29870_ALL_LowE_1000-000001_AA_pocket_3.pdb SARSCoV2-RNA-29548-29870_ALL_LowE_1000_pocket_3_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_3_clusters
cp *_AA.pdb ../pocket_3_clusters/

###########################################


cd ../..
cd SARSCoV2-RNA-02281-02380
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-02281-02380_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-02281-02380_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-02281-02380_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-02281-02380_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ../..
cd SARSCoV2-RNA-20731-20946
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-20731-20946_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-20731-20946_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-20731-20946_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-20731-20946_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ..
mkdir pocket_2
mv *_pocket_2.pdb pocket_2
cd pocket_2
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_2.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-20731-20946_ALL_LowE_1000_pocket_2.trafl
clustering SARSCoV2-RNA-20731-20946_ALL_LowE_1000_pocket_2.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-20731-20946_ALL_LowE_1000-000001_AA_pocket_2.pdb SARSCoV2-RNA-20731-20946_ALL_LowE_1000_pocket_2_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_2_clusters
cp *_AA.pdb ../pocket_2_clusters/
#######################################################
cd ../..
cd SARSCoV2-RNA-01683-01895
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-01683-01895_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-01683-01895_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-01683-01895_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-01683-01895_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ..
mkdir pocket_2
mv *_pocket_2.pdb pocket_2
cd pocket_2
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_2.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-01683-01895_ALL_LowE_1000_pocket_2.trafl
clustering SARSCoV2-RNA-01683-01895_ALL_LowE_1000_pocket_2.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-01683-01895_ALL_LowE_1000-000001_AA_pocket_2.pdb SARSCoV2-RNA-01683-01895_ALL_LowE_1000_pocket_2_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_2_clusters
cp *_AA.pdb ../pocket_2_clusters/
#################################################################################
cd ../..
cd SARSCoV2-RNA-15769-15899
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-15769-15899_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-15769-15899_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-15769-15899_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-15769-15899_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/
#####################################################################################
cd ../..
cd SARSCoV2-RNA-14374-14641
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-14374-14641_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-14374-14641_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-14374-14641_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-14374-14641_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ..
mkdir pocket_2
mv *_pocket_2.pdb pocket_2
cd pocket_2
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_2.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-14374-14641_ALL_LowE_1000_pocket_2.trafl
clustering SARSCoV2-RNA-14374-14641_ALL_LowE_1000_pocket_2.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-14374-14641_ALL_LowE_1000-000001_AA_pocket_2.pdb SARSCoV2-RNA-14374-14641_ALL_LowE_1000_pocket_2_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_2_clusters
cp *_AA.pdb ../pocket_2_clusters/

cd ../..
cd SARSCoV2-RNA-26463-27101
mkdir pocket_1 
mv *_pocket_1.pdb pocket_1
cd pocket_1
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_1.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-26463-27101_ALL_LowE_1000_pocket_1.trafl
clustering SARSCoV2-RNA-26463-27101_ALL_LowE_1000_pocket_1.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-26463-27101_ALL_LowE_1000-000001_AA_pocket_1.pdb SARSCoV2-RNA-26463-27101_ALL_LowE_1000_pocket_1_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_1_clusters
cp *_AA.pdb ../pocket_1_clusters/

cd ..
mkdir pocket_2
mv *_pocket_2.pdb pocket_2
cd pocket_2
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_2.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-26463-27101_ALL_LowE_1000_pocket_2.trafl
clustering SARSCoV2-RNA-26463-27101_ALL_LowE_1000_pocket_2.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-26463-27101_ALL_LowE_1000-000001_AA_pocket_2.pdb SARSCoV2-RNA-26463-27101_ALL_LowE_1000_pocket_2_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_2_clusters
cp *_AA.pdb ../pocket_2_clusters/

cd ..
mkdir pocket_3
mv *_pocket_3.pdb pocket_3
cd pocket_3
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_3.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-26463-27101_ALL_LowE_1000_pocket_3.trafl
clustering SARSCoV2-RNA-26463-27101_ALL_LowE_1000_pocket_3.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-26463-27101_ALL_LowE_1000-000001_AA_pocket_3.pdb SARSCoV2-RNA-26463-27101_ALL_LowE_1000_pocket_3_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_3_clusters
cp *_AA.pdb ../pocket_3_clusters/

cd ..
mkdir pocket_4
mv *_pocket_4.pdb pocket_4
cd pocket_4
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_4.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-26463-27101_ALL_LowE_1000_pocket_4.trafl
clustering SARSCoV2-RNA-26463-27101_ALL_LowE_1000_pocket_4.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-26463-27101_ALL_LowE_1000-000001_AA_pocket_4.pdb SARSCoV2-RNA-26463-27101_ALL_LowE_1000_pocket_4_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_4_clusters
cp *_AA.pdb ../pocket_4_clusters/

cd ..
mkdir pocket_5
mv *_pocket_5.pdb pocket_5
cd pocket_5
ln -s ~/Softwares/SimRNA3_3.22_rare_write/data/ data
cp /media/nithin/FCEXT4/WORK/COVID/git/sars-cov-2/Pockets_1000_LE/config.dat .
ls *_pocket_5.pdb|xargs -I {} -P 12 -n 1 SimRNA -c config.dat -p {} 
cat *.trafl >SARSCoV2-RNA-26463-27101_ALL_LowE_1000_pocket_5.trafl
clustering SARSCoV2-RNA-26463-27101_ALL_LowE_1000_pocket_5.trafl 1 3 4 5 6 7 8 9 10 11 12 >clustering.log 2>&1
for i in {3..12};do for j in {1..5};do SimRNA_trafl2pdbs SARSCoV2-RNA-26463-27101_ALL_LowE_1000-000001_AA_pocket_5.pdb SARSCoV2-RNA-26463-27101_ALL_LowE_1000_pocket_5_thrs$i.00A_clust0$j.trafl 1 AA;done;done
mkdir ../pocket_5_clusters
cp *_AA.pdb ../pocket_5_clusters/
