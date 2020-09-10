#!/usr/bin/python3.8

"""
Author: Pritha Ghosh, Bujnicki Lab, IIMCB in Warsaw
Date: 14 May 2020

Script to generate input files for the ShapeKnots program

Usage:
python3 shapeknots_inputs.py --react reactivity_file --input input_file 

For more help use:
python3 shapeknots_inputs.py -h
"""

des = "Script to generate input files for the ShapeKnots program"
react_help_text = "React file format:\n0.7,0.4,0.3,0.3,1.0,0.8,1.0,0.1,0.5,0.2"
input_help_text = "Input file format:\n>motif_4-10\nAUGAAAC"
output_react_help_text = "Expected reactivity output file:\n0.3,1.0,0.8,1.0,0.1,0.5,0.2"
output_frag_help_text = "Expected fragment output file:\nAUGAAAC"

import argparse

parser = argparse.ArgumentParser(
    description=f"{des}\n\n{react_help_text}\n\n{input_help_text}\n\n{output_react_help_text}\n\n{output_frag_help_text}",
    formatter_class=argparse.RawTextHelpFormatter)

parser.add_argument("-r",
                    "--react",
                    help="Name of the reactvity file")
parser.add_argument("-i",
                    "--input",
                    help="Name of the input file")
args = parser.parse_args()

import os

def extract_fragments(filename):
    """
    Parses the input file and returns its content in the form of a
    dictionary where key is the name of the fragment and value is
    the sequnce
    :param filename: Name of input file
    """
    my_dict = {}
    with open(filename) as f:
        for line in f:
            key = line.strip()
            seq = f.readline().strip()
            next(f).strip()
            my_dict[key] = seq
    return my_dict


def distribute(react_file, fragment_file):
    """
    Parses the reactivity and the input files and makes a directory
    with two output files: reactivity and sequence files with the same
    name as that of the fragment
    :param react_file: Name of reactivity file
    :param fragment_file: Name of input file
    """
    with open(react_file) as f:
        react = f.readline().strip().split(",")

    fragments = extract_fragments(fragment_file)
    for frg in fragments.keys():
        start, end = frg.split("-")
        start = int(start.rsplit("_", 1)[1])
        end = int(end.split("_", 1)[0])
        react_frag = ",".join(react[start - 1:end])
        name = frg[1:]
        if not os.path.exists(name):
            os.makedirs(name)
        with open(f"{name}/{name}.seq", "w") as seq_file:
            seq_file.write(f"{frg}\n")
            seq_file.write(fragments[frg])

        with open(f"{name}/{name}.react", "w") as re_file:
            re_file.write(react_frag)


distribute(args.react, args.input)