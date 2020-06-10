#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Author:Tomasz Wirecki, Bujnicki Lab, IIMCB in Warsaw
Date: June 2020

Script for normalizing the SHAPE reactivities

Usage:
normalize_reactivities.py -f input_file

For more help use:
normalize_reactivities.py -h
"""


import argparse
from argparse import RawTextHelpFormatter
import os    



def argument_parser():

    parser = argparse.ArgumentParser(description=__doc__, prog='normalize_reactivities', formatter_class=RawTextHelpFormatter)
    parser.add_argument("-f", "--file", required=True, dest="file",
                            help="Input with reactivties separated by ','")

    args = parser.parse_args() 

    infile = args.file

    return infile
    
    
    
def normalize_reactivities():
     for i in range(0,len(react)):
         if float(react[i]) > 0.7:
             react[i] = 0.7
     
     for i in range(0,len(react)):
         react[i] = round((float(react[i])/0.7),3)
         
     print(','.join(str(k) for k in react))    
    
     output = open('incarnato_covid_react_norm_0to1.txt','w')
     output.write(','.join(str(k) for k in react))
     output.close()
    
    
def read_file():
    with open(infile) as f:
        react_all_str = f.readline()
        react_all = react_all_str.split(",")
    
    print(react_all)
    return react_all
    
    
    
if __name__ == '__main__':

    infile = argument_parser()
    react = read_file()
    normalize_reactivities()


