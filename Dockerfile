#
# Build step 1: build NEO core
#
FROM microsoft/dotnet:1.1-sdk as build-neo

ENV NEO_CLI_V 2.3.4

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       ca-certificates \
       wget \
       libleveldb-dev \
       sqlite3 \
       libsqlite3-dev \
    && rm -rf /var/lib/apt/lists/*

RUN wget -O /opt/neo-cli.tar.gz https://github.com/neo-project/neo-cli/archive/v$NEO_CLI_V.tar.gz \
    && tar -zxf /opt/neo-cli.tar.gz -C /opt \
    && rm /opt/neo-cli.tar.gz

WORKDIR /opt/neo-cli-$NEO_CLI_V/neo-cli

RUN dotnet restore \
    && dotnet publish -c Release \
    && mv bin/Release/netcoreapp1.0/publish /opt/neo-cli \
    && rm -rf /opt/neo-cli-$NEO_CLI_V

#
# Build step 2: application image
#
FROM microsoft/dotnet:1.1-runtime

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       libleveldb-dev \
       sqlite3 \
       expect \
    && rm -rf /var/lib/apt/lists/*

ENV WALLET_PASS test

COPY --from=0 /opt/neo-cli /opt/neo-cli
WORKDIR /opt/neo-cli

COPY start_consensus.sh /opt/start_consensus.sh
COPY protocol.json .
COPY config.json .

CMD /opt/start_consensus.sh
