#!/bin/bash
source ./validate.sh
source ./output.sh
check_param_exists "$1"
check_not_number "$1"
print_param "$1"

