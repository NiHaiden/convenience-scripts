echo "simple-z.sh, v0.1"
echo "Automating the installation of the Z-Shell and the ohmyzsh Extension :^)"
echo "Copyright 2021"


echo "Determining Linux Distribution"
DISTRO = grep '^NAME' /etc/os-release

if [ "$DISTRO" == "Debian GNU/Linux" ]
then
    
    echo "Installing needed dependencies"

    sudo apt install curl -y

    echo "Installing zsh"
    apt install zsh -y 


    echo "Changing default shell to zsh"
    chsh -s $(which zsh)

    echo "What is the name of the user for whom you want install oh-my-zsh and it's default template file?"
    read user_name

    echo "Installing oh-my-zsh"
    su $user_name
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended










    

