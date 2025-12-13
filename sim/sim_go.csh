#!/bin/csh
#******************************************************************************
# File        : sim_go.csh (Simulate grouped operation)
# Author      : hungdang110520@gmail.com
#******************************************************************************
# Date        Versions  Decription  
#-----------  --------  -------------------------------------------------------
# 2025/12/12  00.01     First release 
#******************************************************************************

# Get argument 
if ($#argv < 2) then
    echo "Error: Need at least 2 arguments."
    echo "Usage: <Chapter number> <Example name> (Ex: csh sim_go.csh chap1 1)"
    exit 1
endif

set CHAPTER  = "$1"
set EXAMPLE  = "$2"
set CHAP_NUM = `echo $CHAPTER | sed 's/[^0-9]//g'`
set TESTNAME = "example${CHAP_NUM}_${EXAMPLE}"

# =========================================================================
# ==                   Vivado Simulator (xvlog/xelab/xsim)               ==
# =========================================================================

# Make sure to source the Vivado settings script first
# For example: source /opt/Xilinx/Vivado/2024.2/settings64.csh

set ROOT_DIR = `dirname $0`/..

mkdir -p "$ROOT_DIR/log/$CHAPTER/$TESTNAME/"
mkdir -p "$ROOT_DIR/rep/$CHAPTER/$TESTNAME/"

echo ""
echo "********************************************************"
printf "SystemVerilog Example Run SIM - Vivado Simulator\n"
printf "Chapter     : %-35s \n" "$CHAPTER"
printf "Test pattern: %-35s \n" "$TESTNAME"
echo "********************************************************"
echo ""

#==============================================================================
# For chapter1
#==============================================================================

echo "--------------------------------------------------"
echo "----             Compile source               ----"
echo "--------------------------------------------------"

xvlog -sv -f ${CHAPTER}_files.list --log xvlog_$TESTNAME.log

if ($status != 0) then
  echo ""
  echo "##### Compile error   #####"
  exit 1
endif

echo "--------------------------------------------------"
echo "----             Elaborate source             ----"
echo "--------------------------------------------------"

xelab $TESTNAME --log xelab_$TESTNAME.log

if ($status != 0) then
  echo ""
  echo "##### Elaborate error   #####"
  exit 1
endif


echo "--------------------------------------------------"
echo "----              Simulation start            ----"
echo "--------------------------------------------------"

xsim $TESTNAME -R --log xsim_$TESTNAME.log

if ($status != 0) then
  echo ""
  echo "##### Simulation error   #####"
  echo "Check log: $ROOT_DIR/log/$CHAPTER/$TESTNAME/xsim_$TESTNAME.log"
  exit 1
endif

mv *.log $ROOT_DIR/log/$CHAPTER/$TESTNAME/

