#!/usr/bin/env python

import sys

claims = [claim.rstrip() for claim in sys.stdin]
SQUARE_WIDTH = 1000
patches = [[0 for x in range(SQUARE_WIDTH)] for y in range(SQUARE_WIDTH)]
for claim in claims:
    claim_els = claim.split(" @ ")
    claim_spec = claim_els[1]
    spec_geo_els = claim_spec.split(": ")
    start_coord = spec_geo_els[0]
    area = spec_geo_els[1]
    start_coord_els = start_coord.split(",")
    start_x = int(start_coord_els[0]) or 0
    start_y = int(start_coord_els[1]) or 0
    area_els = area.split("x")
    end_x = int(start_x) + (int(area_els[0]) or 0)
    end_y = int(start_y) + (int(area_els[1]) or 0)

    for y in range(start_y, end_y):
        for x in range(start_x, end_x):
            patches[y][x] += 1

multiple_claim_count = 0
for cols in patches:
    for c in cols:
        if c > 1: multiple_claim_count += 1

print(multiple_claim_count)
