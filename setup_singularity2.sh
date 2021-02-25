#!/bin/bash

SINGULARITY_DIR=/opt/singularity-v2.5.1

[[ ":$PATH:" != *":${SINGULARITY_DIR}/bin:"* ]] && export PATH="${SINGULARITY_DIR}/bin:${PATH}"

[[ ":$LD_LIBRARY_PATH:" != *":${SINGULARITY_DIR}/lib:"* ]] && export LD_LIBRARY_PATH="${SINGULARITY_DIR}/bin:${LD_LIBRARY_PATH}"

export SINGULARITY_BIN=${SINGULARITY_DIR}/bin/singularity
