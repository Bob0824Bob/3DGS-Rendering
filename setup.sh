#!/bin/bash

# Download and install Miniconda
MINICONDA_INSTALLER=Miniconda3-latest-Linux-x86_64.sh
wget https://repo.anaconda.com/miniconda/$MINICONDA_INSTALLER -O ~/miniconda.sh
bash ~/miniconda.sh -b -p $HOME/miniconda
export PATH="$HOME/miniconda/bin:$PATH"

# Initialize Conda and create a new environment
conda init
source ~/.bashrc


## Modify Conda to use Tsinghua mirror
#echo "channels:
#  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/main/
#  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
#  - https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/r/
#  - defaults
#show_channel_urls: true" > ~/.condarc

conda create -n gaussian_splatting python=3.12 -y
conda activate gaussian_splatting

# Install PyTorch and related dependencies
#pip3 install torch torchvision torchaudio plyfile -i https://pypi.tuna.tsinghua.edu.cn/simple
pip3 install torch torchvision torchaudio plyfile

# Install CUDA Toolkit and other required libraries
conda install -y cudatoolkit tqdm

# Install additional Python dependencies
pip install submodules/diff-gaussian-rasterization \
            submodules/simple-knn \
            submodules/fused-ssim \
            opencv-python \
            joblib

# Clean up installation files
rm ~/miniconda.sh

echo "Installation completed!"

# Download Dataset

wget https://repo-sam.inria.fr/fungraph/3d-gaussian-splatting/datasets/input/tandt_db.zip
unzip tandt_db.zip

echo "Dataset Prepared!"
