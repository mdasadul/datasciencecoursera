1. I download and extarct the data files in data directory. Then I use read.table to read 
Read the Train data, subject and train target and create a variable called x 

 
 
2. Then I read the Testdata, subject and test target and create a variable called testdata



3. Then I combined train and test data in a variable called combined

 
4. after that I read the column names from features.txt and create a file called colname

5. replacing -mean by Mean and -std by Std by using gsub and I also remove  -() and I update the colname varibale

6. I search for column name Mean and Std in colname variable and assign it to variable called name

7. Then I get index of the corresponding column name and adding 562 for subject and 563 for activity in a variable called colnumber

8. After that I remove the column name does not have Std or Mean and assign the data in combined_data variable

9. After that I rename the column of combined_data

10. I replace the numeric data in activity column by alphanumeric label


11. creating tidy data by grouping into activity and subject by using ddply function

12. finally I write down the data into tidy_data.txt file
