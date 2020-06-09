#!/usr/bin/env python
# -*- coding: utf-8 -*-
# -----------------------------------------
# Written by Dharm Skandh Jain
# Modified by Pritha Ghosh, 14 October 2019
# -----------------------------------------

# Usage: python predict_structures_lncRNA_updatedASperTomek_Pritha <input_sequence_file_in_fasta_format> <window_length> <step_value> <output_folder>

import os
import math
from time import time

import sys
input_file = sys.argv[1]
input_react = sys.argv[2]
win_len = sys.argv[3]
step_val = sys.argv[4]
output_folder = sys.argv[5]

def predict_structures(sequence):
	
	with open(input_react) as f:
		react_all_str = f.readline()
		react_all = react_all_str.split(",")
	print sequence
	#print react_all
	num_steps = int(math.ceil((len(sequence) - int(win_len) + 1)/int(step_val)))
	residues_left = len(sequence) - (num_steps+1)*int(win_len)

	# print num_steps

	list_structures = []
	print "im here : def predict_structures(sequence)"
	#code segment to genrate predictions from one residue till the window size
	for i in range(int(step_val), int(win_len), int(step_val)):
		# print i
		segment = sequence[:i]
		react_segment = react_all[:i]
		print react_segment
		# print i*step_val, i*step_val + win_len
		create_react_file(react_segment, 'react_temp')
		file_in = open('test', 'w')
		file_in.write('>' + 'test' + '\n')
		file_in.write(segment)
		file_in.close()
		# norm_func_slider.py -m shape_custom -s Adenine_Riboswitch_aptamer.txt -f react.txt -n 100-150
		#os.popen("norm_func_slider.py -m shape_custom -s test -f react_temp")
		#cmd = "RNAfold -p -d2 --noLP --shape=%s --shapeMethod=D < %s > pred" % ('react_temp', 'test')
		#cmd = "RNAfold -p -d2 --noLP < %s > pred" % ('test')
		#os.popen(cmd)		
		#os.system('RNAfold -p -d2 --noLP < test > test.out')
		
		prediction_method()
		
		pred_structure = open('pred').read().strip().split('\n')[2].split()[0]
		print pred_structure
		list_structures.append(pred_structure + '-'*(len(sequence) - i) + '\n')

		os.system('rm test')
		os.system('rm test.out')

	#code segment to genrate predictions for each step of the window size
	for i in range(0, num_steps):
		# print i
		segment = sequence[i*int(step_val):i*int(step_val) + int(win_len)]
		# print i*step_val, i*step_val + win_len
		react_segment = react_all[i*int(step_val):i*int(step_val) + int(win_len)]
                print react_segment
                # print i*step_val, i*step_val + win_len
                create_react_file(react_segment, 'react_temp')

		file_in = open('test', 'w')
		file_in.write('>' + 'test' + '\n')
		file_in.write(segment)
		file_in.close()
		#os.popen("norm_func_slider.py -m shape_custom -s test -f react_temp")

		prediction_method()
		#cmd = "RNAfold -p -d2 --noLP --shape=%s --shapeMethod=D < %s > pred" % ('react_temp', 'test')
		#cmd = "RNAfold -p -d2 --noLP < %s > pred" % ('test')
                #os.popen(cmd)   


		pred_structure = open('pred').read().strip().split('\n')[2].split()[0]
		list_structures.append('-'*i*int(step_val) + pred_structure + '-'*(len(sequence) - int(win_len) - i*int(step_val)) + '\n')

		os.system('rm test')
		os.system('rm test.out')

	i = i*int(step_val)+1
	#code segment to genrate predictions after last possible window of the given size
	while i < len(sequence):

		# print i

		segment = sequence[i:len(sequence)]
		# print i*step_val + win_len, len(sequence)-1
		react_segment = react_all[i:len(sequence)]
                print react_segment
                # print i*step_val, i*step_val + win_len
                create_react_file(react_segment, 'react_temp')

		file_in = open('test', 'w')
		file_in.write('>' + 'test' + '\n')
		file_in.write(segment)
		file_in.close()
		
		prediction_method()
		#cmd = "RNAfold -p -d2 --noLP --shape=%s --shapeMethod=D < %s > pred" % ('react_temp', 'test')
		#cmd = "RNAfold -p -d2 --noLP < %s > pred" % ('test')

                #os.popen(cmd)   
		#os.popen("norm_func_slider.py -m shape_custom -s test -f react_temp")
		#os.system("RNAfold -p -d2 --noLP < test > test.out")

		pred_structure = open('pred').read().strip().split('\n')[2].split()[0]
		list_structures.append('-'*(i) + pred_structure + '\n')

		os.system('rm test')
		os.system('rm test.out')

		i += int(step_val)


	return list_structures

def prediction_method():
#    cmd = "RNAfold -p -d2 --noLP --shape=%s --shapeMethod=D < %s > pred" % ('react_temp', 'test')
    
    #cmd = "RNAfold -p -d2 --noLP < %s > pred" % ('test')
    
#    os.popen(cmd)


    cmd = "ShapeKnots " + 'test' + " " + "pred.ct"+" -sh " + 'react_temp'
    os.popen(cmd)

    cmd = "ct2dot " + "pred.ct" + " 1 " + "pred"
    os.popen(cmd)


def create_react_file(react, output_file):
  """
  Function to generate reactivity file as an input to RNAProbe, from a one-line csv file of reactivities.
  """
#  with open(input_file) as f:
#    react = f.readline().replace("NaN","-999").split(",")

  with open(output_file, "w") as f:
    for i in range(0,len(react)):
      if react[i] == "NaN":
      	react[i] = "-999"
      f.write(str(i+1) + " "+ str(react[i]) +"\n")
#      f.write(f"{i+1} {react[i]}\n")

  print output_file    



from Bio import SeqIO
records = SeqIO.parse(open(input_file, 'r'), "fasta")
print 'records', records

t0 = time()


      
for record in records:
	print record.id
	list_structures = predict_structures(str(record.seq))
	outfile = open('{}/{}_{}_{}.txt'.format(output_folder, record.id, win_len, step_val), 'w')
	outfile.write('>' + str(record.id) + '\n')
	outfile.write(str(record.seq) + '\n')
	for structure in list_structures:
		outfile.write(structure)
	outfile.close()
print time()-t0