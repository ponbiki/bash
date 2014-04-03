#!/bin/bash

search_dir="/media/d/OS/DownloadsNew"
move_dir="/media/d/OS/Music"

echo -e "Do you want to organize your new downloads? (y to continue)"
read response

if [ $response == "y" ]
	then
		echo "Oh man this is going to end badly..."
		find $search_dir -iname "*.mp3" -type f -print0 | xargs -0 -I '{}' /bin/mv "{}" $move_dir
		find $search_dir -iname "*.flac" -type f -print0 | xargs -0 -I '{}' /bin/mv "{}" $move_dir
		find $search_dir -iname "*.m4a" -type f -print0 | xargs -0 -I '{}' /bin/mv "{}" $move_dir
		echo "Complete?"
	else
		echo "I did not want to do any work anyhow"
		exit
fi
