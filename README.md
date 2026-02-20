# CatVTON Serverless Worker

ComfyUI-based virtual try-on worker for RunPod Serverless.

## What's inside

- **Base**: [runpod/worker-comfyui](https://github.com/runpod-workers/worker-comfyui) serverless worker
- **Model**: [CatVTON](https://github.com/Zheng-Chong/CatVTON) — lightweight VTON (< 8GB VRAM)
- **Node**: [ComfyUI_CatVTON_Wrapper](https://github.com/chflame163/ComfyUI_CatVTON_Wrapper)

## Deploy on RunPod

1. In RunPod console: **Serverless → New Endpoint → Start from GitHub Repo**
2. Select this repo, branch `main`, Dockerfile path `Dockerfile`
3. GPU: RTX 4000 Ada or higher (8GB+ VRAM)
4. Set **Min Workers: 0**, **Max Workers: 1**
5. Enable **Flash Boot**
6. Deploy
