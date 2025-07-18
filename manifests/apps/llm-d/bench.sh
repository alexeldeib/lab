export HF_TOKEN=""
genai-bench benchmark \
  --api-backend openai \
  --api-base http://vllm-0.vllm.llm-d:8080 \
  --api-key asdf \
  --task text-to-text \
  --api-model-name /weights/moonshotai/Kimi-K2-Instruct \
  --model-tokenizer deepseek-ai/DeepSeek-V3 \
  --max-time-per-run 15 \
  --max-requests-per-run 300 \
  --server-gpu-type H200 \
  --server-gpu-count 96 \
  --server-engine vLLM \
  --experiment-base-dir /weights/genai-bench \
  --num-workers 48 \
  --num-concurrency 128 \
  --num-concurrency 256 \
  --num-concurrency 512 \
  --num-concurrency 1024 \
  --num-concurrency 2048 \
  --num-concurrency 4096 \
  --traffic-scenario 'D(256,256)' \
  --traffic-scenario 'D(512,512)' \
  --traffic-scenario 'D(8192,256)' \
  --traffic-scenario 'D(256,8192)' \
  --traffic-scenario 'D(8192,8192)'

export GENAI_BENCH_LOGGING_LEVEL=DEBUG
export ENABLE_UI=false
export HF_TOKEN=""
genai-bench benchmark \
  --api-backend openai \
  --api-base https://infer.acebutt.xyz/cmd-a \
  --api-key asdf \
  --task text-to-text \
  --api-model-name /model-cache/CohereLabs/c4ai-command-a-03-2025 \
  --model-tokenizer /model-cache/CohereLabs/c4ai-command-a-03-2025 \
  --max-time-per-run 15 \
  --max-requests-per-run 3000 \
  --server-gpu-type H200 \
  --server-gpu-count 96 \
  --server-engine vLLM \
  --experiment-base-dir /model-cache/genai-bench/llm-d/vllm/1p1d \
  --num-workers 32 \
  --num-concurrency 1 \
  --num-concurrency 2 \
  --num-concurrency 4 \
  --num-concurrency 8 \
  --num-concurrency 16 \
  --num-concurrency 32 \
  --traffic-scenario 'D(1000,1000)' \
  --traffic-scenario 'D(10000,5000)' \
  --traffic-scenario 'D(10000,5000)'

export HF_TOKEN=""
genai-bench benchmark \
  --api-backend openai \
  --api-base https://aibrix.acebutt.xyz \
  --api-key asdf \
  --task text-to-text \
  --api-model-name cmd-a \
  --model-tokenizer /model-cache/CohereLabs/c4ai-command-a-03-2025 \
  --max-time-per-run 15 \
  --max-requests-per-run 3000 \
  --server-gpu-type H200 \
  --server-gpu-count 96 \
  --server-engine vLLM \
  --experiment-base-dir /model-cache/genai-bench/aibrix/vllm/tp4 \
  --num-workers 32 \
  --num-concurrency 1 \
  --num-concurrency 2 \
  --num-concurrency 4 \
  --num-concurrency 8 \
  --num-concurrency 16 \
  --num-concurrency 32 \
  --traffic-scenario 'D(1000,1000)' \
  --traffic-scenario 'D(10000,5000)' \
  --traffic-scenario 'D(10000,5000)'

curl -H "Model: llama-3-1-70b-instruct-srt" -X GET "https://ome.acebutt.xyz/v1/models"

curl -H "Model: llama-3-1-70b-instruct-srt" -X POST "https://ome.acebutt.xyz/v1/chat/completions" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "llama-3-2-1b-instruct",
    "messages": [
      {"role": "user", "content": "Hello! Can you introduce yourself?"}
    ],
    "max_tokens": 100,
    "temperature": 0.7
  }'

curl -sS -X POST http://vllm-0.vllm.llm-d:8080/v1/completions \
      -H 'accept: application/json' \
      -H 'Content-Type: application/json' \
      -d '{
        "model":"/weights/moonshotai/Kimi-K2-Instruct",
        "prompt":"Who are you?"
      }' | jq '.choices[0].text'

curl -sS -X GET https://aibrix.acebutt.xyz/v1/models | jq

curl -sS -X POST https://aibrix.acebutt.xyz/v1/completions \
      -H 'accept: application/json' \
      -H 'Content-Type: application/json' \
      -d '{
        "model":"cmd-a",
        "prompt":"Who are you?"
      }' | jq '.choices[0].text'


curl -sS -X GET https://infer.acebutt.xyz/cmd-a/v1/models | jq

curl -sS -X POST https://infer.acebutt.xyz/cmd-a/v1/completions \
      -H 'accept: application/json' \
      -H 'Content-Type: application/json' \
      -d '{
        "model":"/model-cache/CohereLabs/c4ai-command-a-03-2025",
        "prompt":"Who are you?"
      }' | jq '.choices[0].text'


curl -sS -X GET http://infer.acebutt.xyz/llama/v1/models | jq


curl -sS -X GET https://infer.acebutt.xyz/kimi-k2/v1/models | jq


curl -sS -X POST https://infer.acebutt.xyz/kimi-k2/v1/completions \
      -H 'accept: application/json' \
      -H 'Content-Type: application/json' \
      -d '{
        "model":"/weights/moonshotai/Kimi-K2-Instruct",
        "prompt":"Who are you?"
      }' | jq '.choices[0].text'

curl -sS -X POST https://infer.acebutt.xyz/deepseek/v1/completions \
      -H 'accept: application/json' \
      -H 'Content-Type: application/json' \
      -d '{
        "model":"deepseek-ai/DeepSeek-Coder-V2-Lite-Instruct",
        "prompt":"Who are you?"
      }' | jq '.choices[0].text'


export HF_TOKEN=""
genai-bench benchmark \
  --api-backend openai \
  --api-base https://infer.acebutt.xyz/llama \
  --api-key asdf \
  --task text-to-text \
  --api-model-name meta-llama/Llama-3.2-3B-Instruct \
  --model-tokenizer meta-llama/Llama-3.2-3B-Instruct \
  --max-time-per-run 15 \
  --max-requests-per-run 3000 \
  --server-gpu-type H200 \
  --server-gpu-count 96 \
  --server-engine vLLM \
  --experiment-base-dir /model-cache/genai-bench \
  --num-workers 32 \
  --num-concurrency 1 \
  --num-concurrency 2 \
  --num-concurrency 4 \
  --num-concurrency 8 \
  --num-concurrency 16 \
  --num-concurrency 32 \
  --traffic-scenario 'D(1024,128)' \
  --traffic-scenario 'D(480,300)' \
  --traffic-scenario 'D(8192,1024)'