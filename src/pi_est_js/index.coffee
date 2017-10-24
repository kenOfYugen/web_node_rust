PRNG = (seed) ->
  @seed = seed % 2147483647
  if @seed <= 0 then @seed += 2147483646

  ###
   * Returns a pseudo-random value between 1 and 2^32 - 2.
  ###

  @next = -> @seed = @seed * 16807 % 2147483647

  ###
   * Returns a pseudo-random floating point number in range [0, 1).
  ###

  @nextFloat = ->
    # We know that result of next() will be 1 to 2147483646 (inclusive).
    (@next() - 1) / 2147483646 #* (max - min) + min

  return

estimatePi = (points) ->
  inside = 0
  randseed = 1

  generator = new PRNG randseed

  for i in [0...points]
    x = generator.nextFloat()
    y = generator.nextFloat()

    inside += 1 if (x * x) + (y * y) <= 1

  inside / points * 4

module.exports = estimatePi
