"""
Author: Pritha Ghosh, Bujnicki Lab, IIMCB in Warsaw
Date: 30 May 2020

Script to map predicted pockets onto the secondary structure of fragments

Usage:
python3 binding_pockets_mapping_to_ss.py --ss secondary_structure_file --pockets pockets_file 

For more help use:
python3 binding_pockets_mapping_to_ss.py -h
"""

mport argparse

des = "Script to map predicted pockets onto the secondary structure of fragments"
ss_help_text =  "Secondary structure file format:\n>motif_4-12\nAUGAAACAU\n(((...)))""
pockets_help_text = "Input file format:\n>>motif_4-12\nAUGAAACAU\n(((...)))"
output_help_text = "Expected output file:\n>SARS-CoV-2\nUAGAUGAAACAUGAU\n>Incarnato_fragments_seq\n___AUGAAACAU___\n>Incarnato_fragments_ss\n___(((...)))___"

parser = argparse.ArgumentParser(
    description=f"{des}\n\n{genome_help_text}\n\n{input_help_text}\n\n{output_help_text}",
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
    pocket_dict = {}

    with open(binding_pockets) as f:
        for line in f:
            seg_name = line.strip().strip(">")
            sites = next(f).strip()
            pocket_dict[seg_name] = [int(x) for x in sites.split(",")]
    return pocket_dict

def pocket_mapping(consensus_ss):
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
