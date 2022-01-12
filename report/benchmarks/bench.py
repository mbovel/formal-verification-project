#!/usr/bin/env python3

import os
import time
from pathlib import Path

CMD = "../../../stainless/frontends/scalac/target/universal/stage/bin/stainless-scalac --vc-cache=false --no-colors "
RESULTS = "results.csv"


with open(RESULTS, "w") as myfile:
    myfile.write("name,solver,time\n")


for src in [
    "../examples/01_addition_ge10.scala",
    "../examples/02_subtraction_commutativity.scala",
    "../examples/04_adt.scala"
]:
    for i in range(0,6):
        for solver in ["smt-z3-opt", "smt-z3-min"]:
            start = time.time()
            command = CMD + f" --solvers={solver} " + src
            print("Running: " + command)
            os.system(command)
            end = time.time()
            with open(RESULTS, "a") as myfile:
                line = f'{Path(src).stem},{solver},{end - start:.2f}\n'
                print(line)
                myfile.write(line)


