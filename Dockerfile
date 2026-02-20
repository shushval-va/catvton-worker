FROM runpod/worker-comfyui:5.7.1-base

# CatVTON wrapper node
RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/chflame163/ComfyUI_CatVTON_Wrapper.git

# Install deps (base image already has pillow, scipy, transformers, torch)
RUN pip install --no-cache-dir "numpy<2.0" diffusers accelerate

# Pre-download CatVTON models (~1.4GB)
RUN huggingface-cli download zhengchong/CatVTON \
    --local-dir /comfyui/models/CatVTON
