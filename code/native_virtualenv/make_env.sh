set_cuda() {
   v=$1
   export PATH=$PATH:/usr/local/cuda-$v/bin
   export CUDADIR=/usr/local/cuda-$v
   export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-$v/lib64
   nvcc --version
}

set_cuda 10.1 # note: if we switch shell (terminal) then we lose the link to cuda 10.1

virtualenv -p python3.8 venv

. venv/bin/activate

pip3 install tensorflow-gpu

