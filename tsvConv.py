import re

tsv = """
    0.0000    0.0001
    0.0000    0.0001
    0.0000    0.0005
    0.0001    0.0006
    0.0002    0.0014
    0.0008    0.0047
    0.0099    0.0333
    0.0634    0.1249
    0.5455    0.9475
    1.7196    2.9650
    4.3831    5.9861
"""

filt = [realLine for realLine in  tsv.splitlines() if realLine]
ns = [5, 10, 20, 40, 80, 160, 500, 1000, 2000, 3000, 4000]
# ns = [5, 10, 50, 100, 200, 500, 1000, 10_000]

for n, line in zip(ns, filt):
    values = re.split(r"\s+", line.strip())
    # values = line.strip().split("    ")
    # print(f"\\hline {n:6} & {values[0]} & {values[1]} \\\\")
    # print(f"\\hline {n:6} & {values[0]} & {values[1]} & {values[2]} \\\\")
    # print(f"\\hline {n:6} & {values[0]} & {values[1]} & {values[2]} & {values[3]} \\\\")

    print(f"\\hline {n:6} & " + " & ".join(map(str, values)) + " \\\\")

