FROM voila:latest

USER root
RUN  pip3 install \
    torchvision

RUN dnf install -y libglvnd-glx

RUN pip3 install --upgrade pip && \
  pip3 install albumentations

RUN pip3 install opencv-python

RUN pip3 install segmentation-models-pytorch \
  sklearn \
  torchsummary \
  tqdm 
USER jovyan
COPY develop.ipynb /home/jovyan/voila/notebooks/
