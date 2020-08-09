#!/bin/bash
RED='\033[0;31m'
NC='\033[0m' # No Color
acpi | grep -o [0-9]*%
