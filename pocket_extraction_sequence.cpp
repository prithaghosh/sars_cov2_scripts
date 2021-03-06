/*
 * pocket_extraction_sequence.cpp
 * 
 * Copyright 2020 Nithin C
 * Laboratory of Bioinformatics and Protein Engineering
 * International Institute of Molecuar and Cell Biology in Warsaw
 * ul. Ks. Trojdena 4, 02-109 ​Warsaw, Poland
 * 
 * Head of the Laboratory
 * Prof. Janusz M. Bujnicki, PhD, DSc, Professor of Biological Sciences
 * Email: iamb@genesilico.pl 
 * 
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
 * MA 02110-1301, USA.
 * 
 * 
 */


#include <iostream>
#include <list>
#include <fstream>
#include <vector>
#include <string>
#include <sstream>
using namespace std;
int main(int argc, char **argv)
{
/*
* The program requires two input files as positional arguments.
* The first file is a list of PDBs from which the pockets are being 
* extracted. The filenames can be absolute or relative paths.
* Example file: 
* segment_1/model1.pdb
* segment_1/model2.pdb
* segment_2/model1.pdb
* segment_2/model2.pdb
* The second file is the information about pockets. This file is a 
* multi-line fasta file where each segment to be analyszed has its own 
* header followed by the secondary structure and two lines describing
* all the pockets. Each pocket to be extracted is a single line with 
* residues to be extracted marked as P.
* Example file: 
* >segment_1
* (((((.......))))).....(((....)))....
* PPPPP_______ppppp_______P____p______
* PPPPPP______ppppp___________________
* PPPPPP______PPPPP___________________
* >segment_2
* ....((((....))))..........(((((...........)))))
* ___PPPPP____pppp__________________PPPPPPP______
* __PPPPPPP___pppp_________________PPPPPPPPP_____
* __PPPPPPP___PPPP_______________________________
* _________________________________PPPPPPPPP_____
* The header string must be a substring of the PDB filename or path.
* 
*/
    
    if(argc!=3 or argv[1] == "-h" or argv[1] == "--help")
	{
		std::cerr<<"Help Message"<<std::endl;
		std::cerr<<"Correct useage is: "<<argv[0]<<" List_pdbs pocket_data"<<std::endl;
        std::cerr<<"The program requires two input files as positional arguments."<<std::endl;
        std::cerr<<"The first file is a list of PDBs from which the pockets are being extracted."<<std::endl;
        std::cerr<<"The filenames can be absolute or relative paths."<<std::endl;
        std::cerr<<"Example file:"<<std::endl;
        std::cerr<<"\tsegment_1/model1.pdb"<<std::endl;
        std::cerr<<"\tsegment_1/model2.pdb"<<std::endl;
        std::cerr<<"\tsegment_2/model1.pdb"<<std::endl;
        std::cerr<<"\tsegment_2/model2.pdb"<<std::endl;
        std::cerr<<"The second file is the information about pockets. This file is a multi-line"<<std::endl;
        std::cerr<<"fasta file where each segment to be analyszed has its own header followed by"<<std::endl;
        std::cerr<<"the secondary structure and two lines describing all the pockets. Each pocket"<<std::endl;
        std::cerr<<"to be extracted is a single line with residues to be extracted marked as P."<<std::endl;
        std::cerr<<"\tExample file:"<<std::endl;
        std::cerr<<"\t>segment_"<<std::endl;
        std::cerr<<"\t(((((.......))))).....(((....)))...."<<std::endl;
        std::cerr<<"\tPPPPP_______ppppp_______P____p_____"<<std::endl;
        std::cerr<<"\tPPPPPP______ppppp___________________"<<std::endl;                                 
        std::cerr<<"\tPPPPPP______PPPPP___________________"<<std::endl;                     
        std::cerr<<"\t>segment_2"<<std::endl;                     
        std::cerr<<"\t....((((....))))..........(((((...........)))))"<<std::endl;                     
        std::cerr<<"\t___PPPPP____pppp__________________PPPPPPP______"<<std::endl;                     
        std::cerr<<"\t__PPPPPPP___pppp_________________PPPPPPPPP_____"<<std::endl;                     
        std::cerr<<"\t__PPPPPPP___PPPP_______________________________"<<std::endl;                     
        std::cerr<<"\t_________________________________PPPPPPPPP_____"<<std::endl;                     
        std::cerr<<"The header string must be a substring of the PDB filename or path."<<std::endl;


		return 1;
	}
/*
* The program checks for the input file with list of PDBs. 
* If the file is absent then the program will terminate with a warning.
* If the file is available then the program copies it to a vector of 
* strings named list_pdb_files.
*/
	std::ifstream file(argv[1]);
	std::stringstream list_pdbs;

	
	if(file.is_open())
	{
		list_pdbs << file.rdbuf();
		file.close();
	}
	else
	{
		std::cout<<"Unable to open "<<argv[1]<<std::endl;
		return 1;		
	}
	std::string line, atom_descriptor;
	vector<string> list_pdb_files;
    while(std::getline(list_pdbs,line))	if(line != "")	list_pdb_files.push_back(line);
	
/*
* The program checks for the input file with lthe information about 
* pockets. If the file is absent then the program will terminate with a 
* warning. If the file is available then the program copies it to a 
* stringstream named data.
*/
    std::stringstream data; 
    file.open(argv[2]);
	if(file.is_open())
	{
		data << file.rdbuf();
		file.close();
	}
	else
	{
		std::cout<<"Unable to open "<<argv[2]<<std::endl;
		return 1;
	}
	size_t pocket_number =0; //initilize the number of pockets as zero.
    std::string header, secondary_structure, pocket_original, pocket_extended, pocket_description;
/*
* Each segment described in the input file with lthe information about 
* pockets is processed one by one in the while loop.
*/
    
	while(std::getline(data,line))
	{
        if (line != "")
        {            
            if(line.substr(0,1) == ">") 
            {
                header = line.substr(1);
                std::getline(data, secondary_structure);
                std::getline(data, pocket_original);
                std::getline(data, pocket_extended);
                pocket_number = 1;
            }
            else
            {
                pocket_description = line;
/*
* Each PDB file is processed in the for loop if the name have the header
* line as a subsring in the PDB file name or path.
*/
                for(auto t=list_pdb_files.begin(); t!=list_pdb_files.end(); ++t)
                {
                    std::cout << *t << '\n';
                    if (std::string(*t).find(header) != string::npos) 
                    {
                        file.open(*t);
                        std::stringstream pdb;
                        vector<string> atoms;
                        if(file.is_open())
                        {
                            pdb << file.rdbuf();
                            file.close();
                        }
                        else
                        {
                            std::cout<<"Unable to open "<<*t<<std::endl;
                            return 1;
                        }
/*
* Each atom which is assigned as a pocket is extracted in this loop.
* The atoms are stored in a vector of strings named atoms.
*/                        
                        while(std::getline(pdb,atom_descriptor))
                        {
                            if(atom_descriptor !="")
                            {
                                if(atom_descriptor.substr(0,4) == "ATOM")
                                {
                                    auto res_num = stoi(atom_descriptor.substr(22,4));
                                    if (pocket_description.substr(res_num-1,1) != "_")
                                    {
                                        //cout <<pocket_description.substr(res_num-1,1) <<endl;
                                        //std::cout<<atom_descriptor<<std::endl;
/*
 * Uncomment the line below to make easy visualization possible for 
 * residues which were highly scored before extending to include 
 * the neighbouring residues or pairs.
*/
                                        //if(pocket_original.substr(res_num-1,1) == "P")  atom_descriptor.replace(62,5,"99.99");
                                        atoms.push_back(atom_descriptor);
                                    }
                                }
                            }                                
                        }
/*
 * The output files are written and the vectors are cleared to process 
 * the next pocket.
*/
                        auto out_file_name = std::string(*t).replace(std::string(*t).find(".pdb"),4,"")+"_pocket_"+std::to_string(pocket_number)+".pdb";
                        std::ofstream out_file;
                        std::cout <<out_file_name<<std::endl;
                        out_file.open(out_file_name.c_str());
                        for(auto a=atoms.begin(); a!=atoms.end(); ++a) out_file<<*a<<std::endl;
                        //if(out_file.is_open())
                        //for (const auto &e : atoms) out_file << e << std::endl;
                        out_file.close();
                        atoms.clear();
                        vector<string>().swap(atoms);
                    }
                }
                pocket_number++;
            }
        }
	}

    return 0;
}

