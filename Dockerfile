FROM microsoft/dotnet:2-sdk

ENV MONO_VERSION 5.0.1.1

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb http://download.mono-project.com/repo/debian jessie/snapshots/$MONO_VERSION main" > /etc/apt/sources.list.d/mono-official.list
RUN apt-get update
RUN apt-get install -y mono-complete socat libgit2-dev unzip libssl1.0 libcurl3 jq
RUN mozroots --import --sync

WORKDIR /build

RUN wget https://dist.nuget.org/win-x86-commandline/v4.3.0/nuget.exe
RUN echo 'mono --runtime=v4.0 /build/nuget.exe $*' > nuget
RUN chmod +x nuget

COPY build.sh .
COPY preload.cake .
COPY setup.sh .
COPY ./gitver /usr/bin

RUN chmod +x build.sh
RUN chmod +x setup.sh
RUN ./build.sh -s preload.cake
RUN ./setup.sh

WORKDIR /usr/bin
RUN ln -s /build/nuget
RUN ln -s /build/build.sh cake

RUN echo "alias SYNC_VERSION=\"gitver | jq '.FullSemVer' -r\"" >> ~/.bashrc
RUN echo "alias SYNC_VERSION=\"gitver | jq '.FullSemVer' -r\"" >> /etc/profile
