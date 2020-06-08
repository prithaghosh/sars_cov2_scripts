/*
 * pocket_3d_distance.cpp
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
#include <set>
#include <map>
#include <cmath>
#include <algorithm>
using namespace std;
int main(int argc, char **argv)
{
/*
* The prrogram requires two input files as positional arguments and 
* output filename as third positional argument.
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
* all the pockets. Any line following this will be ignored and not 
* processed until next segment is reached. The residues marked with any
* character other than _ in the second line describing the pocket is 
* used to compute the distances.
* Example file: 
* >segment_1
* (((((.......))))).....(((....)))....
* PPPPP_______ppppp_______P____p______
* PPPPPP______ppppp___________________
* 111111______22222___________________
* >segment_2
* ....((((....))))..........(((((...........)))))
* ___PPPPP____pppp__________________PPPPPPP______
* __PPPPPPP___pppp_________________PPPPPPPPP_____
* __1111111___2222_______________________________
* _________________________________zzzzzzzzz_____
* The header string must be a substring of the PDB filename or path.
* The output file conatins the unique pockets based on distance and their counts.
* Example file:
* >segment_1
* (((((.......))))).....(((....)))....
* PPPPP_______ppppp_______P____p______
* PPPPPP______ppppp___________________
* PPPPPP______ppppp___________________    1000
* >segment_2
* ....((((....))))..........(((((...........)))))
* ___PPPPP____pppp__________________PPPPPPP______
* __PPPPPPP___pppp_________________PPPPPPPPP_____
* __PPPPPPP___PPPP_________________PPPPPPPPP_____	80
* __PPPPPPP___PPPP_______________________________	920
* _________________________________PPPPPPPPP_____	920
*/
    if(argc!=4)
	{
		std::cerr<<"Incorrect Useage:"<<std::endl;
		std::cerr<<"Correct useage is: "<<argv[0]<<" List_pdbs pocket_data Output_filename"<<std::endl;
		return EXIT_FAILURE;
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
		std::cerr<<"Unable to open "<<argv[1]<<std::endl;
		return EXIT_FAILURE;		
	}
	std::string line, atom_descriptor;
	std::vector<std::string> list_pdb_files;
    while(std::getline(list_pdbs,line))	if(line != "")	list_pdb_files.push_back(line);
	
/*
* The program checks for the input file with lthe information about 
* pockets. If the file is absent then the program will terminate with a 
* warning. If the file is available then the program copies it to a 
* stringstream named data.
*/
	file.open(argv[2]);   
    std::stringstream data; 
	if(file.is_open())
	{
		data << file.rdbuf();
		file.close();
	}
	else
	{
		std::cout<<"Unable to open "<<argv[1]<<std::endl;
		return EXIT_FAILURE;
	}
    std::string header, secondary_structure, pocket_original, pocket_extended, pocket_description;
    std::stringstream data_out;
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
                data_out<<line<<std::endl;
                std::getline(data, secondary_structure);
                data_out<<secondary_structure<<std::endl;
                std::getline(data, pocket_original);
                data_out<<pocket_original<<std::endl;
                std::getline(data, pocket_extended);
                data_out<<pocket_extended<<std::endl;
                //std::vector< std::string > pocket_extracted;
                std::vector <std::string > pocket_extracted_all;
/*
* Each PDB file is processed in the for loop if the name have the header
* line as a subsring in the PDB file name or path.
*/
                for(auto t=list_pdb_files.begin(); t!=list_pdb_files.end(); ++t)
                {
                    //std::cout << *t << std::endl;
                    if (std::string(*t).find(header) != std::string::npos) 
                    {
                        file.open(*t);
                        std::stringstream pdb;
                        std::vector<std::string> atoms;
                        if(file.is_open())
                        {
                            pdb << file.rdbuf();
                            file.close();
                        }
                        else
                        {
                            std::cerr<<"Unable to open "<<*t<<std::endl;
                            std::cerr<<"Proceeding to next file without exiting the program"<<std::endl;
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
                                    if (pocket_extended.substr(res_num-1,1) != "_")
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
                        //auto out_file_name = *t+"_pocket"+to_string(pocket_number)+".pdb";
                        //std::map < std::pair< std::string, std::string>, double > distances;
                        //std::map <size_t, std::set<string> >pockets;
                        size_t pocket_number=0;
                        std::set<std::string > neighbours;
                        int atoms_size=0, atoms_size_prev=0;
                        if(!atoms.empty())    neighbours.insert(atoms.at(0));
/*
 * The neighbours in 3D are calculated for each atom. To do this a set 
 * of strings named neigbours is created. The first entry in atoms is 
 * copied to neighbours and the distance between the members of neigbours
 * and atoms is computed. If any atom is within cut-off distance from 
 * the elements in neighbours then they are copied. The use of set 
 * ensures that the neighbours do not have any duplicate entry. 
 *
*/
                        while(!atoms.empty())
                        {
                            atoms_size_prev = atoms.size();
                            
                            if(!atoms.empty()&&!neighbours.empty())
                            for (auto elem : neighbours)
                            {
                                auto x1=stof(elem.substr(30,8));
                                auto y1=stof(elem.substr(38,8));
                                auto z1=stof(elem.substr(46,8));
                                bool is_needed = false;
                                #pragma omp parallel for 
                                for (size_t j=0; j<atoms.size();++j)
                                {
                                    auto x2=stof(atoms.at(j).substr(30,8));
                                    auto y2=stof(atoms.at(j).substr(38,8));
                                    auto z2=stof(atoms.at(j).substr(46,8));
                                    auto d = sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2)+(z1-z2)*(z1-z2));
                                    //distances.insert(pair< std::pair< std::string, std::string>, double >(make_pair(atoms.at(i),atoms.at(j)), d));
                                    if(d <= 12.00)   neighbours.insert(atoms.at(j));                                    
                                }                                
                            }
                            if(!neighbours.empty())   for (auto n=neighbours.begin(); n!=neighbours.end(); ++n)   atoms.erase(std::remove(atoms.begin(), atoms.end(), *n), atoms.end());
                            atoms_size = atoms.size();
                            //std::cout<<"atoms_size = "<<atoms_size<<"\t"<<"atoms_size_prev = "<<atoms_size_prev<<std::endl;
/*
 * After each complete iteration through the vector atoms, the members 
 * already present in the set neighbours are deleted from the vector.
 * This is continued until the size of atoms no longer changes after 
 * deleting the entries in neighbours, which means atoms no longer have 
 * any member within the cutoff distance. The set is written to a PDB 
 * as a pocket. 
*/
                            if(atoms_size == atoms_size_prev && !neighbours.empty())
                            {
                                pocket_number++;
                                std::ofstream out_file;
                                auto out_file_name = std::string(*t).replace(std::string(*t).find(".pdb"),4,"")+"_pocket_"+std::to_string(pocket_number)+".pdb";
                                std::cerr<<out_file_name<<std::endl;
                                out_file.open(out_file_name.c_str());
                                out_file<<"HEADER    "+out_file_name.substr(out_file_name.find_last_of("/")+1)<<std::endl;
/*
 * While writing the elements of the set to the output PDB, a string is 
 * generated to identify the positions in sequence with P. All other 
 * parts of the string is marked with undescore (_).
 * 
*/
                                std::string pocket_extracted (pocket_original.size(), '_');
                                for(auto a=neighbours.begin(); a!=neighbours.end(); ++a)
                                {
                                    auto res_num_frag = stoi(std::string(*a).substr(22,4));
                                    pocket_extracted.replace(res_num_frag-1,1,"P");
                                    //pocket_extracted.at(pocket_number-1).replace(res_num_frag-1,1,"P");
                                    out_file<<*a<<std::endl;
                                }
                                //std::cout<<pocket_extracted<<std::endl;
                                pocket_extracted_all.push_back(pocket_extracted);
                                out_file.close();
                                neighbours.clear();
                                neighbours.insert(atoms.at(0));
                            }
                        }
/*
 * The last pocket is set is written as a PDB file below. While writing
 * the elements of the set to the output PDB, a string is generated to 
 * identify the positions in sequence with P. All other arts of the 
 * string is marked with undescore (_).
*/
                        if(!neighbours.empty())
                        {
                            pocket_number++;
                            std::ofstream out_file;
                            auto out_file_name = std::string(*t).replace(std::string(*t).find(".pdb"),4,"")+"_pocket_"+std::to_string(pocket_number)+".pdb";
                            std::cerr<<out_file_name<<std::endl;
                            out_file.open(out_file_name.c_str());
                            out_file<<"HEADER    "+out_file_name.substr(out_file_name.find_last_of("/")+1)<<std::endl;
                            std::string pocket_extracted (pocket_original.size(), '_');
                            //pocket_extracted.push_back(std::string (pocket_original.size(), '_'));
                            for(auto a=neighbours.begin(); a!=neighbours.end(); ++a)
                            {
                                auto res_num_frag = stoi(std::string(*a).substr(22,4));
                                pocket_extracted.replace(res_num_frag-1,1,"P");
                                out_file<<*a<<std::endl;
                            }
                            //std::cout<<pocket_extracted<<std::endl;
                            pocket_extracted_all.push_back(pocket_extracted);
                            out_file.close();
                            neighbours.clear();
                        }
                        std::cout<<"Number of pockets in "<<*t<<" = "<<pocket_number <<std::endl;
                    }
                }
/*
 * For each segment processed the number of times a particular pocket
 * string generated based on 3D distances is counted and output to the 
 * file specified by user. The orginal vector of strings is sorted, 
 * copied to a new vector and truncated to get list of unique pocket 
 * strings. The original list is counted to identify the numeber of 
 * times each unique pocket appears.
*/

                std::vector< std::string > pocket_extracted_unique = pocket_extracted_all;
                std::sort (pocket_extracted_unique.begin(), pocket_extracted_unique.end());
                //std::vector<string>::iterator it;
                //it = std::unique_copy (pocket_extracted_all.begin(),pocket_extracted_all.end(),pocket_extracted_unique.begin());
                auto last = std::unique(pocket_extracted_unique.begin(), pocket_extracted_unique.end());
                pocket_extracted_unique.erase(last, pocket_extracted_unique.end());
                std::vector <size_t > counter(pocket_extracted_unique.size());
                for (size_t i = 0; i < pocket_extracted_unique.size();++i)
                    counter.at(i) = std::count(pocket_extracted_all.begin(), pocket_extracted_all.end(), pocket_extracted_unique.at(i));
                for (size_t i = 0; i < counter.size(); ++i)
                    data_out<<pocket_extracted_unique.at(i)<<"\t"<<counter.at(i)<<std::endl; 
                //for (auto i:pocket_extracted_unique) std::cout<<i<<std::endl;
                //for (auto i:counter) std::cout<<i<<std::endl;
                //std::vector<string>::iterator it;
                //it = std::unique (myvector.begin(), myvector.end());
                
                
            }
            else
            {
                pocket_description = line;
                data_out<<line<<std::endl;
            }
        }
        
	}
	std::ofstream data_out_file(argv[3]);
    data_out_file<<data_out.str();
    return 0;
}
