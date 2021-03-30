echo "simple-z.sh, v0.1"
echo "Automating the installation of the Z-Shell and the ohmyzsh Extension :^)"
echo "Copyright 2021"

user_found=0
user_name="something"
echo "Determining Linux Distribution"
DISTRO=$(grep '^NAME' /etc/os-release)

if [ "$DISTRO" == "Debian GNU/Linux" ]
then
    
    echo "Installing needed dependencies"

    apt install curl -y

    echo "Installing zsh"
    apt install zsh -y 


    while [ $user_found != 1 ]
    do
        echo "What is the name of the user for whom you want install oh-my-zsh and it's default template file?"
        read user_name

        if id "$user_name" &>/dev/null; then
            user_found=1
        else
            user_found=0
        fi
    done


    echo "Changing default shell to zsh"
    su -c chsh -s $(which zsh) $user_name

    echo "Installing oh-my-zsh"    
    su -c sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended $user_name
fi