/*
  PRNG implementation
*/
pub struct PRNG {
  seed: f64,
}

impl PRNG {
  pub fn new(seed: f64) -> PRNG {
    let mut seed = seed % 2147483647.;
    if seed <= 0. { seed += 2147483646.; }
    PRNG {seed: seed}
  }

  pub fn next(&mut self) -> f64 {
    self.seed = self.seed * 16807. % 2147483647.;
    self.seed
  }

  pub fn next_float(&mut self) -> f64 {
    (self.next() - 1.) / 2147483646.
  }
}

/*
  Provide iterator interface for (x, y) tuple float generation
*/

pub struct FloatPointsIterator {
  prng: PRNG,
  floats: (f64, f64),
}

impl FloatPointsIterator {
  pub fn new(seed: f64) -> FloatPointsIterator {
    let mut prng = PRNG::new(seed);

    FloatPointsIterator { prng: prng, floats: (0., 0.) }
  }
}

impl Iterator for FloatPointsIterator {
  type Item = (f64, f64);
  fn next(&mut self) -> Option<(f64, f64)> {
    self.floats = (self.prng.next_float(), self.prng.next_float());
    Some(self.floats)
  }
}
