@echo off 
SET MAKETOOL=..\deps\premake\release\premake5.exe

%MAKETOOL% vs2012
%MAKETOOL% vs2013
%MAKETOOL% vs2015

%MAKETOOL% --arch=wp80app	 vs2012
%MAKETOOL% --arch=w81app 	 vs2013
%MAKETOOL% --arch=wp81app 	 vs2013
%MAKETOOL% --arch=w10app 	 vs2015

%MAKETOOL% --arch=ios  	xcode4
%MAKETOOL% --arch=tvos  xcode4