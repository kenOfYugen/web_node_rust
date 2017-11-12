pi_est_js = require '../src/pi_est_js'
pi_est_asmjs = require '../src/pi_est_asmjs'
pi_est_wasm = require '../src/pi_est_wasm'

benchmark = require 'benchmark'

suite = new benchmark.Suite

suite
  .add 'pi_est_js', {defer: false, fn: -> pi_est_js 1e7}
  .add 'pi_est_asmjs', {defer: false, fn: -> pi_est_asmjs 1e7}
  .add 'pi_est_wasm', {defer: false, fn: -> pi_est_wasm 1e7}

  .on 'start', -> console.log "Starting"
  .on 'cycle', (e) ->
      result = String e.target
      console.log """
        #{result}
      """
  .on 'complete', -> console.log 'Fastest is ' + @filter('fastest').map('name')
  .on 'error', (e) -> throw e
  .run({async: false})
