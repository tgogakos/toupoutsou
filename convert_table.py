#!/usr/bin/python
import pandas as pd
import numpy as np

d = pd.read_csv('./figures/gogakos_tuschl_S5.csv')
print d.to_latex(index = False)


