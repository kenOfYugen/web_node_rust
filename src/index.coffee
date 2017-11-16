#assert = require 'assert'
pi_est_js = require './pi_est_js'
pi_est_asmjs = require './pi_est_asmjs'
pi_est_wasm = require './pi_est_wasm'

console.log pi_est_js 1e5
console.log pi_est_asmjs 1e5
console.log pi_est_wasm 1e5
