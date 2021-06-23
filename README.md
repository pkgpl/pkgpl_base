# pkgpl_base
Base docker images for research in PKGPL.

## docker pull from [docker hub](https://hub.docker.com/r/pkgpl/pkgpl_base/tags)

`docker pull pkgpl/pkgpl_base`


## Dockerfile

### FROM [horovod](https://github.com/horovod/horovod)
- GPU version: horovod/horovod:0.22.1
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
- [Seismic Unix](https://github.com/JohnWStockwellJr/SeisUnix): cwp_su_all_44R19.tgz
- [Madagascar](https://github.com/ahay/src): madagascar-3.1.1.tar.gz


## docker build

Set `DEVICE` in `Env.sh` and run `build.sh`
