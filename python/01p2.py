#!/usr/bin/env python

import sys

sum = 0
second = sum
ds = []
seen_freq = {}
second_found = False
for d in sys.stdin: ds.append(int(d))
while not second_found:
    for d in ds:
        sum += d
        if sum in seen_freq:
            second = sum
            second_found = True
            break
        else:
            seen_freq[sum] = True
print second
