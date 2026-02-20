# CatVTON Serverless Worker

ComfyUI-based virtual try-on worker for RunPod Serverless.

## What's inside

- **Base**: [runpod/worker-comfyui](https://github.com/runpod-workers/worker-comfyui) serverless worker
- **Model**: [CatVTON](https://github.com/Zheng-Chong/CatVTON) — lightweight VTON (< 8GB VRAM)
- **Node**: [Comfyui-CatVTON](https://github.com/pzc163/Comfyui-CatVTON) official ComfyUI integration
- **Auto-masking**: Detectron2 + DensePose

## Deploy on RunPod

1. In RunPod console: **Serverless → New Endpoint → Start from GitHub Repo**
2. Select this repo, branch `main`, Dockerfile path `Dockerfile`
3. GPU: RTX 4000 Ada or higher (8GB+ VRAM)
4. Set **Min Workers: 0**, **Max Workers: 1**
5. Enable **Flash Boot**
6. Deploy

## API Usage

```bash
curl -X POST "https://api.runpod.ai/v2/${ENDPOINT_ID}/runsync" \
  -H "Authorization: Bearer ${RUNPOD_API_KEY}" \
  -H "Content-Type: application/json" \
  -d @request.json
```

The `request.json` should contain a ComfyUI workflow in API format with CatVTON nodes.
