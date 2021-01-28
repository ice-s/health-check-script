#!/bin/bash

RAM=$(free -m | awk 'NR==2{printf "%.2f", $3*100/$2 }')
CPU=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage}')
if [ $RAM >= 80 || $CPU > 80 ]; then
  echo "Server warning"
else 
  echo "Server OK"
fi
