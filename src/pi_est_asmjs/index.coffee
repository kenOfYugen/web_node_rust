pi_est_asmjs_module = require './pi_est_browser.asm.js'
pi_est_asmjs = pi_est_asmjs_module().cwrap 'pi_est', 'number', ['number']

module.exports = pi_est_asmjs
