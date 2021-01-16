#!/bin/sh
cd /home/yao/Documents/1719genomes_Ssuis_used
for file in $(ls *)
do
    sed -i "s/>/>$file/g" $file
    echo $file "finished..."
done

