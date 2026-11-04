FROM python:3.12-slim
RUN apt-get update && apt-get install -y --no-install-recommends \
    chromium xvfb && rm -rf /var/lib/apt/lists/*
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
ENV CHROME_PATH=/usr/bin/chromium PORT=8191 MAX_WORKERS=2
EXPOSE 8191
CMD ["python", "service.py"]
