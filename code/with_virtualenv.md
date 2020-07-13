pip3 install virtualenv

cd to the project folder

virtualenv -p python3.8 venv

source venv/bin/activate

ORIGINAL_LD_LIBRARY_PATH=$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/usr/local/cuda-10/lib64:/usr/local/cuda-10/extras/CUPTI/lib64:$LD_LIBRARY_PATH

pip3 install --upgrade tensorflow-gpu

deactivate

rm -rf venv

---
pip freeze > requirements.txt
pip install -r requirements.txt
---

