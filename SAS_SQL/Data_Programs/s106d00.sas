*** s106d00 ***;

proc sql;
create table work.Team
   (ID num, Name char(5));
insert into work.Team
   values (13,'Anne')
   values (11,'Bob')
   values (21,'Chris')
   values (18,'Kim')
   values (19,'Kyle')
   values (20,'Mary')
   values (15,'Pam')
   values (17,'Pat')
   values (14,'Pete')
   values (16,'Sam')
   values (12,'Sue')
   values (11,'Bob');
create table work.Train_A
   (ID num, Name char (5), 
    Date date format=date9. 'Completion Date');
insert into work.Train_A
   values (11,'Bob','15Jun2012'd)
   values (16,'Sam','5Jun2012'd)
   values (14,'Pete','21Jun2012'd)
   values (21,'Chris','7Jun2012'd)
   values (18,'Kim','4Jun2012'd)
   values (17,'Pat','22Jun2012'd)
   values (20,'Mary','11Jun2012'd)
   values (12,'Sue','6Jun2012'd)
   values (87,'Ted','5Jun2012'd)
   values (91,'Rand','7Jun2012'd);
create table work.Train_B
   (Name char (5),ID num, 
    SDate date format=date9. 'Start Date',
    EDate date format=date9. 'End Date');
insert into work.Train_B
   values ('Bob',11,'9Jul2012'd,'13Jul2012'd)
   values ('Pam',15,'25Jul2012'd,'27Jul2012'd)
   values ('Kyle',19,'12Jul2012'd,'20Jul2012'd)
   values ('Chris',21,'29Jul2012'd,.)
   values ('Kim',18,'12Jul2012'd,.)   
   values ('Ted',87,'9Jul2012'd,'13Jul2012'd)
   values ('Rand',91,'9Jul2012'd,.);
quit;


