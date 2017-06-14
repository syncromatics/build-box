FROM microsoft/dotnet:2-sdk

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb http://download.mono-project.com/repo/debian beta-jessie main" | tee /etc/apt/sources.list.d/mono-official-beta.list
RUN apt-get update
RUN apt-get install -y mono-complete
RUN mozroots --import --sync

WORKDIR /build
RUN wget https://dist.nuget.org/win-x86-commandline/v4.3.0-preview1/nuget.exe
RUN echo 'mono --runtime=v4.0 /build/nuget.exe $*' > nuget
RUN chmod +x nuget
WORKDIR /usr/bin
RUN ln -s /build/nuget