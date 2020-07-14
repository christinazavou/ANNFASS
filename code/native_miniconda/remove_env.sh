#!/bin/sh

env_name=$1

# if miniconda is not in the path (e.g. because we dont want it to be the default python) then "conda" is not a recognized command
export PATH=/home/christina/miniconda3/bin/:$PATH

conda env remove -n $env_name
