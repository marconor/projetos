#!/usr/bin/env python
# coding: utf-8

# In[ ]:


import pandas as pd
import os
import json
import sys

origem = open("c:\datasprint\data-sample_data-nyctaxi-trips-2012-json_corrigido.json", "r")
destino = open("c:\datasprint\ok.json", "w")


# Ler e transformar em JSON de verdade

# Inserir primeira linha [
destino.write("[")
destino.write("\n")

# Transformar linhas
for lines in origem:
    destino.write(lines + ",")
    destino.write("\n")
destino.close()

readFile = open("c:\datasprint\ok.json")

lines = readFile.readlines()

readFile.close()
w = open("c:\datasprint\ok.json",'w')
w.writelines([item for item in lines[:-1]])
w.write("]")
w.close()

