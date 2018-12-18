*** s107d00 ***;

proc sql;
create table work.one
   (X num format=1.,A CHAR(1));
   insert into work.one
      values(1,'a')
	  values(4,'d')
	  values(2,'b');
create table work.two
   (X num format=1.,B CHAR(1));
   insert into work.two
     values(2,'x')
     values(3,'y')
	 values(5,'v');
create table work.three
   (X num format=1.,B CHAR(2));
   insert into work.three
     values(1,'a1')
	 values(1,'a2')
	 values(2,'b1')
	 values(2,'b2')
	 values(4,'d');
create table work.four
   (X num format=1.,B CHAR(2));
   insert into work.four
	 values(2,'x1')
	 values(2,'x2')
	 values(3,'y')
	 values(5,'v');
quit;
