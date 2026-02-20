FROM runpod/worker-comfyui:5.7.1-base

# CatVTON wrapper node + dependencies
RUN cd /comfyui/custom_nodes && \
    git clone https://github.com/chflame163/ComfyUI_CatVTON_Wrapper.git && \
    cd ComfyUI_CatVTON_Wrapper && \
    pip install --no-cache-dir -r requirements.txt

# Pre-download CatVTON models (~1.4GB)
RUN huggingface-cli download zhengchong/CatVTON \
    --local-dir /comfyui/models/CatVTON
