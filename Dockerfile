FROM runpod/worker-comfyui:5.7.1-base

# CatVTON wrapper node
RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/chflame163/ComfyUI_CatVTON_Wrapper.git

# Install deps (base image already has pillow, scipy, transformers, torch)
RUN pip install --no-cache-dir "numpy<2.0" diffusers accelerate

# Pre-download CatVTON attention weights (~1.4GB)
RUN huggingface-cli download zhengchong/CatVTON \
    --local-dir /comfyui/models/CatVTON

# Pre-download SD 1.5 Inpainting base model (~4.3GB) required by CatVTON pipeline
RUN huggingface-cli download runwayml/stable-diffusion-inpainting \
    --local-dir /comfyui/models/CatVTON/stable-diffusion-inpainting
