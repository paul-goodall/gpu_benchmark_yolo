# gpu_benchmark_yolo


## Initial Setup

I created a fresh environment for the purpose of running this benchmark, and I encourage you to do the same.
I've chosen to use Python=3.11 for this example.

Below are the Mac instrucitons for YOLO setup.  For your setup, refer to [YOLO quickstart page](https://docs.ultralytics.com/quickstart/)


```bash
YOUR_ENVS_DIR=/Path/To/Your/Envs/Dir
NEW_ENV_NAME=py311_gpu_test

NEW_ENV_PATH=${YOUR_ENVS_DIR}/${NEW_ENV_NAME}
conda create --prefix $NEW_ENV_PATH python=3.11
conda activate $NEW_ENV_PATH

# Installs for YOLO
pip3 install torch torchvision torchaudio
pip install -U ultralytics

```

## A note about the Benchmark Dataset

The dataset `butterflies_yolo_dataset_256px` in this repo is modified version of the butterfly dataset from GutHub user [@ayoolaolafenwa](https://github.com/ayoolaolafenwa/PixelLib)'s PixelLib repository. ([Source Data: Nature.zip](https://github.com/ayoolaolafenwa/PixelLib/releases/download/1.0.0/Nature.zip))

The preparation steps where as follows:
1. Separate out the butterfly data only
2. Convert from the LabelMe format to YOLO format using [labelme2yolo](https://pypi.org/project/labelme2yolo/)
3. Scale the largest image dimension to 256 pixels, using [ImageMagic's Mogrify](https://imagemagick.org/script/mogrify.php)

Point 3 is really to prevent YOLO from having to do the image rescaling on-the-fly.  Since YOLO uses normalised coordinated for the labels, the labels are apathetic to image size.
