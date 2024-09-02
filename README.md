## Run Dockerized Chrome Container

### Build Docker Image
```bash
docker build -t chrome-selenium .
```

### Run Docker Container
```bash
docker run -d -p 9222:9222 --name chrome-selenium chrome-selenium
```