#!/bin/bash


if [ $# -lt 1 ]; then
        echo "Usage: $0 filename title_no"
        exit
fi

i=1
j2=01
filename=$1
echo "Using lsdvd to load chapter info:"
lsdvd -c ./
if [ -z "$2" ]; then
	echo -ne "What title number do you want to create chapter info for: "
	read title
	echo -ne "How many chapters: "
	read nochapters
else
	title=$2
fi

IFS=$'\n' read -r -a CHAPTERSTMP <<< `lsdvd -c ./ | grep -A $nochapters "Title: $title" | sed -e '1d' | grep -oE "[0-9][0-9]:[0-9][0-9]:[0-9][0-9].[0-9][0-9][0-9]"`
echo $CHAPTERSTMP
j=0
read -a CHAPTERS <<< $CHAPTERSTMP
CHAPTERS=("00:00:00.000" "${CHAPTERS[@]}")
for chapter in "${CHAPTERS[@]}"
do
	if [ $i == 1 ]; then
        	echo "Chapter $i: $chapter"
	else
		chapter=`/usr/local/bin/timeadd.py $chapter_old $chapter`
		echo "Chapter $i: $chapter"
	fi
        let i++
	chapter_old=$chapter
	CHAPTERSNEW[$j]=$chapter
	let j++
done

echo -ne "Creating chapter data file...."
sleep 3
for chapter in "${CHAPTERSNEW[@]}"
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
	while [ $k -le $nochapters ]; do
		echo -ne "Chapter $k title: "
		read chaptertit
		sed -i "s/Chapter $k2/$chaptertit/g" $filename.txt
		k2=$(printf %02d $((10#$k2 + 1 )))
		let k++
	done
fi
