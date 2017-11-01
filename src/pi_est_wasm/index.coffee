pi_est_wasm_module = require './pi_est_browser.js'
pi_est_wasm = pi_est_wasm_module.cwrap 'pi_est', 'number', ['number']

module.exports = pi_est_wasm
