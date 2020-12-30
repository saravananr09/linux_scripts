#!/bin/bash 

select filenames in $mysql_path/*;
do
		echo "You selected $filenames ($REPLY)"
			break;
		done

