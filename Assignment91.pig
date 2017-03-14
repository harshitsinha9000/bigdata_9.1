//1
petrol_dataset = LOAD 'Petrol_dataset.txt' using PigStorage(',') AS (id:chararray,name:chararray,buyrate:chararray,sellrate:chararray,volin:int,volout:int,year:int);

pd1 = GROUP petrol_dataset by name;

pd_final = FOREACH pd1 GENERATE petrol_dataset.id,GROUP,SUM(petrol_dataset.volout);

//2

petrol_dataset = LOAD 'Petrol_dataset.txt' using PigStorage(',') AS (id:chararray,name:chararray,buyrate:chararray,sellrate:chararray,volin:int,volout:int,year:int);

pd1 = LIMIT(ORDER petrol_dataset by volout DESC) 10;

pd_final = FOREACH pd1 GENERATE id,name,volout;

//3

petrol_dataset = LOAD 'Petrol_dataset.txt' using PigStorage(',') AS (id:chararray,name:chararray,buyrate:chararray,sellrate:chararray,volin:int,volout:int,year:int);

pd1 = FOREACH( FILTER petrol_dataset BY volin > volout) GENERATE year;

pd_final = LIMIT pd1 10;

//4

petrol_dataset = LOAD 'Petrol_dataset.txt' using PigStorage(',') AS (id:chararray,name:chararray,buyrate:chararray,sellrate:chararray,volin:int,volout:int,year:int);

pd1  = foreach petrol dataset GENERATE name,(buyrate/volin) as price_per_unit_purchase,(sellrate/volout) as price_per_unit_sold;
//but above data mismatch is occuring buyrate is in varchar and vol in int





