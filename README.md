# neo-dev-toolkit

A simple way to setup your NEO private network with some development tools. It's a docker-compose file that starts a 4-node private network and connects small block explorer to it.

## State

The private network should function correctly, and tools like `neo-gui` and `neo-gui-develop` should be able to connect to it when configured correctly. For the state of the interface you can refer to [duplo](https://github.com/effectai/duplo).

## Components

The following components are included:

- a private network: 4 `neo-cli` nodes that run the consensus
- [duplo](https://github.com/effectai/duplo): a frontend for exploring and interacting with the privatenet
- [neo-clojure-clr](https://github.com/effectai/neo-clojure-clr): an extended RPC server that acts as backend for Duplo.

## Running

You will need `docker` and `docker-compose` to run this project.

```
$ git clone https://github.com/effectai/neo-dev-toolkit
$ cd neo-dev-toolkit
$ docker-compose up -d
```

Then visit http://localhost:8080 to view the interface.

## Credits

The private network is inspired by
[neo-privatenet-docker](https://github.com/CityOfZion/neo-privatenet-docker), and uses the same consensus keys and magic. Thanks to the CoZ developers for creating it. Some differences are:

- This project runs 1 node per container, instead of 4 nodes in 1 container
- The image is based on `microsoft/dotnet:1.1-runtime` and has smaller size (278MB compared to 2.11GB)
- Consensus keys are imported through ENV vars instead of wallet files
- The image compiles `neo-cli` from source
