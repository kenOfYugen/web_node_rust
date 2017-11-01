test = require 'tape'
type = require 'tcomb'

type.fail = (msg) -> throw new TypeError msg

implementations =
  pi_est_js: require '../src/pi_est_js'
  pi_est_asmjs: require '../src/pi_est_asmjs'
  pi_est_wasm: require '../src/pi_est_wasm'

test 'Accuracy of pi approximation implementations', (assert) ->
  for name, implementation of implementations
    assert.equal(
      type.Number implementation 1e5
      3.13852
      "#{name} produced the expected approximation of pi"
    )

  assert.end()
