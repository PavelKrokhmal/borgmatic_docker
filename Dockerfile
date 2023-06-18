FROM python:3.10

ARG BORGBACKUP_VERSION=1.2.4
ARG BORGMATIC_VERSION=1.7.14

RUN apt update && apt -y upgrade

# Installation of Borgbackup
# https://borgbackup.readthedocs.io/en/stable/installation.html

RUN apt-get install -y python3 python3-dev python3-pip python3-virtualenv \
    libacl1-dev libacl1 \
    libssl-dev \
    liblz4-dev libzstd-dev libxxhash-dev \
    build-essential \
    pkg-config python3-pkgconfig

# Might be required if your tools are outdated
RUN pip install -U pip setuptools wheel

# Must be available before borgbackup is installed!
RUN pip install pkgconfig

# Install Borgbackup
RUN pip install borgbackup==$BORGBACKUP_VERSION

# Installation of Borgmatic
# https://torsion.org/borgmatic/docs/how-to/set-up-backups/

RUN pip install --user --upgrade borgmatic==$BORGMATIC_VERSION

RUN echo export 'PATH="$PATH:/root/.local/bin"' >> ~/.bashrc

RUN apt -y autoremove && apt clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*