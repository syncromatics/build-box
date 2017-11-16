FROM microsoft/dotnet:2-sdk

ENV MONO_VERSION 5.0.1.1

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb http://download.mono-project.com/repo/debian jessie/snapshots/$MONO_VERSION main" > /etc/apt/sources.list.d/mono-official.list
RUN apt-get update
RUN apt-get install -y mono-complete socat libgit2-dev git-all
RUN mozroots --import --sync

WORKDIR /build

RUN wget https://dist.nuget.org/win-x86-commandline/v4.3.0/nuget.exe
RUN echo 'mono --runtime=v4.0 /build/nuget.exe $*' > nuget
RUN chmod +x nuget

COPY build.sh .
COPY preload.cake .
RUN chmod +x build.sh
RUN ./build.sh -s preload.cake
RUN rm tools/Addins/Cake.Git/lib/linux/x86_64/libgit2-1196807.so
RUN ln -s /usr/lib/x86_64-linux-gnu/libgit2.so tools/Addins/Cake.Git/lib/linux/x86_64/libgit2-1196807.so

WORKDIR /usr/bin
RUN ln -s /build/nuget
RUN ln -s /build/build.sh cake
