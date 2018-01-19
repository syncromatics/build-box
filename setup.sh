#!/bin/sh
cd /tmp
wget https://github.com/GitTools/GitVersion/releases/download/v4.0.0-beta.12/GitVersion_4.0.0-beta0012.zip
unzip GitVersion_4.0.0-beta0012.zip -d /opt/gitver
chmod +x /usr/bin/gitver

sed -i 's/lib\/linux\/x86_64\/libgit2-baa87df\.so/libgit2.so/g' /opt/gitver/LibGit2Sharp.dll.config
sed -i 's/lib\/linux\/x86_64\/libgit2-baa87df\.so/libgit2.so/g' /build/tools/gitversion.commandline.4.0.0-beta0012/GitVersion.CommandLine/tools/LibGit2Sharp.dll.config
