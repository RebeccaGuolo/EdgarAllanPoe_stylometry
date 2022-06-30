# EdgarAllanPoe_stylometry
##This repository contains materiales that have been used in order to analyze 66 tales written by Edgar Allan Poe through *stylometry* with the aim to check if the results corresponded to the classification of these proposed by Wikipedia.  
  
Materiales are:  
- EAP_texts: folder containing all the tales taken into account  
- Corpora: folder containing the corpus of the texts, two .csv files with Nodes and Edges as preparation for the network with Gephi  
- Results: folder containing three .png files with the dendogram, the consensous tree and the network done by Gephi, a .html file with the network made through stylometry  
- Stylometry_script: script containing the commands that need to be run in R to make the analysis  
  
Firstly, texts' titles have been renamed according to Wikipedia's classfication; so texts that start with **"T_"** have been labled as Terror tales, with **"H_"** as Humoristic, with **"VT_"** as Various Themes and with **"R_"** as reasoning.  
After the creation of the corpus, preparations for the sylometric analysis have been arranged, like assignation of IDs, exclusion of too short texts and tokenization.  
The stylometric analysis has been carried out by the package *stylo*, which gave a dendogram, a consensus tree and a netwrok as results.  
In order to obtain a clearer result, *Gephi* has been employed.

