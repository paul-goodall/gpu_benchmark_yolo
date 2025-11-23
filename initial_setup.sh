#!/usr/bin/env zsh

YOUR_ENVS_DIR=/Path/To/Your/Envs/Dir
NEW_ENV_NAME=py311_gpu_test

NEW_ENV_PATH=${YOUR_ENVS_DIR}/${NEW_ENV_NAME}
conda create --prefix $NEW_ENV_PATH python=3.11
conda activate $NEW_ENV_PATH

# Installs for YOLO
pip3 install torch torchvision torchaudio
pip install -U ultralytics
