FROM nvidia/cuda:11.0.3-devel-ubuntu20.04
ENV PYTHONUNBUFFERED=1


RUN apt-get update --fix-missing && \
  apt-get install -y wget bzip2 ca-certificates curl git vim-tiny zip unzip bzip2 python3-pip && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

RUN wget --quiet https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
  bash ~/miniconda.sh -b -p /opt/conda && \
  rm ~/miniconda.sh && \
  /opt/conda/bin/conda clean --all --yes && \
  ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
  echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
  echo "conda activate base" >> ~/.bashrc


ENV PATH /opt/conda/bin:$PATH
RUN conda update conda -y
