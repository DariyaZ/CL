#!/bin/bash
echo "WELCOME user!"
firstline=$(head -n1 source/changelog.md)
read -a splitfirstline <<< $firstline
version=${splitfirstline[1]}
echo "The version you are building is" $version
echo "Enter 1 to continue, 0 to exit"
read versioncontinue
if [ $versioncontinue -eq 1 ]
	then 
  	for files in source/* 
    do
    	echo $files
      if [ "$files" == "source/secretinfo.md" ]
        then 
          echo "It's not going to be copied" $files
        else 
          echo "It's going to be copied" $files
          cp $files build/
			fi
    done
    cd build/
    echo "In the build version $version there are files:" 
    ls
    cd ..
  else 
  	echo "Please come back when you are ready"
fi

