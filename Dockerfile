FROM kalilinux/kali-rolling

WORKDIR /root/

RUN apt update && apt upgrade -y && apt dist-upgrade -y

# Install Kali Large Meta Package
# https://security.stackexchange.com/a/234888
# kali-rolling image size ~= 150 MB (almost nothing installed, which is why I need this Dockerfile)
# kali-linux-large size ~= 9GB
# kali-linux-everything size ~= 15GB
RUN apt install -y \
    # kali-linux-headless \
    kali-tools-reverse-engineering

# Add 32 bit architecture
RUN dpkg --add-architecture i386
RUN apt update

# Cleanup
RUN apt autoremove -y

# Install additional metapackages
RUN apt install -y kali-tools-web
RUN apt install -y kali-tools-passwords
RUN apt install -y kali-tools-post-exploitation
RUN apt install -y kali-tools-crypto-stego
RUN apt install -y kali-tools-windows-resources

# Cleanup
RUN apt autoremove -y
