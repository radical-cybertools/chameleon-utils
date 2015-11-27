#!/bin/bash

ps -elf | grep python3 | awk '{print $4}' | xargs kill -9 
ps -elf | grep node | awk '{print $4}' | xargs kill -9

