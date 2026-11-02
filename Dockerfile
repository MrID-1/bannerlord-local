FROM ubuntu:noble

ENV DEBIAN_FRONTEND=noninteractive

# Wine 32/64-bit ve gerekli bağımlılıkları kur
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y --no-install-recommends \
    wine64 \
    wine32 \
    tzdata \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /server

ENV TZ=Europe/Istanbul
ENV WINEPREFIX=/root/.wine

# UDP Portunu dış dünyaya aç
EXPOSE 4200/udp

CMD ["wine", "/server/BannerlordCoopServer.exe", "--no-tui"]