getEnv = -> (Function('return this')())

isNode = -> getEnv().process?
isBrowser = -> getEnv().window?.document?

module.exports = {
  isNode
  isBrowser
}
