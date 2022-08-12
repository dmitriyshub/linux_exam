#!/bin/bash

function Log() {
    local calledFun=$1
    local status=$2
    echo "$(date +%d/%m/%y" "%T)" $calledFun $status >> recordFileName_log
    echo $status
}

function UpdateName() {
  local RECORD_NAME=$1
  local userinput=$2
  if sed -i "s/$RECORD_NAME/$userinput/g" "$filename"
  then
  Log $FUNCNAME Success
  else
    Log $FUNCNAME Failed
    fi
}