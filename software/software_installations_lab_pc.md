﻿Fresh Ubuntu on PC ‘graphics_lab’

1. ```sudo apt install snapd```

    Snaps are basically an application compiled together with its dependencies and libraries – providing a sandboxed environment for the application to run. These are easier and faster to install, can receive latest updates and is confined from the OS and other apps. In other words, instead of worrying about DEB packages for Debian/Ubuntu, RPM packages for Fedora etc, you can use Snap package that would work on all Linux distributions with Snap support.
    
    Anyone can publish a snap in the store, however, you only see the snaps that are published to the stable release and has been reviewed. Use the below command to search for a snap:

    - search for snaps using ```sudo snap find libreoffice```
    - install a snap using ```sudo snap install <snap_name>```
    - update a snap using ```sudo snap refresh <snap_name>```
    - uninstall a snap using ```sudo snap remove <snap_name>```
    - list installed snaps using ```snap list```

2. 	```sudo snap install chromium```

3. 	```
    sudo apt install git
    git config --global user.name "christinazavou"
    git config --global user.email "czavou01@gmail.com"
    ``` 
    (you can check nano ~/.gitconfig)

4.	```sudo snap install pycharm-professional --classic```
    (use jetbrains login...where you can sign up with university email to get the license for free)

5. 	download cuda runfile and install it in specific location
	sudo sh cuda_10.1.105_418.39_linux.run --silent --toolkit --toolkitpath=/usr/local/cuda-10.1

	note: with nvidia-smi you don't see the CUDA version installed, but the maximum CUDA version that your driver supports.

6. 	download and install anaconda from 	https://www.anaconda.com/distribution/ and run 
	bash anaconda….sh
 	run source ~/.bashrc
 	check with conda –version

7. install sublime with snap

8. add in ~/.bashrc the option to switch cuda:
	function _switch_cuda {
	   v=$1
	   export PATH=$PATH:/usr/local/cuda-$v/bin
	   export CUDADIR=/usr/local/cuda-$v
	   export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-$v/lib64
	   nvcc --version
	}

9. download cudnn
	make file cudnn_install.sh with:

	read -p "CUDA-version: " ver
	cp cuda/include/cudnn.h /usr/local/cuda-"${ver}"/include
	cp cuda/lib64/libcudnn* /usr/local/cuda-"${ver}"/lib64
	chmod a+r /usr/local/cuda*/include/cudnn.h /usr/local/cuda*/lib64/libcudnn*

	download linux cudnn .tgz file and extract with
	tar -zxvf cudnn-10.1-linux-x64-v7.6.5.32.tgz

	then run sudo sh cudnn_install.sh and give it version 10.1
	then delete cuda folder


10. create conda environment with cuda using: https://github.com/christinazavou/ANNFASS/tree/master/software and running:
	make init-OCNN

	then check if ok with 
	from tensorflow.python.client import device_lib
    local_device_protos = device_lib.list_local_devices()
    local_device_protos

11. sudo snap install cmake --classi

12. wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.0.2-amd64.deb
	sudo apt install ./slack-desktop-*.deb

13. download teamviewer debian file
	double click it to install or run sudo apt install ./team...deb

14.	sudo apt update
	sudo apt install apt-transport-https ca-certificates curl software-properties-common
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
	sudo apt update
	apt-cache policy docker-ce
	sudo apt install docker-ce

	(now because i was seeing warnings about symlink cuda i removed /usr/local/cuda)

	sudo systemctl status docker (this starts docker)

	now to avoid typing sudo whenever we run the docker command i run:
	sudo usermod -aG docker ${USER}
	su - ${USER}

	now to confirm your user is added to docker group run:
	id -nG

	now to check if you can access and download images from Docker Hub run:
	docker run hello-world

	you can search for images in the hub with e.g. "docker search ubuntu"

	you can run interactively with e.g. "docker run -it ubuntu" and "exit" to exit
	to view all containers: "docker ps -a"
	to view last created container: "docker ps -l"
	to start a stopped container: "docker start <containerid>"
	to stop it "docker stop <containerid>"
	to remove it "docker rm <containerid>"

	when you start and stop a container ... the changes you make to it remain ... but once you remove the container you lose everything ... you can however save the state of a container as a new Docker image. use:
	"docker commit -m 'my change in ..' -a 'dezavou' <containerid> <repository>/<newimagename>"
	you can use for the repository your username. then with docker image ls you will see this new image. there is a way to push this in Docker Hub. You can also build images from Dockerfiles.

	start docker server with "systemctl start docker" or "sudo dockerd"


16.	sudo pycharm-professional (it needs sudo to look at docker daemon socket) (to get pycharm licence....use emailname@ucy.ac.cy email...)

notes while trying to compile OCNN:
	export PATH=/home/graphicslab/anaconda3/bin:$PATH
	conda --version

	sudo apt update
	sudo apt install software-properties-common
	sudo add-apt-repository ppa:deadsnakes/ppa
	sudo apt install python3.7
	python3.7 --version

	python3 --version

	echo $PATH | sed "s|/home/graphicslab/anaconda3/envs/OCNN2/bin:|/home/graphicslab/anaconda3/bin:|g"

notes while installing docker:
	i have an incorrect symbolic link with cuda10.2
	typing ls -la /usr/local shows the symbolic link: cuda -> /usr/local/cuda-10.2/
	i can create a symbolic link with:
	sudo ln -s /home/christina/Downloads /Downloads
	or 
	sudo ln -s /home/christina/Documents/Pictures ZavouPic and then cd ZavouPic and with pwd i will see /home/christina/ZavouPic
	or if you want the link to be permanent: remove flag -s
	to remove a symlink: just use "rm ZavouPic"