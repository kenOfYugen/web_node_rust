assert = require 'assert'
pi_est_js = require './pi_est_js'
pi_est_asmjs = require './pi_est_asmjs'

if process.env.NODE_ENV is 'node_debug'
  assert (pi_est_js 1e5) is 3.13852
  assert (pi_est_asmjs 1e5) is 3.13852

console.time 'js'
pi_est_js 1e7
console.timeEnd 'js'

console.time 'asmjs'
pi_est_asmjs 1e7
console.timeEnd 'asmjs'
