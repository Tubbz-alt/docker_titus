FROM sfbaylaser/icarusalg:latest
LABEL Maintainer: Tracy Usher

# Download and build TITUS
RUN cd / && \
  source larsoft/products/setup && \
  setup mrb && \
  export MRB_PROJECT=icarusalg && \
  source icarusalg/localProducts_*/setup && \
  setup icarusalg v09_09_01 -q e19:prof && \
  git clone https://github.com/TITUS-EVD/gallery-framework && \
  cd gallery-framework && \
  git checkout develop && \
  source config/setup.sh && \
  make all && \
  cd UserDev/EventDisplay && \
  make 

COPY setup_titus.sh /setup_titus.sh
