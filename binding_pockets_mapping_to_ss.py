#!/usr/bin/python3.8

"""
Author: Pritha Ghosh, Bujnicki Lab, IIMCB in Warsaw
Date: 30 May 2020

Script to map predicted pockets onto the secondary structure of segments
Usage:
python3 binding_pockets_mapping_to_ss.py --ss secondary_structure_file --pockets pockets_file 

For more help use:
python3 binding_pockets_mapping_to_ss.py -h
"""

import argparse

des = "Script to map predicted pockets onto the secondary structure of segments"
ss_help_text =  "Secondary structure file format:\n>fragment name\n(((...)))"
pockets_help_text = "Pockets file format:\n>fragment name\n1,3,4,5,6,7"
output_help_text = "Expected output file:\n>fragment name\n(((...)))\nP_PPPPP__"

parser = argparse.ArgumentParser(
    description=f"{des}\n\n{ss_help_text}\n\n{pockets_help_text}\n\n{output_help_text}",
    formatter_class=argparse.RawTextHelpFormatter)

parser.add_argument("-s",
                    "--ss",
                    help="Name of the secondary structure file")
parser.add_argument("-p",
                    "--pockets",
                    help="Name of the pockets file")
parser.add_argument("-o",
                    "--output",
                    default="out.txt",
                    help="Name of the output file (default=out.txt)")
args = parser.parse_args()

def pocket_pos(binding_pockets):
    """
    Parses the input file and returns its content in the
    form of a dictionary where key is the fragment name
    and value is the list of pocket positions
    :param binding_pockets: Name of pockets file
    """
    pocket_dict = {}

    with open(binding_pockets) as f:
        for line in f:
            seg_name = line.strip().strip(">")
            sites = next(f).strip()
            pocket_dict[seg_name] = [int(x) for x in sites.split(",")]
    return pocket_dict

def pocket_mapping(consensus_ss):
    """
    Parses the input file and returns its content in the
    form of a dictionary where key is the fragment name
    and value is the secondary strucuture
    :param consensus_ss: Name of secondary structure file
    """
    ss_dict = {}

    with open(consensus_ss) as f:
        for line in f:
            seg_name = line.strip().strip(">")
            ss = next(f).strip()
            ss_dict[seg_name] = ss

            binding_pocket = []

            for seg_name, sites in binding_pocket_sites.items():
                for pos in sites:
                    binding_pocket.append(pos)
    return ss_dict

def make_pockets(positions, length):
    """
    Parses the input file and returns its content in the
    form of a string with pocket positions represented by P
    :param positions: List of pocket positions
    :param length: Length of fragment
    """
    pockets = ""
    for p in positions:
        gaps = p - len(pockets) - 1
        pockets += "".join(["_" for x in range(0, gaps)])
        pockets += "P"

    gaps = length - len(pockets)
    pockets += "".join(["_" for x in range(0, gaps)])
    return pockets

binding_pocket_sites = pocket_pos(args.pockets)
mapped_pockets = pocket_mapping(args.ss)

def main_function():
    with open(args.output, "w") as f:
        try:
            for segment_name, pocket_locations in binding_pocket_sites.items():
                fragment = mapped_pockets[segment_name]
                pocket_str = make_pockets(pocket_locations, len(fragment))
                print(f">{segment_name}", file=f)
                print(fragment, file=f)
                print(pocket_str, file=f)
        except KeyError:
            print(f"Key '{segment_name}' not found in both files, skipping")

if __name__ == "__main__":
  main_function()
