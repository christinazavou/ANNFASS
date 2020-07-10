#!/bin/sh

env_name=$1

conda env remove -n $env_name
