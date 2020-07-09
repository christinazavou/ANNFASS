https://medium.com/analytics-vidhya/setting-up-a-deep-learning-system-with-ubuntu-nvidia-gpu-docker-and-tensorflow-c1be8844e49c
---

**_The key components that need to be installed on the host system are NVIDIA drivers, Docker and NVIDIA docker support. Everything else including CUDA, cuDNN, Python, TensorFlow and jupyter notebook will be running inside the docker._**


```commandline
sudo docker run -it --rm --gpus all -v $(pwd)/myjupyternotebooks:/tf/myjupyternotebooks -p 8888:8888 tensorflow/tensorflow:2.2.0-gpu-jupyter
```


One final thing need to be done to make sure that TensorFlow won’t run out of GPU memory during model training. This is to **_enable memory growth on GPU, which would stop TensorFlow from allocating the entire GPU memory on initialization._**

```python
import tensorflow as tf
physical_devices = tf.config.list_physical_devices('GPU')
tf.config.experimental.set_memory_growth(physical_devices[0], True)
```