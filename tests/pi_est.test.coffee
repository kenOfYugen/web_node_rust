test = require 'tape'
type = require 'tcomb'

type.fail = (msg) -> throw new TypeError msg
test 'Accuracy of pi approximation implementations', (assert) ->
  implementations =
    pi_est_js: require '../src/pi_est_js'
    pi_est_asmjs: require '../src/pi_est_asmjs'
    pi_est_wasm: require '../src/pi_est_wasm'

  for name, implementation of implementations
    assert.equal(
      type.Number implementation 1e5
      3.13852
      "#{name} produced the expected approximation of pi"
    )

  assert.end()
