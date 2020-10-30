#!/bin/bash

echo "********************************************"
echo "----- XVSA_START.SH VERSION 2020-08-27 -----"
echo "********************************************"
echo "SCAN_TASK_ID: ${SCAN_TASK_ID}"
echo "SCAN_EXTRA_OPTIONS: ${SCAN_EXTRA_OPTIONS}"
echo "SCAN_EXTRA_JFE_OPTIONS: ${SCAN_EXTRA_JFE_OPTIONS}"
echo "SCAN_EXTRA_VARIABLE_OPTION: ${SCAN_EXTRA_VARIABLE_OPTION}"
echo "SCAN_EXTRA_SKIP_VTABLE_OPTION: ${SCAN_EXTRA_VTABLE_OPTION}"

mkdir -p ${SCAN_TASK_ID}.preprocess
if [ -f preprocess.tar.gz ]; then
    echo "[CMD] tar -zxf preprocess.tar.gz -C ${SCAN_TASK_ID}.preprocess"
    tar -zxf preprocess.tar.gz -C ${SCAN_TASK_ID}.preprocess
fi

echo "[CMD] xvsa_scan ${SCAN_TASK_ID}.preprocess"
xvsa_scan ${SCAN_TASK_ID}.preprocess

echo "[CMD] tar -zcf .scan_log.tar.gz .scan_log"
tar -zcf .scan_log.tar.gz .scan_log

echo "[CMD] mv scan_result.v ${SCAN_TASK_ID}.v"
mv scan_result/xvsa-xfa-dummy.v scan_result/${SCAN_TASK_ID}.v

echo "[CMD] tar -zcf scan_result.tar.gz scan_result"
tar -zcf scan_result.tar.gz scan_result

