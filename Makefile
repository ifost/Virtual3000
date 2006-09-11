# $Header: /home/cvs/Virtual3000/Makefile,v 1.1.1.1 2005/08/21 13:45:05 gregb Exp $

# Top-level makefile for virtual3000/virtual9000 project.

virt3000: cpu/registers.cmo cpu/instructions.cmo
	ocamlc cpu/registers.cmo cpu/instructions.cmo -o virt3000

# These next entries are a little bit wordy, still thinking about whether
# they will be partly auto-generated.

cpu/registers.cmo cpu/registers.cmi: cpu/registers.ml
	ocamlc -c cpu/registers.ml

cpu/instructions.cmo: cpu/instructions.ml cpu/registers.cmi
	ocamlc -c -I cpu cpu/instructions.ml
