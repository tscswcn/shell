#!/bin/bash
echo "准备倒数5秒："
for i in $(seq 5 -1 1)
do
    echo -en "$i";sleep 1
done
echo -e "开始"
