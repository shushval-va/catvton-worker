FROM runpod/worker-comfyui:5.7.1-base

# Python dependencies for CatVTON
RUN pip install --no-cache-dir diffusers accelerate transformers scipy

# Detectron2 v0.6 + DensePose (auto-masking for virtual try-on)
RUN pip install --no-cache-dir \
    git+https://github.com/facebookresearch/detectron2.git@v0.6 && \
    pip install --no-cache-dir \
    git+https://github.com/facebookresearch/detectron2.git@v0.6#subdirectory=projects/DensePose

# Official CatVTON ComfyUI node
RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/pzc163/Comfyui-CatVTON.git

# Pre-download models into HuggingFace cache (avoids runtime downloads)
# SD 1.5 Inpainting (~4.3GB)
RUN huggingface-cli download runwayml/stable-diffusion-inpainting
# CatVTON attention modules (~1.4GB)
RUN huggingface-cli download zhengchong/CatVTON
