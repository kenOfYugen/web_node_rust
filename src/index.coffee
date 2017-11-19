#assert = require 'assert'
pi_est_js = require './pi_est_js'

###
pi_est_asmjs_Loader = (cb) ->
  asmScript = document.createElement 'script'
  asmScript.src = "/src/pi_est_asmjs/pi_est_web.asm.js"
  asmScript.onload = ->
    pi_est_asmjs = AsmjsModuleInitializer().cwrap 'pi_est', 'number', ['number']
    cb pi_est_asmjs

  document.body.appendChild asmScript

pi_est_asmjs_Loader (pi_est_asmjs) ->
  console.log pi_est_asmjs 1e5
###

WasmModule = undefined

jsPath = '/src/pi_est_wasm/pi_est_web.js'
wasmPath = '/src/pi_est_wasm/pi_est_web.wasm'

load_wasm_module = () -> new Promise (resolve, reject) ->
  fetch wasmPath
    .then (response) -> if response.ok
      window.WasmModule = {}
      response.arrayBuffer()
    .then (buffer) ->
      window.WasmModule.wasmBinary = buffer
      script = document.createElement 'script'
      script.src = jsPath
      script.onload = ->
        WasmModule = window.WasmModule
        resolve()
      document.body.appendChild script

    .catch (e) -> console.error e; reject()

load_wasm_module()
  .then ->
    setTimeout ->
      pi_est_wasm = WasmModule.cwrap 'pi_est', 'number', ['number']
      console.log pi_est_wasm 1e5
    , 1000
