# neo-privatenet

A simple way to setup your NEO private network. It's a docker-compose file that starts a 4-node private network and connects small block explorer to it

## State

The private network should function correctly, and tools like `neo-gui` and `neo-gui-develop` should be able to connect to it when configured correctly. For the state of the interface you can refer to [duplo](https://github.com/effectai/duplo).

## Claim initial NEO

The following transaction claims the initial NEO to address `AQx6eiNF9fisZ5B1QqjQ7SY1yg1idM68Uv`. The private key for this address is `KzPGeTxYxXYgDtukphXnSoywJko2bRCUuupwcu6mw572mGKhYPB7`.

```
curl -v -d '{"jsonrpc": "2.0", "id":1, "method": "sendrawtransaction", "params": ["800000016da730b566db183bfceb863b780cd92dee2b497e5a023c322c1eaca81cf9ad7a0000019b7cffdaa674beae0f930ebe6085af9093e5fe56b34a5c220ccdcf6efc336fc50000c16ff286230064a82589888f4c8a8aca8dfb7f8fbca9900fac2b01c340920bb36b86c04744e9589c86c8f19cbe4d1cbaf97c27025687e86971f891f17f7c271544acd4eacc8b63b2747bf8dc08f3c1fd37bc3025013c751b9e0bfcfd35403d6bd6b478bf6acaaae73693d0221e3981f2124d024e06d0c9d68fe377b05ba7067cc2ace95a9192e1edd8cbfd7c56d17a8c0eb362b4d8f0ba09ea54faae43784084e4d8869ca684e2c3c72c8ae2f10a803f51c5f09c97f72e3d6f4eb3511ec7d7d095a25798090992b9697da6bb187b3616b4f30b3044da998a40cdaea0c0c4178b532102103a7f7dd016558597f7960d27c516a4394fd968b9e65155eb4b013e4040406e2102a7bc55fe8684e0119768d104ba30795bdcc86619e864add26156723ed185cd622102b3622bf4017bdfe317c58aed5f4c753f206b7db896046fa7d774bbc4bf7f8dc22103d90c07df63e690ce77912e10ab51acc944b66860237b608c4f8f8309e71ee69954ae"]}' localhost:10332
```

Alternatively the initial NEO can be claimed using the duplo interface.

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
- Its a bit smaller size (300MB vs 1.35GB), mostly because this image doesn't include `neo-python`

If you want a single-image privatenet or want to use `neo-python` I recommend to use the CoZ image.
