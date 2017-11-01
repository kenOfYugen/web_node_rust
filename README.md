# web_node_rust [WIP]

Experimental compilation workflow for Node.js and the Browser.

Tested with `node v9.0.0`, `rustc 1.23.0-nightly`, `emcc 1.37.22`, on macOS 10.13.

You must have `emsdk` setup and `emcc` exposed to the `PATH`.
For more information on how to achieve this, [check out this guide](https://davidmcneil.gitbooks.io/the-rusty-web/content/).

## Clone
`git clone --depth 1 https://github.com/kenOfYugen/web_node_rust.git`

## Install Dependencies
`cd web_node_rust && npm i`

just ignore the `node-gyp` error for now.

## Run the benchmark
`npm run compile-and-benchmark`


Sample output (2011 MacBook Pro 13')
```
Starting
pi_est_js x 1.16 ops/sec ±9.31% (7 runs sampled)
pi_est_asmjs x 0.34 ops/sec ±1.57% (5 runs sampled)
pi_est_wasm x 1.46 ops/sec ±0.64% (8 runs sampled)
Fastest is pi_est_wasm
```
