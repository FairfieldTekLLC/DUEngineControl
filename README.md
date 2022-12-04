# DUEngineControl
Dual Universe Toggle Engines

This Lua Code allows you to toggle engines on and off via script to conserve fuel.  Now I doubt you have the same setup as me, but this should get you a long way to making it work for you.  I found the hardest part was finding documentation on the lua commands themselves, not so much the ideas.  The code does work, I use it in one of my haulers to let it sip fuel when it runs empty and I can turn up the juice when I am hauling a ton of stuff.  Good Luck!

To set this up:

1) Place a Programming Board
2) Place a DataBank
3) Place a xtra small screen
4) Link the programming board to the core
5) Link the programming board to the databank
6) Link the programming board to the screen
7) Link a engine of each type (That you don't want to toggle) to the control board.
8) Rename the elements the same way they are in the photo below.

When you are done it should look like this:
![image](https://github.com/FairfieldTekLLC/DUEngineControl/blob/main/ControlBoardConfig.JPG)

9) Now, the tags I used for the engines are:
      -AuxVertEngine
      -AuxHov
      -AuxSpaceEngine1
      -AuxSpaceEngine2
      -AuxAtmoEngine
10) Tag them and check the option to ignore default tags
![image](https://github.com/FairfieldTekLLC/DUEngineControl/blob/main/engineTags.JPG)
11) Open the programming board and click on Unit
12) Add 3 Filters
13) Set one to onStop()
14) Set one to onStart()
15) Set one to onTimer(loop)
16) Click on onStop and paste the [code](https://raw.githubusercontent.com/FairfieldTekLLC/DUEngineControl/main/onStop().lua).
17) Click on OnStart and paste the [code](https://raw.githubusercontent.com/FairfieldTekLLC/DUEngineControl/main/onStart.lua).
18) Click on onTimer(loop) and paste the [code](https://raw.githubusercontent.com/FairfieldTekLLC/DUEngineControl/main/onTimer(loop).lua)
19) Close the programming board
20) Click on the screen and go to edit content
21) Paste the [code](https://raw.githubusercontent.com/FairfieldTekLLC/DUEngineControl/main/Display.lua)
22) Close the window
23) You should see a screen that looks like

![image](https://github.com/FairfieldTekLLC/DUEngineControl/blob/main/display.jpg)



