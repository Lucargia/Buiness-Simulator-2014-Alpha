@echo off
title Business Simulator 2014
SET sh=0
SET ma=1
SET m=0
SET s=0
SET ci=None
SET lq=0
SET time=20
SET p=0

:start2
echo ----------------MENU-%time%-%date%------------------
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo  1.Load Game 2.Delete Game 3.Start new game
set /p start=
if %start%==2 goto delsave
if %start%==1 goto contsave
if %start%==3 goto bn
:bn
cls
echo Enter the name of your business:
set /p b=
echo Is %b% correct? Y/N
set /p bc=
if %bc%==Y goto start
if %bc%==N goto bn
if %bc%==y goto start
if %bc%==n goto bn
if %bc%==C echo >> cheatallow.lucargia&goto start
if %bc%==c echo >> cheatallow.lucargia&goto start
echo Not valid anwser.
pause
exit

:start
cls
echo.                                   %b% Status Board
echo.                                   Money: $%m%  
echo.                                   Current Investment: %ci% 
echo.                                   Owe To Bank: $%lq%
echo.                                   Staff: %s%  
echo.                                 
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo This is your business main screen here it displays your money,how much you owe,staff and current investment! NOTE: That the object of the game is to survive with your company for as long as possible!
pause
echo Now to start off your business you need money! Here are some starting options you can select!
echo 1.Donations
echo 2.Bake sale
echo 3.Loan
set /p so=Please enter your option:
if %so%==1 goto donate
if %so%==2 goto bakesale
if %so%==3 goto loan
if %so%==4 goto cheat
echo Not a valid option
pause
exit

:donate
SET so=Donation Collecting
goto %random:~-1%
pause
exit

:bakesale
SET so=Bake Sale
goto %random:~-1%
pause
exit

:loan
echo How much would you like to loan?
set /p lq=
echo $%lq% loaned from the bank
SET m=%lq%
SET owe=%lq%
pause
goto ms

:1
echo Your %so% was sucessful!
echo You have earned 5000 dollars to start!
SET m=5000
pause
goto ms

:2
echo Your %so% was a failure
pause
goto gameover

:3
echo Your %so% was sucessful!
echo You have earned 3000 dollars to start!
SET m=3000
pause
goto ms

:4
echo Your %so% was a failure
pause
goto gameover

:5
echo Your %so% was a failure
pause
goto gameover

:6
echo Your %so% was sucessful!
echo You have earned 4000 dollars to start!
SET m=4000
pause
goto ms

:7
echo Your %so% was sucessful!
echo You have earned 6000 dollars to start!
SET m=6000
pause
goto ms

:8
echo Your %so% was a failure
pause
goto gameover

:9
echo Your %so% was sucessful!
echo You have earned 7000 dollars to start!
SET m=7000
pause
goto ms

:ms
if exist taxes.file SET /A m=%m%-1000&goto searchmoney
cls
echo.                                   %b% Status Board
echo.                                   Money: $%m%  
echo.                                   Current Investment: %ci% 
echo.                                   Owe To Bank: $%lq%
echo.                                   Staff: %s%  
echo.                                   Products: %p%
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.
echo.

set /p msq=Would you like to now 1.Begin Investing 2.Hire Staff or 3.Get another loan 4.Resume money making 5.Pay back bank 6.Fire staff 7.Make a new product 8.Save Game
if %msq%==1 goto bi
if %msq%==2 goto hs
if %msq%==3 goto l
if %msq%==4 goto bbi
if %msq%==5 goto pbb
if %msq%==6 goto fs
if %msq%==7 goto np1
if %msq%==8 goto save
echo Not a option
pause
exit

:searchmoney
echo >> search.file
start searchstopper.bat
:searchmoney2
echo We are now searching your money for a negative amount of it!  %random% %random:~-1% %random:~-2% %random:~-3% %random:~-4%
if %m%==-%random% goto gameover&SET a=%random%
if %m%==-%random:~-1% goto gameover&SET b=%random:~-1%
if %m%==-%random:~-2% goto gameover&SET c=%random:~-2%                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
if %m%==-%random:~-3% goto gameover&SET d=%random:~-3%
if %m%==-%random:~-4% goto gameover&SET e=%random:~-4%
if exist search.file goto searchmoney2
pause
del taxes.file
goto ms

:save
set savename=null
set overwrite=null
echo:
echo:
echo  Save Game NOTE: Only saves your money
echo:
echo  Type the save name that you want.
echo:
set /p savename=
echo:
echo  Saving...
::Saves the current game.
if %savename%==0 goto ms
if %savename%==null goto save
if exist saves\%savename%.file (
	echo:
	echo  Save "%savename%" already exists. Overwrite? Y/N
	set /p overwrite=
	if /I %overwrite%==y del saves\%savename%.file
	if /I %overwrite%==n goto failedSave
)
echo  Errors:
if not exist saves\svlis\%savename% md saves\svlst\%savename%
echo  money=%m% >saves\%savename%.file
if not exist saves\%savename%.file goto failedSave
echo  Saved
echo: 
pause
goto ms
	:failedSave
echo:
echo Failed to save "%savename%"
echo:
pause
goto start2

:delsave
set delsave=null
echo:
echo:
echo  Options - Delete Save
echo:
echo Enter the names of the save you want to delete. Typing "/deleteall" will delete all saves.
echo:
set /p delsave=
if %delsave%==0 goto ms
if %delsave%==null goto delsave
if %delsave%==/deleteall (
	if not exist saves cd ..
	if not exist saves goto forDel
	echo  Enter "Y" to delete ALL saves
	echo:
	del saves
	md saves
	md saves\svlst
	echo:
	echo  Deleted all saves.
	echo:
	pause
	goto start2
)
if not exist saves\%delsave% (
	echo  Save "%delsave%" does not exist
	echo:
	pause
	goto start2
)
echo  Enter "Y" to delete the save
del saves\%delsave%
echo:
echo Deleted "%delsave%"
echo:
pause
goto start2

:contsave
set retname=null
echo:
echo:
echo  Continue Game
echo:
echo  Avaliable saves:
echo:
tree saves\svlst
echo:
echo  Enter the name of your save file
echo:
set /p retname=
echo:
if %retname%==null goto contsave
if %retname%==0 goto ms
echo -Checking files...
if not exist saves\%retname%.file (
	echo:
	echo  Save %retname% does not exist.
	echo:
	pause
	goto start2
)
echo -Retrieving files...
::Retrieves the save info from the save file.
for /F "usebackq money=%m%" %%A in ("saves\%retname%.file") do set %%A
echo:
echo  Proceeding to game...
goto ms


:bi
SET s=1
echo Here are your investing options:
echo 1.Software
echo 2.Resturant
echo 3.Store
set /p ci=
if %ci%==1 goto bbi
if %ci%==2 goto bbi
if %ci%==3 goto bbi
echo Not a option
pause
exit

:np1
if %ci%==Software goto npsoftware
if %ci%==Store goto npstore
if %ci%==Resturant goto npresturant
echo No investment option detected
pause
goto ms

:npresturant
echo Product Making Options:
echo 1.New resturant
echo 2.Expand a resturant
echo 3.New Supplies
set /p npstore=
if %npstore%==1 goto newresturant
if %npstore%==2 goto expandresturant
if %npstore%==3 goto newsupplies2
echo Not a option
pause
goto ms

:newresturant
echo Cost: 9000
pause
SET /A m=%m%-9000
SET /A p=%p%+1
echo New resturant created!
pause
goto ms

:expandresturant
echo Cost: 5000
pause
SET /A m=%m%-5000
SET /A p=%p%+1
echo Resturant expanded!
pause
goto ms

:newsupplies2
echo Cost: 4000
pause
SET /A m=%m%-4000
SET /A p=%p%+1
echo New supplies bought!
pause
goto ms

:npstore
echo Product Making Options:
echo 1.New store
echo 2.Expand a store
echo 3.New Supplies
set /p npstore=
if %npstore%==1 goto newstore
if %npstore%==2 goto expandstore
if %npstore%==3 goto newsupplies
echo Not a option
pause
goto ms

:newstore
echo Cost: 9000
pause
SET /A m=%m%-9000
SET /A p=%p%+1
echo New store created!
pause
goto ms

:expandstore
echo Cost: 5000
pause
SET /A m=%m%-5000
SET /A p=%p%+1
echo Store expanded!
pause
goto ms

:newsupplies
echo Cost: 4000
pause
SET /A m=%m%-4000
SET /A p=%p%+1
echo New supplies bought!
pause
goto ms

:npsoftware
echo Product Making Options:
echo 1.New computer
echo 2.New game
echo 3.New console
set /p npsoft=
if %npsoft%==1 goto newpc
if %npsoft%==2 goto newgame
if %npsoft%==3 goto newconsole
echo Not a option
pause
goto ms

:newpc
echo Cost: 6000
pause
SET /A m=%m%-6000
SET /A p=%p%+1
echo New PC created!
pause
goto ms

:newgame
echo Cost: 7000
pause
SET /A m=%m%-7000
SET /A p=%p%+1
echo New game created!
pause
goto ms

:newconsole:
echo Cost: 100000
pause
SET /A m=%m%-100000
SET /A p=%p%+1
echo New console created!
pause
goto ms


:hs
if %ci%==None echo Please select a investment first&pause&goto ms
echo How many workers would you like to recruit? $1 each!
set /p sh=
SET /A s=%s%+%sh%
SET /A m=%m%-%sh%
echo This feature is WIP
pause
goto ms

:l
if %m%==-%random:~-1% goto gameover
echo How much would you like to loan?
set /p l=
echo $%l% loaned from the bank
SET /A m=%m%+%l%
SET /A lq=%lq%+%l%
pause
goto ms

:bbi
start taxes.bat
if %ci%==1 SET ci=Software
if %ci%==2 SET ci=Resturants
if %ci%==3 SET ci=Store
if %sh%==21 echo Cannot go lower on timer then 1
pause
start moneystopper.bat
echo >> bbithing.txt
:bbi2
if %sh%==2 SET time=19
if %sh%==3 SET time=18
if %sh%==4 SET time=17
if %sh%==5 SET time=16
if %sh%==6 SET time=15
if %sh%==7 SET time=14
if %sh%==8 SET time=13
if %sh%==9 SET time=12
if %sh%==10 SET time=11
if %sh%==11 SET time=10
if %sh%==12 SET time=9
if %sh%==13 SET time=8
if %sh%==14 SET time=7
if %sh%==15 SET time=6
if %sh%==16 SET time=5
if %sh%==17 SET time=4
if %sh%==18 SET time=3
if %sh%==19 SET time=2
if %sh%==20 SET time=1
if %ci%==None echo Please select a investment first&pause&goto ms
if %m%==-%random:~-1% goto gameover
timeout >nul %time%
SET /A m=%m%+%ma% 
echo Money: %m%
if exist bbithing.txt goto bbi2
goto ms

:pbb
if %m%==-%random:~-1% goto gameover
echo How much would you like to pay the bank back?
set /p pbb=
SET /A lq=%lq%-%pbb%
SET /A m=%m%-%pbb%
echo $%pbb% given back to the bank!
pause
goto ms

:cheat
if exist cheatallow.lucargia goto cheat2
echo YOU THINK YOU CAN CHEAT THE SYSTEM BRO WELL IF YOU DO THEN GET ON OUT OF HERE!
pause
goto gameover

:cheat2
echo Oh hey there!
echo  Let me just cheat you a few things here.....
SET time=0
echo .
SET m=100000
echo ..
SET s=12438902571097549873
SET p=147530776304
echo ...
SET lq=0
echo ....
echo .....
echo Ok Im done! Now none of that boring tutorial stuff let me just jump you right in!
echo Wait one quick tip: Dont get caught by the searcher!
SET b=Admin
pause
goto ms

:fs
if %m%==-%random:~-1% goto gameover
echo How many staff would you like to fire?
set /p fs=
SET /A s=%s%-%fs%
echo %fs% Staff fired
pause
goto ms


:gameover
title Press The X to exit and restart
echo GAME OVER!
goto gameover
