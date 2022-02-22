@echo off
set LOGGERVERSION=v1.0.0
for /f "usebackq tokens=2,* delims= " %%a in (`net user "%USERNAME%" /domain ^| find /i "Full Name"`) do set USERFULLNAME=%%b
for /f "usebackq tokens=2,* delims==()" %%a in (`wmic TIMEZONE get * /value ^| find /i "Description"`) do set UTC=%%a
echo loggerversion,object,date,time,timezone,computername,userdomain,username,userfullname > logging.csv
echo "%LOGGERVERSION%","%1","%DATE%","%TIME%","%UTC%","%COMPUTERNAME%","%USERDOMAIN%","%USERNAME%","%USERFULLNAME%" >> logging.csv