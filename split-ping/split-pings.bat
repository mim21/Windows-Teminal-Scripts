@echo off
setlocal ENABLEDELAYEDEXPANSION
set COMMAND=wt -p "Command Prompt" 

set /A COUNTER=0
for /F %%a in (ips.txt) do (
	set /A COUNTER+=1
	set /A "modulo_three=!COUNTER! %% 3"
	IF !modulo_three!==0 (		
		set COMMAND=!COMMAND!; new-tab -p "Command Prompt" ping -t %%a
	) else (
		set COMMAND=!COMMAND!; split-pane -p "Command Prompt" ping -t %%a
		)
	)
set COMMAND=!COMMAND!; focus-tab -t0 

!COMMAND!