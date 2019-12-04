#!/bin/bash
while true
do
# Parent Menu Declared
echo "Which Service would you like to use?"
select option in Apache SSH NC NMAP TMUX Exit
# Case Statement to compare first menu items
do
case $option in
    Apache)
    #Sub-Menu items Declared here
    echo "What would you like to do?"
    select Sub1 in Start Stop Check Back
    do
    #Case Statment for sub menu
    case $Sub1 in
    Start)
    sudo service apache2 start
    break
    ;;
    Stop)
    sudo service apache2 stop
    break
    ;;
    Check)
    sudo netstat -antp | grep apache
    break
    ;;
    Back)
    echo "back to main menu"
    #return to main menu
    break 2
    ;;
    *)
    echo "Invalid"
    ;;
    esac
    done
    break
    ;;
    SSH)
    echo "What would you like to do?"
    select Sub2 in Start Stop Check Back
    do
    #Case Statment for sub menu
    case $Sub2 in
    Start)
    sudo service ssh start
    break
    ;;
    Stop)
    sudo service ssh stop
    break
    ;;
    Check)
    sudo netstat -antp | grep ssh
    break
    ;;
    Back)
    echo "back to main menu"
    #return to main menu
    break 2
    ;;
    *)
    echo "Invalid"
    ;;
    esac
    done
    break
    ;;
    NC)
    echo "Which netcat service would you like to use??"
    select Sub3 in Allow_access Access_win_machine Banner_Info Main_Menu
    # Case Statement to compare first menu items
do
case $Sub3 in
    Allow_access)
    echo "Exiting this option will cause you to return to command prompt when you use ctrl+c"
    echo "Press ctrl+c now to exit this application if you do not want to continue, and then re run the script."
    read -n 1 -s -r -p "Press any key to continue"
    echo " "
    #Sub-Menu items Declared here
    sudo nc -lvp 852456
    break
    ;;
    Access_win_machine)
    echo "Exiting this option will cause you to return to command prompt when you use ctrl+c"
    echo "Press ctrl+c now to exit this application if you do not want to continue, and then re run the script."
    read -n 1 -s -r -p "Press any key to continue"
    echo " "
    echo "Type in the IP Address:"
    read ip
    echo "Enter the port number:"
    read prt
    sudo nc $ip $prt -e cmd.exe
    break
    ;;
     Banner_Info)
    echo "Exiting this option will cause you to return to command prompt when you use ctrl+c"
    echo "Press ctrl+c now to exit this application if you do not want to continue, and then re run the script."
    read -n 1 -s -r -p "Press any key to continue"
    echo " "
    #Sub-Menu items Declared here
    echo "Please type the IP Address"
    read IP2
    echo "Please type in the port number"
    read prt2
    sudo nc -nv $IP2 $prt2
    break
    ;;
    Main_Menu)
    break 2
    ;;
    *)
    echo "Invalid"
    ;;
    esac
    done
    break 2
    ;;
    NMAP)
    echo "Exiting this option will cause you to return to command prompt when you use ctrl+c"
    echo "Press ctrl+c now to exit this application if you do not want to continue, and then re run the script."
    read -n 1 -s -r -p "Press any key to continue"
    echo " "
    #Sub-Menu items Declared here
    select Sub4 in Single_IP Multiple_IP Main_Menu
    # Case Statement to compare first menu items
    do
    case $Sub4 in
    Single_IP)
    echo "Please supply the IP you wish to scan for ports and operating system."
    echo "Please limit to single ip address, and do not use on routers, unless you want to wait."
    read NMAPIP
    sudo nmap -sS -O -A $NMAPIP >> ~/Documents/nmapresult.txt
    cat ~/Documents/nmapresult.txt | more
    break
    ;;
    Multiple_IP)
    echo "Please supply the IP you wish to scan for ports and operating system."
    echo "Please limit to single ip address, and do not use on routers, unless you want to wait."
    read NMAPIP
    sudo nmap $NMAPIP >> ~/Documents/nmapresultmulti.txt
    cat ~/Documents/nmapresultmulti.txt | more
    break
    ;;
    Banner_Info)
    echo "Exiting this option will cause you to return to command prompt when you use ctrl+c"
    echo "Press ctrl+c now to exit this application if you do not want to continue, and then re run the script."
    read -n 1 -s -r -p "Press any key to continue"
    echo " "
    #Sub-Menu items Declared here
    echo "Please type the IP Address"
    read IP2
    echo "Please type in the port number"
    read prt2
    sudo nc -nv $IP2 $prt2
    break
    ;;
        Main_Menu)
    break 2
    ;;
    *)
    echo "Invalid"
    ;;
    esac
    done
    break 2
    ;;
    TMUX)
    echo "Exiting this option will cause you to return to command prompt when you use ctrl+c"
    echo "Press ctrl+c now to exit this application if you do not want to continue, and then re run the script."
    read -n 1 -s -r -p "Press any key to continue"
    echo " "
    #Sub-Menu items Declared here
    select Sub5 in New_Session Open_Session Main_Menu
    # Case Statement to compare first menu items
    do
    case $Sub5 in
    New_Session)
    echo "Please type in the name for your session."
    read TMNAME
    sudo tmux new -s $TMNAME
    break
    ;;
    Open_Session)
    tmux list-sessions
    echo "Please type the name of the session."
    read TMUXName
    read -n 1 -s -r -p "Press any key to continue"
    echo " "
    tmux a -t $TMUXName
    break
    ;;
    Main_Menu)
    break 2
    ;;
    *)
    echo "Invalid"
    ;;
    esac
    done
    break 2
    ;;
    Exit)
    echo "This Script was written by The Linux GOD! Darkjedeye!"
    read -n 1 -s -r -p "Press any key to continue"
    echo " "
    echo "If you would like your own personalised script, with your own specific general commands,"
    echo "Email Darkjedeye on info@cisit.co.za"
    read -n 1 -s -r -p "Press any key to continue"
    echo "Good Bye!"
    break 2
    ;;
    *)
    echo "Invalid"
    ;;
    esac
    done
    done
