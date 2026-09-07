FROM ubuntu:22.04
ENV MOTD=""
ENV SOURCE="https://github.com/OpenRA/OpenRA/releases/download/release-20250330/OpenRA-release-20250330-source.tar.bz2"
RUN apt update -y && apt upgrade -y && apt install -y bzip2 make curl dotnet-sdk-6.0
RUN NAME=$(basename "$SOURCE" .tar.bz2) && \
    useradd -d /home/openra -m -s /sbin/nologin openra && \
    cd /home/openra && \
    curl -JLO "$SOURCE" && \
    bzip2 -d "$NAME.tar.bz2" && \
    tar xvf "$NAME.tar" && \
    make && \
    rm -f "$NAME.tar"
RUN mkdir -p /home/openra/.config/openra/; \
	sed -i '/^SupportDir=.*/a echo $MOTD > /home/openra/.config/openra/motd.txt' /home/openra/launch-dedicated.sh; \
	chown -R openra:openra /home/openra/;
EXPOSE 1234
USER openra
WORKDIR /home/openra/
CMD [ "/home/openra/launch-dedicated.sh" ]

