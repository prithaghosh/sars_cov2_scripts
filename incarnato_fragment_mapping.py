"""
Author: Pritha Ghosh, Bujnicki Lab, IIMCB in Warsaw
Date: 14 May 2020

Script to map Incarnato fragments onto the SARS-CoV2 genome

Usage:
python3 incarnato_fragment_mapping.py --genome genome_file --input input_file 

For more help use:
python3 incarnato_fragment_mapping.py -h
"""

import argparse

des = "Script to map Incarnato fragments onto the SARS-CoV2 genome"
genome_help_text = "Genome file format:\nUAGAUGAAACAUGAU"
input_help_text = "Input file format:\n>motif_4-12\nAUGAAACAU\n(((...)))"
output_help_text = "Expected output file:\n>SARS-CoV-2\nUAGAUGAAACAUGAU\n>Incarnato_fragments_seq\n___AUGAAACAU___\n>Incarnato_fragments_ss\n___(((...)))___"

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

def extract_strings_from_i(incarnato_fragments, genome, param):
  """
  Parses the input file and returns its content in the form of a
  dictionary where key is the start and end positions of the fragment
  and value is the list of sequence and secondary structure
  :param incarnato_fragments: Name of input file
  :param genome: Name of genome file
  :param param: Index of values to be accessed
  """
  i_dict = {}
  i_fragment_regions = ""

  with open(incarnato_fragments) as f:
    for line in f:
      start, end = line.strip().split("_")[1].split("-")
      seq = next(f).strip()
      ss = next(f).strip()
      i_dict[(int(start), int(end))] = [seq,ss]

  for start, end in sorted(i_dict.keys()):
    temp = start - len(i_fragment_regions)
    gaps = "".join(["_" for x in range(0, temp)])
    i_fragment_regions += gaps
    i_fragment_regions += i_dict[(start, end)][param]
    
  tail = "".join(["_" for x in range(len(i_fragment_regions), genome+1)])
  i_fragment_regions += tail
  return i_fragment_regions
  
def main_function():
  with open(args.genome) as f:
    genome_seq = f.readline().strip()
    len_genome = len(genome_seq)

  seq = extract_strings_from_i(args.input, len_genome, 0)
  ss = extract_strings_from_i(args.input, len_genome, 1)

  with open(args.output, "w") as f:
    print(">SARS-CoV-2", file = f)
    print(genome_seq, file = f)
    print(">Incarnato_fragments_seq", file = f)
    print(seq, file = f)
    print(">Incarnato_fragments_ss", file = f)
    print(ss, file = f)

if __name__ == "__main__":
  main_function()