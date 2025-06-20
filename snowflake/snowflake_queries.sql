# 1 Created a copy of the original POWER_DATASET as agriculture to perform analysis without affecting the source data.

        create table agriculture as
        select * from POWER_DATASET

 
# 2. Renamed the column "YEILDS" to "YIELDS" to correct the spelling for accurate reference and consistency in analysis.


        alter table agriculture
        rename column "YEILDS" TO "YIELDS";


# 3. A new column PROFIT was added to the agriculture table to calculate the total profit for each record.

        alter table agriculture ADD COLUMN PROFIT NUMBER;

        UPDATE agriculture
        SET PROFIT = price * yeilds

# 4. Rainfall Increased by 10%, Area Reduced by 10%

    update agriculture
    set rainfall=1.1 * rainfall;

    update agriculture
    set area=0.9 * area;

# 5. A new column Year_Group was created to categorize the Year column into three custom groups for easier time-based analysis:
 Y1 → Years from 2004 to 2009,
 Y2 → Years from 2010 to 2015
 Y3 → Years from 2016 to 2019


        alter table agriculture add Year_group string;

        update agriculture
        set Year_group='Y1'
        where year>=2004 and year<=2009;

        update agriculture
        set Year_group='Y2'
        where year>=2010 and year<=2015;

        update agriculture
        set Year_group='Y3'
        where year>=2016 and year<=2019;


# 6.Created a new column rainfall_groups to classify rainfall into categories:
Low → 255 to 1199 mm
Medium → 1200 to 2799 mm
High → 2800 mm and above
This grouping enables better comparison of crop patterns under different rainfall levels.
     


            alter table agriculture
            add rainfall_groups string;

            //1st Update
            update agriculture
            set rainfall_groups = 'Low'
            where rainfall>=255 and rainfall<1200

            //2nd update
            update agriculture
            set rainfall_groups = 'Medium'
            where rainfall >=1200 and rainfall<2800


            //3rd update
            update agriculture
            set rainfall_groups='High'
            where rainfall >=2800