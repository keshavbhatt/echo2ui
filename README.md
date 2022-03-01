

# echo2ui

echo2ui channels stdout & stderr of any program to userland (Desktop environment) when they crash or exit with non zero exit codes using minimal set of bash utilities.

![echo2ui Linux](https://github.com/keshavbhatt/echo2ui/blob/main/images/echo2ui.png?raw=true)

## Motivation
The main motivation behind developing echo2ui is to bring the output of program to userland (Desktop environment) or to user's attention.

**Few example cases which echo2ui is aiming to target:**
* User run some program/application by clicking the desktop launcher from their application menu or dashboard, and for some reason the application crashes without even starting. Now the possible cases why the application might be failing are:
   * missing runtime libraries (*.so in Linux ; *.dll in Windows )
   * segmentation fault
   * missing some miscellaneous dependency that are required to start the program etc

**How windows handels the above situations:**

They provide some short of dialog box that report all if the three issues mentioned about, remeber the irritating missing *.dll messagebox?

![missing-dll-error](https://github.com/keshavbhatt/echo2ui/blob/main/images/missing-dll-error.png?raw=true)

**How Linux desktop handels the above situations:**

No, we don't bother to provide any information to userland or the environment user is interactig with (we generally assuming that all users are launching GUI applications via console? )
So, we left the user is with no clue by making them unaware why the application failed to start or crashed.

They will also not be able to report to developers the exact output of the application when it crashed on their system.

**How echo2ui will handle missing .so or any other crash**

![missing-so-error](https://github.com/keshavbhatt/echo2ui/blob/main/images/missing-so.gif?raw=true)

## Technical information about echo2ui :

The main source code of this project lives in src/ directory that contain 3 scripts as of now:

 1. **echo2ui**

    ```echo2ui shows informational messages using xterm and whiptail```

    ```Usage: ./echo2ui [context name] [title] [message] [width] [height]```


    ```Example: ./echo2ui 'My Context' 'My Title' 'Hello from echo2ui!' 60 20```

2. **launcher**

    ```this wrapper script will launch the application and bind it to echo2ui```

    ```Usage: ./launcher [launchable-app or its path] [path to log file (optional)] ```


    ```Example 1: ./launcher wonderwall ```

    ```Example 2: ./launcher wonderwall /tmp/wonderwall.log```

3. **echo2ui_util**

    ```it's a common utility script shared between script present in the same directory ```

## Dependencies:
echo2ui aims to stay as slim as possible. Right now it just need:
- bash
- xterm (stterm can also be utilized)
- whiptail (dialog can also be utilized)

## Example Snap:

Independent [snap app](https://snapcraft.io/echo2ui) that ship these three dependencies and provide working example of echo2ui's functionalities is ~4Mb in size and ~6Mb  in size when using LZO compression.

`snap install echo2ui`

This example snap ships 4 applications:

 1. **echo2ui** (run echo2ui for usage)
 2. **launcher** (run echo2ui.launcher for usage)
 3. **bashCrash2ui** (demo faulty bash script launched via echo2ui launcher)
 4. **qtCrash2ui** (demo Qt5 application launched via echo2ui launcher to demonstrate *.so missing)
