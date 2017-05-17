Information Regarding Using the DataPump

The dump file was built in the following manner:

	DOS> expdp miaaFantasy/bjarne parfile=miaaFantasy.par
	
See create.sql in this subdirectory (DataPump) for creating the user and the necessary directory

To load the miaaFantasy, load the MIAAFANTASY.dmp file using Oracle Datapump. The command files must be
	loaded in C:\Users\elc3\Documents\project\. To load the database, use the create.sql script to create
	a new miaaFantasy user and then use datapump to load the dump files, as follows:
	
		DOS> cd C:\Users\elc3\Documents\project\
		DOS> sqlplus system/bjarne
		DOS> @create
		DOS> exit
		DOS> impdp miaaFantasy/bjarne parfile=miaaFantasy.par