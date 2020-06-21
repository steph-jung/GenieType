FROM nvidia/cuda

ENV PYTHONDONTWRITEBYTECODE=1

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    python3.8 python3-pip python3-setuptools python3-dev

WORKDIR /src

COPY requirements.txt /src/requirements.txt

RUN python3.8 -m pip install --no-cache-dir -r requirements.txt

RUN jupyter contrib nbextension install

COPY . /src

CMD jupyter notebook --port=8888 --no-browser --ip=0.0.0.0 --allow-root
