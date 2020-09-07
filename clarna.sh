# Author: Pritha Ghosh, Bujnicki Lab, IIMCB in Warsaw
# Date: 28 May 2020

# Script to extract secondary structures from 3D models using ClaRNA

# Reference: ClaRNA: a classifier of contacts in RNA 3D structures
# based on a comparative analysis of various classification schemes
# Walen T, Chojnowski G, Gierski P and Bujnicki JM
# doi: 10.1093/nar/gku76

# https://rna-tools.readthedocs.io/en/latest/tools.html?highlight=clarna#clarna-contacts-classification
for fname in `cat list_of_le_models`; do
  python clarna_run.py -ipdb $fname.pdb >$fname.outCR
  ClaRNAwd_output_parser_get_SS $fname.outCR >$fname.ss
done

ls -d fragment* >list_of_segments

for segment in `cat list_of_segments`; do
  cd $segment
  ls *.ss >list_of_models
  sed -i 's/.ss//g' list_of_models

  for model in `cat list_of_models`; do
    find_SS_consensus $model".ss" 0.1 >$model".consensus_ss_0.1"
    grep -A1 "consensus_pairs_unique_single_line" $model".consensus_ss_0.1" >$model".consensus_ss_0.1_unique1line"
    grep -v "consensus_pairs_unique_single_line" $model".consensus_ss_0.1_unique1line" | cut -f2 -d ':' >>$segment"_1000_LE_PDBs_consensus_ss_0.1_unique1line"
  done

  # find_SS_consensus: Boniecki MJ and Bujnicki JM, unpublished
  find_SS_consensus $segment"_1000_LE_PDBs_consensus_ss_0.1_unique1line" 0.1 >$segment"_1000_LE_PDBs_consensus_ss_0.1_unique1line.consensus_ss_0.1"
  find_SS_consensus $segment"_1000_LE_PDBs_consensus_ss_0.1_unique1line" 0.25 >$segment"_1000_LE_PDBs_consensus_ss_0.1_unique1line.consensus_ss_0.25"
  find_SS_consensus $segment"_1000_LE_PDBs_consensus_ss_0.1_unique1line" 0.5 >$segment"_1000_LE_PDBs_consensus_ss_0.1_unique1line.consensus_ss_0.5"
  find_SS_consensus $segment"_1000_LE_PDBs_consensus_ss_0.1_unique1line" 0.75 >$segment"_1000_LE_PDBs_consensus_ss_0.1_unique1line.consensus_ss_0.75"
  find_SS_consensus $segment"_1000_LE_PDBs_consensus_ss_0.1_unique1line" 0.9 >$segment"_1000_LE_PDBs_consensus_ss_0.1_unique1line.consensus_ss_0.9"

  echo ">consensus_pairs_unique_single_line_0.1" >>$segment"_temp"
  grep -A3 "consensus_pairs_unique_single_line" $segment"_1000_LE_PDBs_consensus_ss_0.1_unique1line.consensus_ss_0.1" >$segment"_1000_LE_PDBs_consensus_ss_0.1_unique1line.consensus_ss_0.1_unique1line"
  grep -v "consensus_pairs_unique_single_line" $segment"_1000_LE_PDBs_consensus_ss_0.1_unique1line.consensus_ss_0.1_unique1line" | cut -f2 -d ':' >>$segment"_temp"

  echo ">consensus_pairs_unique_single_line_0.25" >>$segment"_temp"
  grep -A1 "consensus_pairs_unique_single_line" $segment"_1000_LE_PDBs_consensus_ss_0.1_unique1line.consensus_ss_0.25" >$segment"_1000_LE_PDBs_consensus_ss_0.1_unique1line.consensus_ss_0.25_unique1line"
  grep -v "consensus_pairs_unique_single_line" $segment"_1000_LE_PDBs_consensus_ss_0.1_unique1line.consensus_ss_0.25_unique1line" | cut -f2 -d ':' >>$segment"_temp"

  echo ">consensus_pairs_unique_single_line_0.5" >>$segment"_temp"
  grep -A1 "consensus_pairs_unique_single_line" $segment"_1000_LE_PDBs_consensus_ss_0.1_unique1line.consensus_ss_0.5" >$segment"_1000_LE_PDBs_consensus_ss_0.1_unique1line.consensus_ss_0.5_unique1line"
  grep -v "consensus_pairs_unique_single_line" $segment"_1000_LE_PDBs_consensus_ss_0.1_unique1line.consensus_ss_0.5_unique1line" | cut -f2 -d ':' >>$segment"_temp"

  echo ">consensus_pairs_unique_single_line_0.75" >>$segment"_temp"
  grep -A1 "consensus_pairs_unique_single_line" $segment"_1000_LE_PDBs_consensus_ss_0.1_unique1line.consensus_ss_0.75" >$segment"_1000_LE_PDBs_consensus_ss_0.1_unique1line.consensus_ss_0.75_unique1line"
  grep -v "consensus_pairs_unique_single_line" $segment"_1000_LE_PDBs_consensus_ss_0.1_unique1line.consensus_ss_0.75_unique1line" | cut -f2 -d ':' >>$segment"_temp"

  echo ">consensus_pairs_unique_single_line_0.9" >>$segment"_temp"
  grep -A1 "consensus_pairs_unique_single_line" $segment"_1000_LE_PDBs_consensus_ss_0.1_unique1line.consensus_ss_0.9" >$segment"_1000_LE_PDBs_consensus_ss_0.1_unique1line.consensus_ss_0.9_unique1line"
  grep -v "consensus_pairs_unique_single_line" $segment"_1000_LE_PDBs_consensus_ss_0.1_unique1line.consensus_ss_0.9_unique1line" | cut -f2 -d ':' >>$segment"_temp"

  echo ">consensus_pairs_unique_single_line_0.1_score" >>$segment"_consensus_1000.ss"
  grep -A1 ">consensus_pairs_unique_score" $segment"_temp" | grep -v ">consensus_pairs_unique_score" >>$segment"_consensus_1000.ss"
  grep -A1 ">consensus_pairs_unique_single_line_0.1" $segment"_temp" >>$segment"_consensus_1000.ss"
  grep -A7 ">consensus_pairs_unique_single_line_0.25" $segment"_temp" >>$segment"_consensus_1000.ss"
  rm $segment"_temp"
  cd ..
done

tail -n+1 */*_1000_LE_PDBs_consensus_ss_0.1_unique1line.consensus_ss_0.75_unique1line | grep -v "consensus_pairs_unique_single_line" | cut -f2 -d '/' | sed -z 's/_1000_LE_PDBs_consensus_ss_0.1_unique1line.consensus_ss_0.75_unique1line <==//g' | sed -z 's/fragment/>fragment/g' | sed -z 's/\n\n/\n/g' >all_bujnicki_segment_consensus_ss_0.75_1000.ss
