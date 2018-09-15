# readDVDBRChapters
Read Chapter Timestamps from DVD and BD rips and export to a mkvmerge compatible text file

# read_chapters2.sh

Requries lsdvd to be installed and timeadd.py to be installed at /usr/local/bin

Reads chapter timestamps from a DVDrip and exports chapter info to a text file for mkvmerge --chapters input. 

When prompted for number of chapters by the script, use one less than the number of chapters listed by the scripts output o/w it will cause an error.

## timeadd.py 

A little python script I wrote to add timestamps. 

Prompts user for adding chapter titles if you know them. 

# bread_chapters.sh

Requires tsMuxeR to be installed. 

Reads chapter timestamps from a BLURAY rip and exports cahpter info to a text file for later use in mkvmerge --chapters input.

Prompts user for adding chapter titles if you know them.


