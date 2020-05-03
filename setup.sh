#!/bin/sh
ubuntu() {
    test -d /etc/apt/sources.list.bak || sudo cp /etc/apt/sources.list /etc/apt/sources.list.bak
    echo '''
deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse
''' > /etc/apt/sources.list
}

git() {
    git config --global user.email "gang.wang@shanbay.com"
    git config --global user.name "WangGang"
    git config --global alias.st "status -sb"
    git config --global alias.pm "push origin master"
    git config --global alias.br "branch"
    git config --global alias.ck "checkout"
    git config --global alias.cma "commit --amend"
    git config --global alias.cm "commit -m"
    git config --global alias.rb "rebase"
    git config --global core.editor "vim"
}

vim() {
    test -d ~/.oh-my-zsh || git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
    test -d ~/.oh-my-zsh/plugins/zsh-autosuggestions || git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
    test -d ~/.oh-my-zsh/plugins/zsh-syntax-highlighting || git clone git@github.com:zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting
    ln -s /gitstore/vim_config ~/.vim
    ln -s /gitstore/vim_config/vimrc ~/.vimrc
    ln -s /gitstore/vim_config/zshrc ~/.zshrc
    ln -s /gitstore/vim_config/tmux.conf ~/.tmux.conf
    chsh -s /bin/zsh
    # ln vim config to nvim config
    test -d ~/.config || mkdir ~/.config
    ln -s /gitstore/vim_config ~/.config/nvim
    ln -s /gitstore/vim_confi/vimrc ~/.config/nvim/init.vim
}

docker() {
    sudo apt install apt-transport-https ca-certificates software-properties-common curl
    curl -fsSL https://mirrors.ustc.edu.cn/docker-ce/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://mirrors.ustc.edu.cn/docker-ce/linux/ubuntu \
    $(lsb_release -cs) stable"
    sudo apt update
    sudo apt install docker-ce
    sudo groupadd docker
    sudo gpasswd -a ${USER} docker
    sudo apt install docker.io
    sudo service docker restart
    # 修改源
    # vi /etc/default/docker
    # DOCKER_OPTS="--registry-mirror=https://docker.mirrors.ustc.edu.cn"
    # systemctl restart docker.service
}

code() {
    # sudo passwd root
    export LC_ALL=en_US.UTF-8
    sudo cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
    sudo apt-get install ntpdate
    sudo ntpdate -u ntp.api.bz
    sudo apt update
    sudo apt install -y translate-shell
    sudo apt install -y python3-pip
    sudo apt install -y zsh
    sudo apt install -y vim
    sudo apt install -y tmux
    sudo apt install -y silversearcher-ag
    sudo pip3 install flake8
    sudo pip3 install python-language-server
    sudo apt remove --purge tracker   # 删除缓存
    # TODO go 环境 安装
    # sudo apt autoclean # 清理旧版本的软件缓存
    # sudo apt clean     # 清理所有软件缓存
    # sudo apt autoremove # 删除系统不再使用的孤立软件
    # dpkg -l |grep ^rc|awk '{print $2}' |sudo xargs dpkg -P # 清除残余的配置文件

    # sudo apt-get remove --purge 软件名   # 删除软件
    # 删除多余内核
    # uname -a  # 查看当前ubuntu系统的内核
    # dpkg --get-selections|grep linux # 查看安装的所有内核
    # sudo apt-get remove linux-image-xxxxxxxxx-generic  # 把xxxx替换成相应的内核版本
    # sudo apt-get remove linux-headers-xxxxxx
    # sudo apt-get remove linux-headers-xxxxxx-generic
    # sudo /usr/sbin/update-grub  # 清理内核后，重新生成grub文件
}

all() {
    ubuntu
    docker
    code
    vim
}

Action=$1
shift

case "$Action" in
    git) git ;;
    all) all ;;
    ubuntu) ubuntu ;;
    vim) vim ;;
    docker) docker ;;
    code) code ;;
    *)
        echo "Usage:"
        echo "./setup.sh all git ubuntu vim docker code"
        exit 1
        ;;
esac
exit 0
