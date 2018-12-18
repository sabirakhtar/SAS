/***************************************************************************
To produce the SiteCheck report:
1. Modify the value for PathToClassData to reflect the actual location 
of the SAS data for the class at your site.
2. Submit this program
3. When the program finishes, please look in the data location you 
specified for a file named "SiteCheck.pdf".  Email this file you your
SAS Institute contact for this class.
***************************************************************************/

/*Example: %let PathToClassData=s:\workshop;*/
%let PathToClassData=;

/*Example:%let ReportFileName=Sitecheck.pdf;*/
%let ReportFileName=;

%macro SiteCheck(datapath,reportfile);
   /***************************************************************************
    Created by Mark Jordan - http://go.sas.com/jedi
    August 13, 2012
       This macro is intended to check the class data installation and 
       SAS system components required for SAS Foundation Programming classes.  
       To see syntax help in the SAS log, submit: 
          %SiteCheck(!HELP) 
       
    August 17, 2012 - Mark Jordan
       Updated the macro to test for Enterprise Gide, and to detect mode
       of submission while running the report

    August 22, 2012 - Mark Jordan
       Improved report organization.  Included code to restore system options
       to original settings after report execution.

   August 31, 2012 - Mark Jordan
       Added section to gathers information on which products are actually 
       installed vs. licensed.

   ***************************************************************************/
   %local DATALOC _RPTLOC Version ThisOS _EG NeedACCPCFF _SASSPLEVEL sasver 
      /* Product license info */
   GRAPH_lic STAT_lic ACCPCFF_lic EG_lic EM_lic TM_lic CRS_lic HPF_lic
      /* Product installed info */
   GRAPH_inst STAT_inst ACCPCFF_inst EG_inst EG_Ver EM_inst EM_ver TM_inst TM_ver 
   CRS_inst HPF_inst
   /* Other info */
   NumFiles ThisType EXT PCFileServer PreText RC DID
   ;
   %let DATALOC=SASFILES;
   %Let Version=1.1;
   %let _EG=0;
    
      %put _local_;
   /* Begin parameter validation and documentation */
   %if %qupcase(%SUPERQ(datapath))=!HELP 
      %then %do;
      %PUT NOTE:  *&SYSMACRONAME V&Version MACRO Documentation ***************************;
      %PUT NOTE-  This macro tests SAS configuration and class data instalation;
      %PUT NOTE-  in preparation for delivering SAS Foundation programming classes.;
      %PUT NOTE-       ***** Runs on Windows, UNIX or LINUX systems only *****;
      %PUT NOTE-;
      %PUT NOTE-  SYNTAX: %NRSTR(%%SiteCheck%(DataPath,ReportFile%));
      %PUT NOTE-     DataPath:    Optional: Fully qualified path to SAS data for this class;
      %PUT NOTE-                  If not specified, default is:;
      %PUT NOTE-                     Windows Interactive: S:\Workshop;
      %PUT NOTE-                     UNIX/LINUX Interactive: ~/workshop;
      %PUT NOTE-                     Any Batch: Location of SiteCheck.sas program file;
      %PUT NOTE-     ReportFile:  Optional: Name of report file - (PDF or RTF only);
      %PUT NOTE-                  Report is saved to the DataPath location.;
      %PUT NOTE-                  If not specified, default is: SiteCheck.pdf;
      %PUT;
      %PUT NOTE-  Example:;
      %PUT NOTE-  Windows: %NRSTR(%%SiteCheck%(S:\Workshop,Sitecheck.PDF%));
      %PUT NOTE-  Unix:    %NRSTR(%%SiteCheck%(~/workshop,Sitecheck.RTF%));
      %PUT;
      %PUT NOTE-  *************************************************************;
      %Goto OuttaHere;
   %end;

   OPTIONS FORMCHAR="|----|+|---+=|-/\<>*" MPRINT;
   options formdlim='-' nosyntaxcheck nostimer;

   /* Under DMS on SAS9.3+, use LISTING to avoid remote/help browser issues */
   %if &SYSVER >= 9.3 and %substr(&SYSPROCESSNAME,1,3) = DMS %then %do;
      ods graphics off;
      ods html close;
      ods listing;
   %end;

   /* Detect Operating System */
   %let slsh = %str(/);
   %let xcmd = %sysfunc(getoption(xcmd));
   %if %qscan(&SYSSCP,1)=WIN %then %do;
      options noxwait xsync;
      %let ThisOS=WIN;
      %let slsh = %str(\);
   %end;
   %else %if %INDEX(*HP*SUN*AIX*,*%qscan(&SYSSCP,1)*) or %qsubstr(&SYSSCP,1,3)=LIN %then %do;
      %let ThisOS=UNIX;
   %end;
   %else %do;
      %PUT ERROR: This SAS session is executing under &SYSSCP,;
      %PUT ERROR- but this macro only works on Windows, UNIX and LINUX.;
      %Goto OuttaHere;
   %end;

   ** get location of SAS installation:  **;
   %let sasroot = %sysget(SASROOT);

   ** get SASHOME level for applications and such **;
   %let sashome = &sasroot;

   %do %until(("&SYSVLONG" < "9.02") or (%sysfunc(fileexist(&sashome.&slsh.deploymntreg))));
      %let sashome = %sysfunc(reverse(%bquote(&sashome)));
      %let upone = %index(%bquote(&sashome),&slsh);
      %let sashome = %substr(%bquote(&sashome),&upone+1);
      %let sashome = %sysfunc(reverse(%bquote(&sashome)));
   %end;

   ** get machine name: **;
   %if &SYSSCP = WIN %then
      %let machine = %sysget(COMPUTERNAME);
   %else %if &XCMD = XCMD %then %do;
      filename host pipe 'hostname';

      data _null_;
         infile host;
         input;
         call symput('MACHINE',trim(_infile_));
         stop;
      run;

      filename host;
   %end;
   %else %let machine = UNKNOWN;

   * Set SASVER macro variable now in case runstatus changes it:;
   %let sasver = &sysver;
   %if "&SYSVLONG" > "9.02.01" %then %do;

      ***********************************************************************;
      * This code determines what is installed by reading the Registry.jnl  *;
      * file in a SAS 9.2+ environment. This covers products, most clients, *;
      * solutions, and hot fixes for all.                                   *;
      ***********************************************************************;
      data components;
         length component $ 64 custver $ 16 compid $ 16;
         label component = 'COMPONENT ----------------------------------------';
         infile "&sashome.&slsh.deploymntreg&slsh.registry.jnl";
         drop inname;  /* common to many */
         input;
         inname=index(_infile_,' name="');
         if index(_infile_,'"sashome"') then do;
            call symput('sashome',scan(substr(_infile_,inname),2,'"'));
            return;
         end;
         if index(_infile_,'CONFIG/Configuration001') then do;
            call symput('configloc',scan(substr(_infile_,inname),2,'"'));
            return;
         end;
         if index(_infile_,'install_user') then do;
            call symput('installer',scan(substr(_infile_,inname),2,'"'));
            return;
         end;

         component=' ';
         if index(_infile_,'displayname') and index(_infile_,'maintenance/1"')=0 then do;
            component=scan(substr(_infile_,inname),2,'"');
            compid=scan(_infile_,4,'/');
            custver=scan(scan(_infile_,5,'/'),1,'"');
            if compid='test' then
               component=' ';
         end;
         if index("0123456789",substr(component,1,1)) then
            delete;
         if component ^= ' ' and component ^=: 'Hotfix' then
            output components;
      run;

      proc sort data=components;
         by compid descending custver;
      run;

      proc sort data=components nodupkey;
         by compid;
      run;

   %end;
   %else %if &SYSSCP = WIN %then %do;

      ***********************************************************************;
      * This code determines what is installed by reading the .ini files    *;
      * that are associated with each product on Windows.                   *;
      ***********************************************************************;
      filename inis "&sasroot\core\sasinst\data\*.ini";

      data components;
         length component $ 64;
         keep   component;
         label component = 'COMPONENT ----------------------------------------';
         infile inis;
         input;
         if _infile_=:'Component=' and index(_infile_,':::')=0 then do;
            component=scan(_infile_,2,':');
            output;
         end;
      run;

      filename inis;
   %end;
   %else %if "&SYSVLONG" < "9.02.02" %then %do;

      ***********************************************************************;
      * This code determines what is installed by reading the history file  *;
      * that is associated with the install on UNIX.                        *;
      ***********************************************************************;
      %if "&SYSVER" >= "9.1" %then %do;
         filename inis "&sasroot/install/admin/history.install";
      %end;
      %else %do;
         filename inis "&sasroot/.install/history";
      %end;

      data components;
         length component $ 64;
         label component = 'COMPONENT ----------------------------------------';
         infile inis;
         input;
         if _infile_=:'ADD ' then
            component=scan(_infile_,4,':');
         else delete;
         if index(component,"Map of ") or index(component,"Maps of ") or index(component," Samples") then
            delete;
         if index(component," Software") then
            component=substr(component,1, index(component," Software"));
      run;

      filename inis;
   %end;

   ****************************************************************;
   * This code checks to see what client apps are installed in    *;
   * addition to the SAS system. Examples include  SAS Eminer     *;
   * Tree Viewer, SAS System Viewer etc.  However, no further     *;
   * analysis is done for these (hot fixes, etc.)                 *;
   ****************************************************************;
   %if &SYSSCP = WIN or "&SYSVLONG" > "9.01.01M3" %then %do;
      filename appfile "&sashome.&slsh.";

      data temp2;
         length appname $ 64;
         label appname = 'COMPONENT ---------------------------';
         ap=dopen('appfile');
         nm=dnum(ap);

         do i=1 to nm;
            appname=dread(ap,i);
            appdot=index(appname,'.');
            if appdot then
               appdot = verify(substr(appname,appdot+1,1),'0123456789');
            if upcase(appname) not in ('SETUP LOGS', 'INSTALL', 'GEN1', 'UNINST',
               'DEPLOYMNTREG', 'INSTALLMISC')
               and not(appdot) then
               output;
         end;

         ap=dclose(ap);
         keep appname;
      run;

      filename appfile;
      %let t9 = %str( );

      ****************************************************************;
      * If we are on Windows, and if we can issue OS commands, then  *;
      * we can query the Windows registry to see what other SAS      *;
      * clients and solutions (EG, SMC, etc.) are installed.         *;
      ****************************************************************;
      %if &SYSSCP = WIN and &XCMD = XCMD %then %do;

         /* We can access the registry information as well !!! */
         %let t9 = %str(title9 "and applications registered in Windows--EXPECT DUPLICATES!!");
         filename appfile pipe 'reg query "HKLM\Software\SAS Institute Inc."';

         data temp3;
            length appname $ 64;
            label appname = 'COMPONENT ---------------------------';
            infile appfile;
            input;
            appname=scan(_infile_,4,'\');
            if upcase(appname) not in ('COMMON DATA', 'PLUGINS', ' ', 'THE SAS SYSTEM',
               'GEN1', 'INSTALLMISC', 'DEPLOYMNTREG', 'UNINST') then
               output;
            keep appname;
         run;

         filename appfile;
         %if %index(&sysscpl,%str(64)) %then %do;

            /* On Windows X64 machines, also need to read from Wow64 part of registry */
            filename appfile pipe 'reg query "HKLM\Software\Wow6432Node\SAS Institute Inc."';

            data temp4;
               length appname $ 64;
               label appname = 'COMPONENT ---------------------------';
               infile appfile;
               input;
               appname=scan(_infile_,5,'\');
               if substr(appname,1,1) > 'Z' then
                  delete;  /* ignore informal component names */
               if upcase(appname) not in ('COMMON DATA', 'PLUGINS', ' ', 'THE SAS SYSTEM',
               'GEN1', 'INSTALLMISC', 'DEPLOYMNTREG', 'UNINST') then
                  output;
               keep appname;
            run;

            filename appfile;

            proc append base=temp3 new=temp4;
            run;

         %end;
         %if "&SYSVLONG" > "9.02" %then %do;

            proc sort data=temp3 nodup;
               by appname;
            run;

            proc sort data=components nodup;
               by component;
            run;

            data temp3;
               merge temp3(in=reg)
                  components(rename=(component=appname));
               by appname;
               if reg;
            run;

         %end;

         proc append base=temp2 new=temp3 force;
         run;

         proc sort data=temp2 out=SASAppsClients nodup;
            by appname;
         run;

      %end;
   %end;

   /* Validate datapath parameter */
   %if &datapath= %then %do;
      %if %symexist (_CLIENTAPP) %then %do;
         %PUT NOTE: Running in Enterprise Guide.;
         %let datapath=S:\workshop;
      %end;
      %else %if &SYSENV=FORE %then %do;
         %PUT NOTE: Running SAS Windowing Environment.;
         %if &ThisOS=WIN %then %do;
            %let datapath=S:\workshop;
         %end;
         %else %do;
            %let datapath=~/workshop;
         %end;
      %end;
      %else %do;
         %PUT NOTE: Running in BATCH.;
         %local _sysin _chars;
         %let _sysin=%sysfunc(getoption(SYSIN));
         %let _chars=%sysfunc(find(&_sysin,/,-32767));
         %if not &_chars %then
            %let _chars=%sysfunc(find(&_sysin,\,-32767));
         %let datapath=%SUBSTR(&_sysin,1,%eval(&_chars-1));
      %end;
   %end;

   %put NOTE: Data Path is &Datapath;
   %let RC=%sysfunc(filename(DATALOC,%superq(datapath)));
   %IF &RC %then %do;
      %put %sysfunc(sysmsg());
      %goto BadData;
   %end;

   %let did=%sysfunc(dopen(&DATALOC));
   %if not &did %then %do;
%Baddata:
      %put ERROR: Datapath could not be accessed:;
      %put ERROR- %superq(datapath);

      /*   %PUT _local_;*/
      %goto OuttaHere;
   %end;

   /* Validate reportfile parameter */
   %if &reportfile= %then
      %let reportfile=SiteCheck.pdf;
   %PUT NOTE: Report File is &ReportFile;
   %let ReportType=%QUPCASE(%QSCAN(&reportfile,-1));
   %if not %index(*PDF*RTF*HTML*,*&ReportType*) %then %do;
      %PUT ERROR: Only RTF, PDF and HTML type reports are supported.;
      %PUT ERROR- Your report file (&reportfile) is type &ReportType..;
      %Goto OuttaHere;
   %end;

   %let filrf=rptfile;
   %let RC=%sysfunc(filename(filrf,%superq(reportfile)));
   %IF &RC %then %do;
      %put %sysfunc(sysmsg());
      %put ERROR: Report file could not be allocated:;
      %put ERROR- %superq(Reportfile);
      %goto OuttaHere;
   %end;

   /* Product License Detection */
   %let GRAPH_lic=not;
   %let STAT_lic=not;
   %let ACCPCFF_lic=not;
   %let EG_lic=not;
   %let EM_lic=not;
   %let TM_lic=not;
   %let CRS_lic=not;
   %let HPF_lic=not;
   %if %sysprod(Enterprise Guide)=1 %then %do;
      %let EG_lic=;
      %if %symexist(_CLIENTVERSION) %then %do;
         %let _EG=1;
      %end;
   %end;

   %if %sysprod(SAS/Graph)=1 %then%let GRAPH_lic=;
   %if %sysprod(SAS/ACCESS Interface to PC Files)=1 %then%let ACCPCFF_lic=;
   %if %sysprod(SAS/STAT)=1 %then %let STAT_lic=;
   %if %sysprod(Enterprise Miner)=1 %then%let EM_lic=;
   %if %sysprod(SAS Text Miner)=1 %then %let TM_lic=;
   %if %sysprod(SAS Credit Scoring)=1 %then%let CRS_lic=;
   %if %sysprod(SAS High-Performance Forecasting)=1 %then %let HPF_lic=;

   /* Product Installation Detection */
   %let GRAPH_inst=not;
   %let STAT_inst=not;
   %let ACCPCFF_inst=not;
   %let EG_inst=not;
   %let EM_inst=not;
   %let TM_inst=not;
   %let CRS_inst=not;
   %let HPF_inst=not;
   data _null_;
      set Components;
      where lowcase(Component) in(
                                  "sas enterprise guide"
                                 ,"sas enterprise miner"
                                 ,"sas high-performance forecasting"
                                 ,"sas text miner"
                                 ,"sas/access interface to pc files"
                                 ,"sas/graph"
                                 ,"sas/stat"
                                 ,"sas credit scoring"
                                 );
      select (lowcase(Component));
         when ("sas enterprise guide") do;
            call symputx ('EG_inst','');
            call symputx ('EG_ver',Custver);
         end;
         when ("sas enterprise miner") do;
            call symputx ('EM_inst','');
            call symputx ('EM_ver',Custver);
         end;
         when ("sas high-performance forecasting") call symputx ('HPF_inst','');
         when ("sas text miner") do;
            call symputx ('TM_inst','');
            call symputx ('TM_ver',Custver);
         end;
         when ("sas/access interface to pc files") call symputx ('ACCPCFF_inst','');
         when ("sas/graph") call symputx ('GRAPH_inst','');
         when ("sas/stat") call symputx ('STAT_inst','');
         when ("sas credit scoring") call symputx ('CRS_inst','');
         otherwise;
      end;
   run;

   /* Test for MS Office data files and access requirements */
   %let NeedACCPCFF=0;
   %let NumFiles=%sysfunc(dnum(&did));
   %let PCFileServer=%STR(%(no Excel or Access files in class data%));

   %do n=1 %to &NumFiles;
      %let filename=%sysfunc(dread(&did,&n));
      %if %index(*XLS*XLSX*ACCDB*MDB*,*%upcase(%scan(&filename,-1,.))*) %then %do;
         %let NeedACCPCFF=1;
         %let RC=%sysfunc(dclose(&did));
         %if &ACCPCFF_lic= %then %do;
            %let RC=%SYSFUNC(libname(XL,%superq(DATAPATH)\%superq(FILENAME)));
            %if &RC eq 0 %then %do;
               %let PCFileServer=Access to PCFiles Syntax: %STR(LIBNAME MyPCFile %'%superq(DATAPATH)\%superq(FILENAME)%';);
            %end;
            %else %do;
               %let RC=%SYSFUNC(libname(XL,,PCFILES,PATH="%Bquote(&DATAPATH)\%bquote(&FILENAME)"));
               %if &RC eq 0 %then %do;
                  %let PCFileServer=PC File Server Syntax: %NRSTR(LIBNAME MyPCFile PCFILES PATH='&DATAPATH\&FILENAME';);
               %end;
               %else %do;
                  %let PCFileServer=PC File Server required, but default LIBNAME statement failed.;
               %end;
            %end;

            %let RC=%SYSFUNC(libname(XL));
            %goto ExitExcelLoop;
         %end;
      %end;
   %end;

   %let RC=%sysfunc(dclose(&did));

%ExitExcelLoop:

   /* Report Building */
   options nocenter nodate ps=75;

   %if &ThisOS=WIN %then %do;
      FILENAME RPTFILE "%bquote(&DATAPATH)\&REPORTFILE";
   %end;
   %else %do;
      FILENAME RPTFILE "%bquote(&DATAPATH)/&REPORTFILE";
   %end;

   %if not &_EG %then %do;
      ods _all_ close;
   %end;
   %if &ReportType=PDF %then %do;
      %if &sysver > 9.1 %then %do;
         ods PDF file=RPTFILE PDFTOC=1;
      %end;
      %else %do;
         ods PDF file=RPTFILE;
      %end;
   %end;
   %else %if &ReportType=RTF %THEN %do;
      ods RTF file=RPTFILE;
   %end;
   %else %do;
      ods html file=RPTFILE STYLE=SASWEB;
   %end;

   %put NOTE: Report file is %sysfunc(pathname(RPTFILE));
   title "SAS Class Site Check Report";
   ODS PROCLABEL "System Info";

   data _null_;
      length t $120;
      label t='System Information:';
      file print ods;
      put _ods_ @1 "SAS Installation:";
      %if %symexist(SYSADDRBITS) %then %do;
         put _ods_ @1 " * O/S: &SYSSCP - &SYSSCPL, &SYSADDRBITS bits";
      %end;
      %else %do;
         put _ods_ @1 " * O/S: &SYSSCP - &SYSSCPL";
      %end;

      put _ods_ @1 " * SAS site# &SYSSITE, Version: &SYSVLONG4";

      /* Determine how this program is being executed */
      %if &SYSENV=BACK %then %do;
         %if %symexist (_CLIENTAPP) %then %do;
            %LET PRETEXT=%STR( * Report generated in Enterprise Guide);
         %end;
         %else %do;
            %LET PRETEXT=%STR( * Report generated in batch mode);
         %end;
      %end;
      %else %if &SYSENV=FORE %then %do;
         %LET PRETEXT=%STR( * Report generated in a SAS Windowing session);
      %end;

      put _ods_ @1 "&PRETEXT on %qsysfunc(datetime(),dateampm16.)";
      put _ods_ @1;
      put _ods_ @1 "SAS Foundation License Checks:";
      put _ods_ @1 " * SAS Enterprise Guide &EG_Ver is &EG_lic licensed and &EG_inst installed.";
      put _ods_ @1 " * SAS/Graph is &GRAPH_lic licensed and &GRAPH_inst installed.";
      put _ods_ @1 " * SAS/Access to PC Files is &ACCPCFF_lic licensed and &ACCPCFF_inst installed.";
      put _ods_ @1 " * &PCFileServer";
      put _ods_ @1;
      put _ods_ @1 "Statistical Training SAS License Checks:";
      put _ods_ @1 " * SAS/STAT is &STAT_lic licensed and &STAT_inst installed.";
      put _ods_ @1 " * SAS Enterprise Miner &EM_ver is &EM_lic licensed and &EM_inst installed.";
      put _ods_ @1 " * SAS Text Miner &TM_ver is &TM_lic licensed and &TM_inst installed.";
      put _ods_ @1 " * SAS Credit Scoring is &CRS_lic licensed and &CRS_inst installed.";
      put _ods_ @1 " * SAS High-Performance Forecasting is &HPF_lic licensed and &HPF_inst installed.";
      put _ods_ @1;
      put _ods_ @1"Class Data:";
      put _ods_ @1" * Path to the data is: '%superq(DataPath)'";
      put _ods_ @1" * A total of &NumFiles files were found in this path.";
   run;

   ODS PROCLABEL "SAS Data Sets";
   LIBNAME _SITECK "%BQUOTE(&datapath)";

   PROC SQL flow=6 25;
      TITLE2 "Data Sets in the ORION library (class data sets)";
      SELECT Memname 'Data Set'
         , Nlobs 'Number of Observations' 
         , Nvar 'Number of Variables'
         , crdate 'Date Created'
         , MEMLABEL 'Description'
      from dictionary.tables
         where libname='_SITECK'
      ;
   quit;

   title2;
   ODS PROCLABEL "SAS Programs";

   data _null_;
      length t $60;
      label t='Class Data - SAS Program Files:';
      file print ODS;
      %let RC=%sysfunc(filename(DATALOC,%superq(datapath)));
      %let did=%sysfunc(dopen(&DATALOC));
      %let ThisType=1;

      %do n=1 %to &NumFiles;
         %let filename=%sysfunc(dread(&did,&n));
         %LET EXT=%QUPCASE(%QSCAN(%SUPERQ(FILENAME),-1,.));
         %if %superq(EXT) = SAS %THEN %do;
            PUT _ods_ @1 "&ThisType - &filename";
            %let ThisType=%eval(&ThisType+1);
         %end;
      %end;

      %let RC=%sysfunc(dclose(&did));
   run;

   ODS PROCLABEL "Other Files";

   data _null_;
      length t $60;
      label t='Class Data - Other Files:';
      file print ODS;
      %let RC=%sysfunc(filename(DATALOC,%superq(datapath)));
      %let did=%sysfunc(dopen(&DATALOC));
      %let ThisType=1;

      %do n=1 %to &NumFiles;
         %let filename=%sysfunc(dread(&did,&n));
         %LET EXT=%QUPCASE(%QSCAN(%SUPERQ(FILENAME),-1,.));
         %if NOT (%qsubstr(%superq(EXT),1,3) = SAS)  %THEN %do;
            PUT _ods_ @1 "&ThisType - &filename";
            %let ThisType=%eval(&ThisType+1);
         %end;
      %end;

      %let RC=%sysfunc(dclose(&did));
   run;

   ods pdf close;
   %if not &_EG %then %do;
      ods listing;
   %end;

%OuttaHere:
   %if not (&SYSENV=BACK) %then %do;

      /* Exit Routines */
      /* Put system options back the way you found them */
      data _null_;
         length statement startup current $1024;
         set sashelp.voption;

         /* Exclude options you can't change while SAS is executing */
         where optstart ne 'startup' 
            and optname not in ('AWSDEF','FONT','FORMCHAR');
         startup=getoption(optname,'startupvalue');
         current=getoption(optname);
         if startup ne current then do;
            statement=cat('OPTIONS ',getoption(optname,'keyword','startupvalue'),';');
            PUTLOG "NOTE- " statement;
            call execute(statement );
         end;
      run;

      /* Make sure all files we used are de-allocated */
      LIBNAME _SITECK clear;
      %let RC=%sysfunc(filename(DATALOC));
      %let RC=%sysfunc(filename(RPTFILE));
      %let RC=%sysfunc(filename(filrf));
   %end;
%mend;

/* Execute the Report */
%SiteCheck(%superq(PathToClassData),%superq(ReportFileName))
