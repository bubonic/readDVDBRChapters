#!/bin/bash


if [ $# -lt 1 ]; then
        echo "Usage: $0 playlistfile chapterfilename"
        exit
fi

i=1
j2=01
playlistfile=$1
filename=$2
titlefile=`tsMuxeR $playlistfile 2>&1 | grep "Error:" | awk '{print $5}'`
echo "Creating symlink for titlefile:\t $titlefile"
ln -s ../STREAM/$titlefile $titlefile
IFS=' ' read -r -a CHAPTERS <<< `tsMuxeR $playlistfile | grep "Marks:" | tr -d "\n" | sed 's/Marks\: //g'`

for chapter in "${CHAPTERS[@]}"
do
        echo "Chapter $i: $chapter"
        let i++
done

echo -ne "Creating chapter data file...."
sleep 3
for chapter in "${CHAPTERS[@]}"
do
        echo "CHAPTER$j2=$chapter" >> $filename.txt
        echo "CHAPTER"$j2"NAME=Chapter $j2" >> $filename.txt
        j2=$(printf %02d $((10#$j2 + 1 )))

done
echo "DONE."
echo "Chapter data file: $filename.txt"
echo -ne "Would you like to give the chapters names? (y/n): "
read answer
if [ $answer = "n" ]; then
	exit
else
	k=1
	k2=01
	while [ $k -le $i ]; do
		echo -ne "Chapter $k title: "
		read chaptertit
		sed -i "s/Chapter $k2/$chaptertit/g" $filename.txt
		k2=$(printf %02d $((10#$k2 + 1 )))
		let k++
	done
fi
