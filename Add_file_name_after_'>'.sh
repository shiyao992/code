#!/bin/sh
cd /home/yao/your_files/
for file in $(ls *)
do
    sed -i "s/>/>$file/g" $file
    echo $file "finished..."
done

