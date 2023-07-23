#!/bin/python3

import numpy as np

def report(name, lst):
    print('======== {} ========'.format(name))
    print('avg = {}'.format(int(np.mean(lst))))
    print('std = {}'.format(int(np.std(lst))))
    print('var = {}'.format(int(np.var(lst))))
    print('min = {}'.format(min(lst)))
    print('max = {}'.format(max(lst)))

slab = [ int(i) for i in open('slab', 'r').readlines() ]
report('slab', slab)

sreclaimable = [ int(i) for i in open('sreclaimable', 'r').readlines() ]
report('sreclaimable', sreclaimable)

sunreclaim = [ int(i) for i in open('sunreclaim', 'r').readlines() ]
report('sunreclaim', sunreclaim)

