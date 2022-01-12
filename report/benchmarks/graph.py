#!/usr/bin/env python3

from pathlib import Path
import pandas as pd
import plotly.express as px


df = pd.read_csv("results.csv")
baseline_mean = df[df["solver"] == "smt-z3-opt"].groupby("name")["time"].mean().to_dict()

def difference(row):
    relative_time = row["time"] / baseline_mean[row["name"]]
    return relative_time

df["change"] = df.apply(difference, axis=1)

fig = px.box(df.sort_values("name"), y="change", x="name", color="solver", points="all", hover_data=df.columns)
fig.update_layout({
    "title": "Benchmark runtimes relative to baseline median. Lower is better.",
    "xaxis": {"title": "Benchmark" },
    "yaxis": {"tickformat": ",~%", "title": "Time relative to baseline median" }
})

fig.write_html("results.html")
fig.write_img("results.png")