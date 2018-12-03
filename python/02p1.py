#!/usr/bin/env python

import sys

box_ids = [box_id.rstrip() for box_id in sys.stdin]
count = {2: 0, 3: 0}

for box_id in box_ids:
    char_freqs = {}
    for c in box_id:
        try:
            char_freqs[c] += 1
        except KeyError:
            char_freqs[c] = 1

    two_found = False
    three_found = False
    found = {2: False, 3: False}
    for key in char_freqs:
        val = char_freqs[key]
        if val == 2 or val == 3: found[val] = True
        if found[2] and found[3]: break

    for key in found:
        if found[key]: count[key] += 1

checksum = count[2] * count[3]
print checksum
