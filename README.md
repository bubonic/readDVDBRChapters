# readDVDBRChapters
Read Chapter Timestamps from DVD and BD rips and export to a mkvmerge compatible text file

# read_chapters2.sh

Requries lsdvd to be installed and timeadd.py to be installed at /usr/local/bin

Reads chapter timestamps from a DVDrip and exports chapter info to a text file for mkvmerge --chapters input. 

When prompted for number of chapters by the script, use one less than the number of chapters listed by the scripts output o/w it will cause an error.

Prompts user for adding chapter titles if you know them. 

## timeadd.py 

A little python script I wrote to add timestamps. 

## Usage

`./read_chapters2.sh filename titleno`

filname = chapter file you wish to write to
titleno = not necessary unless you are completely sure of the title no

WHen prompted for the title number after running the script and seeing the lsdvd ouput besure to inpur the titleno with a leading '0' unless it is 10 or above.

# bread_chapters.sh

Requires tsMuxeR to be installed. 

Reads chapter timestamps from a BLURAY rip and exports chapter info to a text file for later use in mkvmerge --chapters input.

Prompts user for adding chapter titles if you know them.


