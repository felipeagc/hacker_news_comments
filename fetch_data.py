#!/usr/bin/env python

import polars as pl
import os

root_dir = os.path.dirname(os.path.realpath(__file__))
raw_output = f"{root_dir}/data/hacker_news_raw.parquet"

if not os.path.exists(raw_output):
    df = pl.read_csv('hf://datasets/Linkseed/hacker_news_with_comments/train.csv')
    df.write_parquet(raw_output)
