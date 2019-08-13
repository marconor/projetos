#!/usr/bin/env python
# coding: utf-8

# In[ ]:


import pandas as pd
import os
import json
import sys
export_csv = open("c:\datasprint\export2012.csv", "w")
df = pd.read_json("c:\datasprint\ok.json")
export_csv = df.to_csv ('c:\datasprint\export2012.csv', index = None, header=True)

