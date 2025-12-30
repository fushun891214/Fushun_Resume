# 階段一：編譯工具（保留原有功能）
FROM debian:stable-slim AS builder
ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://deb.debian.org/debian stable main" > /etc/apt/sources.list && \
    echo "deb http://deb.debian.org/debian stable-updates main" >> /etc/apt/sources.list && \
    echo "deb http://deb.debian.org/debian-security stable-security main" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -qyf \
    curl jq make git \
    python3-pygments gnuplot \
    texlive-latex-recommended texlive-latex-extra texlive-fonts-recommended \
    texlive-xetex texlive-lang-chinese fonts-noto-cjk
RUN rm -rf /var/lib/apt/lists/*

WORKDIR /data
VOLUME ["/data"]

# 階段二：生產環境（Nginx + 禁用緩存）
FROM nginx:alpine AS production

# 配置 Nginx 禁用緩存
RUN echo 'server { listen 80; location / { root /usr/share/nginx/html; add_header Cache-Control "no-cache, no-store, must-revalidate"; add_header Pragma "no-cache"; add_header Expires "0"; } }' > /etc/nginx/conf.d/default.conf

EXPOSE 80
