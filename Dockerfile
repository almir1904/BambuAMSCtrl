FROM python:slim
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

#RUN apt-get update && \
#apt-get install -y \
#wget \
#unzip \
#curl \
#xvfb \
#libxi6 \
#libgconf-2-4 \
#chromium \
#chromium-driver \
#--no-install-recommends && \
#apt-get clean && \
#rm -rf /var/lib/apt/lists/*

RUN mkdir /app
COPY . /app/bambuamsctrl
WORKDIR /app/bambuamsctrl

RUN pip install --no-cache-dir -r requirements.txt && \
mkdir /app/bambuamsctrl/config && \
mkdir /app/bambuamsctrl/logs
CMD ["/app/bambuamsctrl/app.py"]
ENTRYPOINT ["python"]

#HEALTHCHECK --interval=30s --timeout=5s --retries=5 CMD curl --include --request GET http://localhost:8080/healthcheck || exit 1
