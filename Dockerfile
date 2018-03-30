FROM microsoft/dotnet:2.0-runtime

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       libleveldb-dev \
       sqlite3 \
       expect \
       unzip \
    && rm -rf /var/lib/apt/lists/*

ENV NEO_CLI_V 2.7.3
ENV NEO_CLI_FILE neo-cli-ubuntu.16.10-x64.zip
ENV WALLET_PASS test

WORKDIR /opt

RUN curl -L -O https://github.com/neo-project/neo-cli/releases/download/v$NEO_CLI_V/$NEO_CLI_FILE \
    && unzip $NEO_CLI_FILE \
    && rm $NEO_CLI_FILE

WORKDIR /opt/neo-cli

COPY start_consensus.sh /opt/start_consensus.sh
COPY protocol.json .
COPY config.json .

CMD /opt/start_consensus.sh
