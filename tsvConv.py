tsv = """
    0.0103    0.0103
    0.0528    0.0528
    0.0171    0.0171
    0.1344    0.1344
    0.1437    0.1437
    0.1301    0.1301
    0.1694    0.1694
    0.1645    0.1645
    0.1592    0.1592
    0.1672    0.1672
    0.1487    0.1487
    0.1994    0.1994
"""

filt = [realLine for realLine in  tsv.splitlines() if realLine]
ns = [5, 10, 20, 40, 80, 160, 500, 1000, 2000, 3000, 4000, 8000]
# ns = [5, 10, 50, 100, 200, 500, 1000, 10_000]

for n, line in zip(ns, filt):
    values = line.strip().split("    ")
    # print(f"\\hline {n:6} & {values[0]} & {values[1]} & {values[2]} \\\\")
    print(f"\\hline {n:6} & {values[0]} & {values[1]} \\\\")

