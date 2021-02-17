ARG dockerfrom
FROM $dockerfrom

# pip packages
RUN pip install matplotlib pandas jupyterlab scikit-learn bokeh mkl numba mpi4py

# environment variables
ENV CUDA_HOME /usr/local/cuda
ENV LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:${CUDA_HOME}/lib64:/usr/local/lib"

# work directory
ENV WORKDIR /work
RUN mkdir -p $WORKDIR


# Seismic Unix: cwp_su_all_44R19.tgz
RUN apt install -y build-essential libx11-dev libxt-dev freeglut3 freeglut3-dev libxmu-dev libxi-dev gfortran
ENV CWPROOT $WORKDIR/SU
RUN mkdir -p $CWPROOT

RUN wget 'https://nextcloud.seismic-unix.org/s/LZpzc8jMzbWG9BZ/download?path=%2F&files=cwp_su_all_44R19.tgz' -O $CWPROOT/cwp_su_all_44R19.tgz
ENV SUFLAG XDRFLAG= 
RUN cd $CWPROOT && tar -zxvf cwp_su_all_44R19.tgz && cd $CWPROOT/src && touch LICENSE_44R18_ACCEPTED MAILHOME_44R18 && yes|make $SUFLAG install && make $SUFLAG xtinstall

# Madagascar: madagascar-3.1.1.tar.gz
RUN apt install -y man
RUN pip install scons
ENV RSFROOT $WORKDIR/RSF

RUN mkdir -p $RSFROOT
RUN wget https://sourceforge.net/projects/rsf/files/madagascar/madagascar-3.1/madagascar-3.1.1.tar.gz -O $RSFROOT/madagascar-3.1.1.tar.gz
RUN cd $RSFROOT && tar -zxvf madagascar-3.1.1.tar.gz && cd madagascar-3.1.1 && ./configure --prefix=$RSFROOT && make install


ENV PATH="${PATH}:$CWPROOT/bin:$RSFROOT/bin"

ENV PROFILE /etc/profile.d/pkgpl.sh
# prevent unbound variable error
ENV PYTHONPATH ''
ENV JULIA_LOAD_PATH ''
RUN echo "source ${RSFROOT}/share/madagascar/etc/env.sh" >> $PROFILE

ENV TERM xterm-256color
