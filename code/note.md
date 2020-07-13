----------------


note that you can create a bash file under 
/etc/profile.d
with commands about environments that will run for all users !

e.g.
create .etc.profile.d/cuda.sh
with content;
export PATH=$PATH:/usr/local/cuda/bin
export CUDADIR=/usr/local/cuda


----------------


from 
https://notesbyair.github.io/blog/cs/2020-05-26-installing-multiple-versions-of-cuda-cudnn/ 
and 
https://docs.nvidia.com/deeplearning/sdk/cudnn-install/index.html
you can see that we need to download cudnn for linux instead for ubuntu so that we get the tar and we put the files in the correct cuda-** we want (i.e. to support different cuda versions)


==> download cudnn...tgz
move it under ~/tmp
extract it with "tar -xzvf cudnn...tgz"

and write cudnn_install.sh under ~/tmp:
```bash
read -p "CUDA-version: " ver
cp cuda/include/cudnn.h /usr/local/cuda-"${ver}"/include
cp cuda/lib64/libcudnn* /usr/local/cuda-"${ver}"/lib64
chmod a+r /usr/local/cuda*/include/cudnn.h /usr/local/cuda*/lib64/libcudnn*
```
and run it.



-----------------