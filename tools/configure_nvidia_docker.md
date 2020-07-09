
```commandline
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit
sudo systemctl restart docker
```

note:
to check if docker is running:
```commandline
docker version
```
if Server gives error response then it's not running.


note:
in order to use nvidia docker with cuda 10 i need to have on my laptop the correct driver with cuda 10.

then i can use nvidia docker with:
```commandline
docker run --gpus all nvidia/cuda:10.0-base nvidia-smi
```


**_Attention: Do not install an NVIDIA driver into the Docker image at docker build time**_

