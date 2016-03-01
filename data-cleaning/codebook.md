1. I download and extarct the data files in data directory. Then I use read.table to read 
Read the Train data, subject and train target and create a variable called x

 
 
2. Then I read the Testdata, subject and test target and create a variable called testdata



3. Then I combined train and test data

 
4. after that I read the column names from features.txt

5. replacing -mean by Mean and -std by Std by using gsub and I also remove  -() 

6. I search for column name Mean and Std

7. Then I get index of the corresponding column name and adding 562 for subject and 563 for activity



8. After that I remove the column name does not have Std or Mean

9. After that I rename the column of combined data

10. I replace the numeric data in activity column by alphanumeric label


11. creating tidy data by grouping into activity and subject by using aggregate function

12. I remove activity and subject column 
13. finally I write down the data into tidy_data.txt file
