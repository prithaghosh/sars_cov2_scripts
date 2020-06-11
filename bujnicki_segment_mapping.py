"""
Author: Pritha Ghosh, Bujnicki Lab, IIMCB in Warsaw
Date: 31 May 2020

Script to map Bujnicki segments onto the SARS-CoV2 genome

Usage:
python3 bujnicki_segment_mapping.py --genome genome_file --input input_file 

For more help use:
python3 bujnicki_segment_mapping.py -h
"""

import argparse

des = "Script to map Bujnicki segments onto the SARS-CoV2 genome"
genome_help_text = "Genome file format:\nUAGAUGAAACAUGAU"
input_help_text = "Input file format:\n>segment name\nAUGAAACAU\n(((...)))"
output_help_text = "Expected output file:\n>SARS-CoV-2\nUAGAUGAAACAUGAU\n>Bujnicki_segments_seq\n___AUGAAACAU___"

parser = argparse.ArgumentParser(
    description=f"{des}\n\n{genome_help_text}\n\n{input_help_text}\n\n{output_help_text}",
    formatter_class=argparse.RawTextHelpFormatter)

parser.add_argument("-g",
                    "--genome",
                    help="Name of the genome file")
parser.add_argument("-i",
                    "--input",
                    help="Name of the input file")
parser.add_argument("-o",
                    "--output",
                    default="out.txt",
                    help="Name of the output file (default=out.txt)")
args = parser.parse_args()


def get_fragments(genome, filename):
    with open(filename) as f:
        all_lines = f.readlines()
    all_seqs = all_lines[1::2]
    all_seqs = [x.strip() for x in all_seqs]
    return {genome.index(x): x for x in all_seqs}


def get_gap_string(fragments, genome_length):
    final_str = ""
    for key in sorted(fragments.keys()):
        pos = int(key) - len(final_str)
        final_str += "".join("_" for _ in range(pos))
        final_str += fragments[key]

    pos = genome_length - len(final_str)
    final_str += "".join("_" for _ in range(pos))
    return final_str


def main_function():
    with open(args.genome) as file:
        genome_seq = file.readline().strip()

    frags = get_fragments(genome_seq, args.input)
    gaps = get_gap_string(frags, len(genome_seq))

    with open(args.output, "w") as file:
        print(">SARS-CoV-2", file=file)
        print(genome_seq, file=file)
        print(">Bujnicki_segments_seq", file=file)
        print(gaps, file=file)

if __name__ == "__main__":
  main_function()