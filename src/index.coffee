#assert = require 'assert'
pi_est_js = require './pi_est_js'
pi_est_asmjs = require './pi_est_asmjs'

switch process.env.NODE_ENV
  when 'development'
    console.log 'development version'
  when 'production'
    console.log 'production version'
