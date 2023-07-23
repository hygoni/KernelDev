#!/bin/bash

if [ "$#" -ne 1 ]; then
	echo "filename is mandatory"
	return 1
fi

cat $1 | grep Slab | awk '{print $(NF-1)}' > slab
cat $1 | grep SReclaimable | awk '{print $(NF-1)}' > sreclaimable
cat $1 | grep SUnreclaim | awk '{print $(NF-1)}' > sunreclaim
python proc-meminfo-stat.py

