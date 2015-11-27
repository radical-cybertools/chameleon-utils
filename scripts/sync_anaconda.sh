#!/bin/bash

for i in `cat hosts`; do
    rsync -avh /opt/anaconda $i:/opt/
done
