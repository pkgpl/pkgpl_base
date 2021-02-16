# pkgpl_base
Base docker images for research in PKGPL.

## docker build

Set `DEVICE` in `Env.sh` and run `build.sh`

## Dockerfile

### FROM
- GPU version: horovod/horovod:0.20.0-tf2.3.0-torch1.6.0-mxnet1.6.0.post0-py3.7-cuda10.1
- CPU version: horovod/horovod:0.20.0-tf2.3.0-torch1.6.0-mxnet1.5.0-py3.7-cpu

### RUN pip install
- scikit-learn 
- pandas 
- jupyterlab 
- matplotlib 
- bokeh 
- mkl 
- numba 
- mpi4py

### Install seismic data processing packages
- Seismic Unix: cwp_su_all_44R19.tgz
- Madagascar: madagascar-3.1.1.tar.gz
