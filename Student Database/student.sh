#Clear To Show Contents Everytime At Top of Terminal
clear
while [ 1 ]
do
 echo 1.Create 2.Dispaly 3.INsert 4.Search 5.Modify 6.Delete 7.Exit
 #\c To Enter Character On the Same Line(Used For Character)
 echo "Enter Choice==>\c"
 read ch

 case $ch in

1)
	echo "Enter File Name:"
	read fname
 # -e to check file exists or Not
	if [ -e $fname ]
	  then
		  echo "File Already Exists"
	else
 # >> Is a output Operator used to append data in existing File
 # > Is also output Operator to Append Data but also deleting  Previously Data
	  >> $fname
	 echo "File Created SuccesFully"
	fi
;;
2)
	echo "Enter File Name==>"
	read fname
	if [ -e $fname ]
	then
		echo "Contents of File==>"
 #Sort with sort the data , -n tells that sort data according to the nueric data present in file(HERE Roll NUmber)
		sort -n $fname
	else
		echo "File Not Exists"
	fi
;;

3)
	echo "Enter the File Name==>"
	read fname
	if [ -e $fname ]
	then
 # -n To enter data on Same Line
		echo -n "Enter the roll Number==>"
		read roll
 # grepm is used for pattern matching(roll in particular file)
 #To insert 17(-w will bind the number 1 and 7 pitherwise it will search for 1 and 7 separety and displaty the result)
		
 		grep -w "$roll" $fname
 #When a command is executed succesfully then it returns 0 otherwise 1	
		ans=$?
		echo answer=$ans

		if [ $ans -eq 0 ]
		then
			echo "Record Already Exists"
		else
			echo -n "Enter Name==>"
			read name
 #Insert the data in a particular file using >>
			echo $roll $name >> $fname
			echo "Record INserted Succesfully"
		fi
		else
		echo "File Not Exists"
        fi
  ;;
4)
	 echo "Enter the File Name==>"
        read fname
        if [ -e $fname ]
        then
 # -n To enter data on Same Line
                echo -n "Enter the roll Number==>"
                read roll
 # grepm is used for pattern matching(roll in particular file)
 #To insert 17(-w will bind the number 1 and 7 pitherwise it will search for 1 and 7 separety and displaty the result)

                grep -w "$roll" $fname
 #When a command is executed succesfully then it returns 0 otherwise 1  
                ans=$?
                echo answer=$ans

                if [ $ans -eq 0 ]
                then

                        echo "Record  Exists"
       		 else
                echo "File Not Exists"
               fi
	 else
		 echo "File Not Exists"
	fi
 ;;
5)
    echo "Enter the File Name==>"
        read fname
        if [ -e $fname ]
        then
 # -n To enter data on Same Line
                echo -n "Enter the roll Number==>"
                read roll
 # grepm is used for pattern matching(roll in particular file)
 #To insert 17(-w will bind the number 1 and 7 pitherwise it will search for 1 and 7 separety and displaty the result)

                grep -w "$roll" $fname
 #When a command is executed succesfully then it returns 0 otherwise 1  
                ans=$?
                echo answer=$ans

                if [ $ans -eq 0 ]
                then
		 echo -n "Enter NewRoll and NewName==>"
		 read nroll nname
		 grep -w "$nroll" $fname
		 ans=$?
		if [ $ans -eq 0 ]
		then
			echo REcord already present.PLease try another roll number
		else
# -v means it will show all the details excludig the details specified
# >> To ouput in the file
			grep -v "$roll" $fname >> temp
			echo "$nroll $nname" >> temp
# rm to delete the file 
			rm $fname
#cp command to copy the contents of temp to a file
			cp temp $fname
#Copied Content of abcd to temp,deleted abcd file,copied temp content to abcd,deleted temp file
			rm temp
			echo "Record Succesfully MOdified"
		fi
	else
	  echo "Record Not Present"
  	fi
         else
	  echo "File Not Exists"
	fi
	;;
6)
	 echo "Enter the File Name==>"
        read fname
        if [ -e $fname ]
        then
 # -n To enter data on Same Line
                echo -n "Enter the roll Number==>"
                read roll
 # grepm is used for pattern matching(roll in particular file)
 #To insert 17(-w will bind the number 1 and 7 pitherwise it will search for 1 and 7 separety and displaty the result)

                grep -w "$roll" $fname
 #When a command is executed succesfully then it returns 0 otherwise 1  
                ans=$?
                echo answer=$ans

                if [ $ans -eq 0 ]
                then
		 grep -v "$roll" $fname >> temp
	 	 rm $fname
		 cp temp $fname
		 rm temp
		echo "Record Succesfully Deleted"
               else
       		 echo "Record doesnt Found"
	       fi
	else
 	 echo "File NOt Exists"
	fi
	;;
7) exit
	;;
8)
#When Valid Choice Is Not Entered
 	echo "Enter a valid option"
	;;
esac
done







#Output
.Create 2.Dispaly 3.INsert 4.Search 5.Modify 6.Delete 7.Exit
Enter Choice==>1
Enter File Name:
abcd
File Already Exists
1.Create 2.Dispaly 3.INsert 4.Search 5.Modify 6.Delete 7.Exit
Enter Choice==>3
Enter the File Name==>
abcd
Enter the roll Number==>69
answer=1
Enter Name==>chetan
Record INserted Succesfully
1.Create 2.Dispaly 3.INsert 4.Search 5.Modify 6.Delete 7.Exit
Enter Choice==>3
Enter the File Name==>
abcd
Enter the roll Number==>70
answer=1
Enter Name==>taj
Record INserted Succesfully
1.Create 2.Dispaly 3.INsert 4.Search 5.Modify 6.Delete 7.Exit
Enter Choice==>3
Enter the File Name==>
abcd
Enter the roll Number==>71
71 Prathamesh
answer=0
Record Already Exists
1.Create 2.Dispaly 3.INsert 4.Search 5.Modify 6.Delete 7.Exit
Enter Choice==>2         
Enter File Name==>
abcd
Contents of File==>
69 chetan
70 taj
71 Prathamesh
80 Pranav
82 shreyas
1.Create 2.Dispaly 3.INsert 4.Search 5.Modify 6.Delete 7.Exit
Enter Choice==>1
Enter File Name:
TYITB    
File Created SuccesFully
1.Create 2.Dispaly 3.INsert 4.Search 5.Modify 6.Delete 7.Exit
Enter Choice==>3
Enter the File Name==>
TYITB
Enter the roll Number==>69
answer=1
Enter Name==>Chetan
Record INserted Succesfully
1.Create 2.Dispaly 3.INsert 4.Search 5.Modify 6.Delete 7.Exit
Enter Choice==>3
Enter the File Name==>
TYITB
Enter the roll Number==>70
answer=1
Enter Name==>Taj
Record INserted Succesfully
1.Create 2.Dispaly 3.INsert 4.Search 5.Modify 6.Delete 7.Exit
Enter Choice==>3
Enter the File Name==>
TYITB
Enter the roll Number==>71
answer=1
Enter Name==>Prathamesh
Record INserted Succesfully
1.Create 2.Dispaly 3.INsert 4.Search 5.Modify 6.Delete 7.Exit
Enter Choice==>3
Enter the File Name==>
TYITB
Enter the roll Number==>80
answer=1
Enter Name==>Pranav
Record INserted Succesfully
1.Create 2.Dispaly 3.INsert 4.Search 5.Modify 6.Delete 7.Exit
Enter Choice==>2
Enter File Name==>
TYITB
Contents of File==>
69 Chetan
70 Taj
71 Prathamesh
80 Pranav
1.Create 2.Dispaly 3.INsert 4.Search 5.Modify 6.Delete 7.Exit
Enter Choice==>4
Enter the File Name==>
TYITB
Enter the roll Number==>71
71 Prathamesh
answer=0
Record  Exists
1.Create 2.Dispaly 3.INsert 4.Search 5.Modify 6.Delete 7.Exit
Enter Choice==>5
Enter the File Name==>
TYITB
Enter the roll Number==>69
69 Chetan
answer=0
Enter NewRoll and NewName==>90 Suhail
Record Succesfully MOdified
1.Create 2.Dispaly 3.INsert 4.Search 5.Modify 6.Delete 7.Exit
Enter Choice==>2
Enter File Name==>
TYITB
Contents of File==>
70 Taj
71 Prathamesh
80 Pranav
90 Suhail
1.Create 2.Dispaly 3.INsert 4.Search 5.Modify 6.Delete 7.Exit
Enter Choice==>6
Enter the File Name==>
TYITB
Enter the roll Number==>90
90 Suhail
answer=0
Record Succesfully Deleted
1.Create 2.Dispaly 3.INsert 4.Search 5.Modify 6.Delete 7.Exit
Enter Choice==>2
Enter File Name==>
TYITB
Contents of File==>
70 Taj
71 Prathamesh
80 Pranav
1.Create 2.Dispaly 3.INsert 4.Search 5.Modify 6.Delete 7.Exit
Enter Choice==>7
osl18@osl18:~/TYITB80$ 

