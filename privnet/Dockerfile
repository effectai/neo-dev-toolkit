FROM microsoft/dotnet:1.1-sdk

ENV NEO_CLI_V 2.3.4

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       ca-certificates \
       wget \
       libleveldb-dev \
       sqlite3 \
       libsqlite3-dev \
       expect \
    && rm -rf /var/lib/apt/lists/*

RUN wget -O /opt/neo-cli.tar.gz https://github.com/neo-project/neo-cli/archive/v$NEO_CLI_V.tar.gz \
    && tar -zxf /opt/neo-cli.tar.gz -C /opt \
    && rm /opt/neo-cli.tar.gz

WORKDIR /opt/neo-cli-$NEO_CLI_V/neo-cli

RUN dotnet restore \
    && dotnet publish -c Release \
    && mv bin/Release/netcoreapp1.0 /opt/neo-cli \
    && rm -rf /opt/neo-cli-$NEO_CLI_V

WORKDIR /opt/neo-cli

ADD start_consensus.sh /opt/start_consensus.sh
CMD /opt/start_consensus.sh
