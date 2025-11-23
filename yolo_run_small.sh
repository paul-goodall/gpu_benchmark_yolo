
# Ammend Settings:
SET_DEVICE=mps
SET_MODEL=yolo11s-seg.pt
SET_IMGSIZE=256
SET_BATCHSIZE=20
SET_DATA_YAML=datasets/small_butterflies_yolo_dataset_256px/dataset.yaml

SET_PROJECT=runs/im${SET_IMGSIZE}px_batch${SET_BATCHSIZE}_dev${SET_DEVICE}


# Run YOLO training:
yolo \
  task=segment \
  mode=train \
  epochs=100 \
  device=${SET_DEVICE} \
  model=${SET_MODEL} \
  imgsz=${SET_IMGSIZE} \
  batch=${SET_BATCHSIZE} \
  data=${SET_DATA_YAML} \
  project=${SET_PROJECT}
