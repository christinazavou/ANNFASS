Fresh Ubuntu on PC ‘graphics_lab’

1. ```sudo apt install snapd```

    Snaps are basically an application compiled together with its dependencies and libraries – providing a sandboxed environment for the application to run. These are easier and faster to install, can receive latest updates and is confined from the OS and other apps. In other words, instead of worrying about DEB packages for Debian/Ubuntu, RPM packages for Fedora etc, you can use Snap package that would work on all Linux distributions with Snap support.
    
    Anyone can publish a snap in the store, however, you only see the snaps that are published to the stable release and has been reviewed. Use the below command to search for a snap:

    - search for snaps using ```sudo snap find libreoffice```
    - install a snap using ```sudo snap install <snap_name>```
    - update a snap using ```sudo snap refresh <snap_name>```
    - uninstall a snap using ```sudo snap remove <snap_name>```
    - list installed snaps using ```snap list```

2. 	```sudo snap install chromium```

3. 	install and configure git
    ```
    sudo apt install git
    git config --global user.name "christinazavou"
    git config --global user.email "czavou01@gmail.com"
    ``` 
    (you can check nano ~/.gitconfig)

4.	```sudo snap install pycharm-professional --classic```
    (use jetbrains login...where you can sign up with university email-@ucy.ac.cy- to get the license for free)
    
5. ```sudo snap install sublime-text --classic```

6. ```sudo snap install cmake --classic```

7. ```sudo snap install slack --classic```
    (log in to channels: visualcomputi-k1f2355.slack.com, annfass.slack.com)

8. download teamviewer debian file
	double click it to install or run sudo apt install ./team...deb

9. download and install miniconda:

    Miniconda is a minimal free Conda installer. It’s a thin, bootstrap version that contains just conda, Python, the packages they depend on, and a limited range of other helpful modules like pip, zlib, and a few others.
    
    Install Anaconda as a non-root user, so that you dont need permissions from the administrator and is the most stable form of installation.
    
    By default conda init will add to your .bashrc file for the base environment, which will slow down your terminal. You can remove them in your .bashrc file or answer no to that question in the last step of your miniconda installation.
    
    And then add the following to your .bashrc file. 
    ```
   source ~/miniconda3/etc/profile.d/conda.sh
    if [[ -z ${CONDA_PREFIX+x} ]]; then
        export PATH="~/conda/bin:$PATH"
    fi
   ```
   To test it, open a new terminal tab or run ```source .bashrc```. Run ```conda activate base```, then you should see (base) in front of your Bash prompt. Now you can create another environment and activate it using Miniconda. If you frequently use one environment, you can also add conda activate [env] to your .bashrc file.
       
    **So to get miniconda**:
    ```
   wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
   chmod +x Miniconda3-latest-Linux-x86_64.sh
   ./Miniconda3-latest-Linux-x86_64.sh
   conda create -n newenv
    ```

10. setup cuda (so that we can run ML libraries like Tensorflow on the GPU)

    The CUDA Toolkit includes libraries, debugging and optimization tools, a compiler, documentation, and a runtime library to deploy your applications. It has components that support deep learning, linear algebra, signal processing, and parallel algorithms.
    
    Before you can install and run TensorFlow, you’ll need to install the CUDA drivers for your machine and the cuDNN updates for it.
    
    note: do the [preinstallation actions](https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html)
   	note: with nvidia-smi you don't see the CUDA version installed, but the maximum CUDA version that your driver supports.

    IN UBUNTU 20.04LTS:
    follow [this](https://towardsdatascience.com/installing-tensorflow-gpu-in-ubuntu-20-04-4ee3ca4cb75d)
        
        sudo apt install nvidia-cuda-toolkit
        nvcc -V
        whereis cuda
        tar -xvzf cudnn-10.1-linux-x64-v7.6.5.32.tgz
        sudo cp cuda/include/cudnn.h /usr/lib/cuda/include/
        sudo cp cuda/lib64/libcudnn* /usr/lib/cuda/lib64/ 
        sudo chmod a+r /usr/lib/cuda/include/cudnn.h 
        echo 'export LD_LIBRARY_PATH=/usr/lib/cuda/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc
        echo 'export LD_LIBRARY_PATH=/usr/lib/cuda/include:$LD_LIBRARY_PATH' >> ~/.bashrc
        source ~/.bashrc
        
        create conda environment with tensorflow that supports gpu with:
        conda create --name OCNN python=3.7
        conda install -c conda-forge yacs tqdm
        conda install -c anaconda tensorflow-gpu==1.14.0
		conda install gast==0.2.2 numpy==1.16.4
		
    IN UBUNTU 18.04LTS:

        download cuda runfile and install it in specific location
	    sudo sh cuda_10.1.105_418.39_linux.run --silent --toolkit --toolkitpath=/usr/local/cuda-10.1

        add in ~/.bashrc the option to switch cuda:
        function _switch_cuda {
           v=$1
           export PATH=$PATH:/usr/local/cuda-$v/bin
           export CUDADIR=/usr/local/cuda-$v
           export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-$v/lib64
           nvcc --version
        }

        download cudnn
	    make file cudnn_install.sh with:
        read -p "CUDA-version: " ver
        cp cuda/include/cudnn.h /usr/local/cuda-"${ver}"/include
        cp cuda/lib64/libcudnn* /usr/local/cuda-"${ver}"/lib64
        chmod a+r /usr/local/cuda*/include/cudnn.h /usr/local/cuda*/lib64/libcudnn*

        download linux cudnn .tgz file and extract with
        tar -zxvf cudnn-10.1-linux-x64-v7.6.5.32.tgz

        then run sudo sh cudnn_install.sh and give it version 10.1
        then delete cuda folder

        create conda environment with tensorflow supporting gpu using: https://github.com/christinazavou/ANNFASS/tree/master/software and running:
    	make init-OCNN

    check if your python environment that contains tensorflow is able to use your GPU:
    
        from tensorflow.python.client import device_lib
        local_device_protos = device_lib.list_local_devices()
        local_device_protos

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

16.	sudo pycharm-professional (it needs sudo to look at docker daemon socket) 

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


on Windows 10:
---
    - MATLAB (use UCY license)
    - Pycharm Professional (use UCY license)
    - Git (and run git config like above)
    - Visual Studio Community 2019
    - Cmake 
    	download zip file from https://cmake.org/download/
	extract it
	place it in desire location (I place it under C:\Program Files)
	edit the environment path (System Properties -> Environment Variables -> Add "C:\Program Files\cmake-3.18.2-win64-x64\bin" in Path)
	now if you open command prompt and write cmake you should see its usage
    - OpenGL
        get the binaries for your platform (in linux or mac you need to compile them. in windows there are pre-compiled binaries available) from https://www.glfw.org/download.html
    - OpenCV (install using the pre-built binaries)
	download .exe from https://sourceforge.net/projects/opencvlibrary/ and extract it (run .exe as administrator) under C:\Program Files\OpenCV4.4.0
	add envioronment path OPENCV_DIR to "C:\Program Files\OpenCV4.4.0\opencv\build\x64\vc15"
	add "%OPENCV_DIR%\bin" in PATH environment virable to be able to use dynamic library as well
	(note: you can open command prompt and type echo %PATH% to make sure it's correct)


 
	
