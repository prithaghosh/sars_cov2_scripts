# Scripts for SARS CoV2 project

## Compiling the C++ codes

All the C++ codes can be compiled by using the following command:
```bash
make
```

### pocket_3d_distance.cpp
The program requires two input files as positional arguments and output filename as third positional argument. 
Example useage is:
```bash
./pocket_3d_distance List_pdbs pocket_data Output_filename
```

The first input file is a list of PDBs from which the pockets are being extracted. The filenames can be absolute or relative paths.
Example file: 
```
segment_1/model1.pdb
segment_1/model2.pdb
segment_2/model1.pdb
segment_2/model2.pdb
```
The second input file is the information about pockets. This file is a multi-line fasta-like file where each segment to be analyszed has its own header followed by the secondary structure and two lines describing all the pockets. Any line following this will be ignored and not processed until next segment is reached. The residues marked with any character other than _ in the second line describing the pocket is used to compute the distances.
Example file: 
```
>segment_1 Scheme
(((((.......))))).....(((....)))....
PPPPP_______ppppp_______P____p______
PPPPPP______ppppp___________________
111111______22222___________________
>segment_2
....((((....))))..........(((((...........)))))
___PPPPP____pppp__________________PPPPPPP______
__PPPPPPP___pppp_________________PPPPPPPPP_____
__1111111___2222_______________________________
_________________________________zzzzzzzzz_____
```
The header string must be a substring of the PDB filename or path.
The output file conatins the unique pockets based on distance and their counts.
Example file:
```
>segment_1
(((((.......))))).....(((....)))....
PPPPP_______ppppp_______P____p______
PPPPPP______ppppp___________________
PPPPPP______ppppp___________________    1000
>segment_2
....((((....))))..........(((((...........)))))
___PPPPP____pppp__________________PPPPPPP______
__PPPPPPP___pppp_________________PPPPPPPPP_____
__PPPPPPP___PPPP_________________PPPPPPPPP_____	80
__PPPPPPP___PPPP_______________________________	920
_________________________________PPPPPPPPP_____	920
```

### pocket_extraction_sequence.cpp
The program requires two input files as positional arguments.
Example useage is:
```bash
./pocket_extraction_sequence List_pdbs pocket_data 
```
The first file is a list of PDBs from which the pockets are being 
extracted. The filenames can be absolute or relative paths.
Example file: 
```
segment_1/model1.pdb
segment_1/model2.pdb
segment_2/model1.pdb
segment_2/model2.pdb
```
The second file is the information about pockets. This file is a 
multi-line fasta file where each segment to be analyszed has its own 
header followed by the secondary structure and two lines describing
all the pockets. Each pocket to be extracted is a single line with 
residues to be extracted marked as P.
Example file: 
```
>segment_1
(((((.......))))).....(((....)))....
PPPPP_______ppppp_______P____p______
PPPPPP______ppppp___________________
PPPPPP______PPPPP___________________
>segment_2
....((((....))))..........(((((...........)))))
___PPPPP____pppp__________________PPPPPPP______
__PPPPPPP___pppp_________________PPPPPPPPP_____
__PPPPPPP___PPPP_______________________________
_________________________________PPPPPPPPP_____
```
The header string must be a substring of the PDB filename or path.


## Python codes

### incarnato_fragment_mapping.py
Script to map Incarnato fragments onto the SARS-CoV2 genome
Usage:
```
python3 incarnato_fragment_mapping.py --genome genome_file --input input_file
```
For more help use:
```
python3 incarnato_fragment_mapping.py -h
```

### bujnicki_segment_mapping.py
Script to map Bujnicki segments onto the SARS-CoV2 genome
Usage:
```
python3 bujnicki_segment_mapping.py --genome genome_file --input input_file
```
For more help use:
```
python3 bujnicki_segment_mapping.py -h
```

### shapeknots_inputs.py
Script to generate input files for the ShapeKnots program
Usage:
```
python3 shapeknots_inputs.py --react reactivity_file --input input_file 
```
For more help use:
```
python3 shapeknots_inputs.py -h
```

### binding_pockets_mapping_to_ss.py
Script to map predicted pockets onto the secondary structure of segments
Usage:
```
python3 binding_pockets_mapping_to_ss.py --ss secondary_structure_file --pockets pockets_file
```
For more help use:
```
python3 binding_pockets_mapping_to_ss.py -h
```

### find_ss_pairing_partners.py
Script to annotate pairing partner in secondary structures to binding pockets
Usage:
```
python3 find_ss_pairing_partners.py --input input_file
```
For more help use:
```
python3 find_ss_pairing_partners.py -h
```

## Shell scripts
Script to extract secondary structures from 3D models using ClaRNA
Usage:
```
clarna.sh
```
ClaRNA can be installed from the following [link](https://rna-tools.readthedocs.io/en/latest/tools.html?highlight=clarna#clarna-contacts-classification)