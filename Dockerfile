FROM ubuntu:20.04

ENV TZ=America/Los_Angeles

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone; \
	apt update; \
	apt upgrade -y; \
	apt install gnupg ca-certificates -y; \
	apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF; \ 
	echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" | tee /etc/apt/sources.list.d/mono-official-stable.list; \
	apt update; \
	apt install mono-devel mono-dbg msbuild make curl -y; \
	useradd -d /home/openra -m -s /sbin/nologin openra; \
	cd /home/openra; \
	curl -L https://github.com/OpenRA/OpenRA/releases/download/release-20210321/OpenRA-release-20210321-source.tar.bz2 | tar xj; \
	make; \
	chown -R openra:openra /home/openra/
   
EXPOSE 1234

USER openra

WORKDIR /home/openra/

CMD [ "/home/openra/launch-dedicated.sh" ]

