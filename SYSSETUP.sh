#!/bin/bash

# Determine if the user is root or not

echo "Your UID is ${UID}"

if [[ "${UID}" -eq 0 ]]

    then
        echo " Staring Script!"
        # Determine if what fork the user is running
        read -p "Which type of linux are you using? Debian, RPM, RHEL, openSUSE: " FORK   
            if [[ "$FORK" = "Debian" ]]
                then
                    echo "Updating system to get ready for installations."
                    apt update && apt upgrade -y
                    echo
                    read -p "Are you running a Server or a Desktop with visuals? " ARCHITECTURE
                        if [[ "$ARCHITECTURE" = "Server" ]]
                            then
                                read -p "would you like the folowing apps will be installed. yakuake sl kate konsole cmatrix openssh-server figlet toilet virtualbox virtualbox-dkms sshfs neofetch fortune cowsay [yes/no]: " SERVER
                                    if [[ "$SERVER" = "yes" ]]
                                        then
                                            add-apt-repository ppa:dawidd0811/neofetch
                                            apt update
                                            apt install -y mc sl konsole cmatrix openssh-server figlet toilet apache2 mysql-server php phpmyadmin htop sshfs neofetch fortune cowsay
                                            echo "your applications have been"
                                            figlet "installed!" -f standard -c
                                            read -n 1 -s -r -p "Press any key to continue"
                                            echo
                                        else
                                            echo "No Programs will be installed!"
                                        fi
                            else
                                echo "No Programs will be installed!"
                            fi
                                
                        if [[ "$ARCHITECTURE" = "Desktop" ]]
                        
                            then
                                read -p "would you like the folowing apps will be installed. yakuake sl kate konsole cmatrix openssh-server figlet toilet virtualbox virtualbox-dkms sshfs neofetch fortune cowsay [yes/no]: " DESKTOP
                                    if [[ "$DESKTOP" = "yes" ]]
                                        then
                                            apt install -y mc yakuake sl kate konsole cmatrix openssh-server figlet toilet virtualbox virtualbox-dkms sshfs neofetch fortune cowsay
                                            echo
                                            echo "Now installing Brave Browser!"
                                            echo
                                            curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
                                            echo
                                            sudo sh -c 'echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com `lsb_release -sc` main" >> /etc/apt/sources.list.d/brave.list'
                                            echo
                                            apt update
                                            sudo apt install brave-browser brave-keyring
                                            echo
                                            echo "Done!"
                                            echo "your applications have been"
                                            figlet "installed!" -f standard -c
                                            read -n 1 -s -r -p "Press any key to continue"
                                            echo
                                        else 
                                            echo "No Programs will be installed!"
                                        fi
            fi
    else
        echo "Hi"
    fi
                        
        # Determine if the system is Desktop or Server
        
        # Clean up Apt
        
        # Modify the bash.bashrc file to include the alias' i use.
        
        # End of the script
        
        echo " "
        echo "This script has completed it's run."
        read -n 1 -s -r -p "Press any key to continue"
        echo " "
        echo "This script was written by the linux GOD"
        figlet "DARKJEDEYE"
        read -n 1 -s -r -p "Press any key to continue"
        echo " "
        echo "If you wish to have your own script like this, personalized with your own details."
        echo "email Darkjedeye on"
        echo "darkjedeye@cisit.co.za"
        figlet "This conculeds our presentation for this evening" -f small -c
    else
        echo "You are not root! Please either use sudo or run as root."
fi