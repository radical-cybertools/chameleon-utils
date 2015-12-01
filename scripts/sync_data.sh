#!/bin/bash

for i in `cat $HOME/hosts`; do
    ssh $i sudo mkdir /data
    ssh $i sudo chown -R cc /data
    rsync -avh /data $i:/
done
