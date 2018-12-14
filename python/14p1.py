#!/usr/bin/env python

import __future__
import sys

recipes = [3, 7]
positions = [0, 1]
n = int(sys.stdin.readline().strip())
for i in range(n + 10):
    # generate recipes
    new_recipe = sum([recipes[p] for p in positions])
    if new_recipe > 9: recipes.append(1)
    recipes.append(new_recipe % 10)

    # move elves
    positions = [(p + recipes[p] + 1) % len(recipes) for p in positions]

recipes = [str(r) for r in recipes[n : n + 10]]
print ''.join(recipes)
