ARG dockerfrom
FROM $dockerfrom

RUN apt-get update
RUN apt-get install -y wget vim
RUN apt-get install -y python3 python3-pip
RUN pip install matplotlib pandas jupyterlab scikit-learn bokeh mkl numba

RUN apt-get install -y mpich
RUN pip install mpi4py

RUN ln -s /usr/bin/python3 /usr/bin/python

# work directory
ENV WORKDIR /work
RUN mkdir -p $WORKDIR


# Madagascar: madagascar-3.1.1.tar.gz
RUN apt-get install -y man
RUN pip install scons
ENV RSFROOT $WORKDIR/RSF

RUN mkdir -p $RSFROOT
RUN wget https://sourceforge.net/projects/rsf/files/madagascar/madagascar-3.1/madagascar-3.1.1.tar.gz -O $RSFROOT/madagascar-3.1.1.tar.gz
RUN cd $RSFROOT && tar -zxvf madagascar-3.1.1.tar.gz && cd madagascar-3.1.1 && ./configure --prefix=$RSFROOT && make install


# Seismic Unix: cwp_su_all_44R26.tgz
RUN apt-get install -y build-essential libx11-dev libxt-dev freeglut3 freeglut3-dev libxmu-dev libxi-dev gfortran
ENV CWPROOT $WORKDIR/SU
RUN mkdir -p $CWPROOT

RUN wget 'https://nextcloud.seismic-unix.org/s/LZpzc8jMzbWG9BZ/download?path=%2F&files=cwp_su_all_44R26.tgz' -O $CWPROOT/cwp_su_all_44R26.tgz
ENV SUFLAG XDRFLAG= 
RUN cd $CWPROOT && tar -zxvf cwp_su_all_44R26.tgz && cd $CWPROOT/src && cp configs/Makefile.config_Linux_Ubuntu_20.04 Makefile.config && touch LICENSE_44R26_ACCEPTED MAILHOME_44R26 && yes|make $SUFLAG install && make $SUFLAG xtinstall


# environment variables
ENV LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/local/lib"
RUN ln -s /usr/local/lib/libmkl_rt.so.2 /usr/local/lib/libmkl_rt.so


ENV PATH="${PATH}:$CWPROOT/bin:$RSFROOT/bin"

ENV PROFILE /etc/profile.d/pkgpl.sh
# prevent unbound variable error
ENV PYTHONPATH ''
ENV JULIA_LOAD_PATH ''
RUN echo "source ${RSFROOT}/share/madagascar/etc/env.sh" >> $PROFILE

ENV TERM xterm-256color

RUN apt-get install -y git
