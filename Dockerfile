FROM --platform=linux/amd64/v2 python:3.11-slim

WORKDIR /app

COPY . /app

# Install chrome for python selenium
RUN apt-get update && apt-get install -y wget unzip
RUN wget -q https://mirror.cs.uchicago.edu/google-chrome/pool/main/g/google-chrome-stable/google-chrome-stable_114.0.5735.90-1_amd64.deb
RUN apt-get install ./google-chrome-stable_114.0.5735.90-1_amd64.deb -y --fix-missing

# Install chromedriver for selenium
RUN wget -q https://chromedriver.storage.googleapis.com/114.0.5735.90/chromedriver_linux64.zip
RUN unzip chromedriver_linux64.zip
RUN mv chromedriver /usr/local/bin/
RUN chmod +x /usr/local/bin/chromedriver

# Set environment variables for Chrome
ENV CHROME_BIN=/usr/bin/google-chrome
ENV CHROME_DRIVER=/usr/local/bin/chromedriver

# Install python dependencies
RUN pip install selenium

CMD ["python", "script.py"]
