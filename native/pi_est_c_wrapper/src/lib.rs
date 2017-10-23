#![feature(libc)]

extern crate estimate_pi;
use estimate_pi::estimate;

#[cfg(not(target_os = "emscripten"))]
use estimate_pi::ws;

extern crate libc;
use libc::{c_double};

#[no_mangle]
pub extern "C" fn pi_est(points: c_double) -> c_double {
  estimate(points)
}

#[cfg(not(target_os = "emscripten"))]
#[no_mangle]
pub extern "C" fn ws_pi_est(points: c_double) -> c_double {
  ws::estimate(points)
}

#[cfg(test)]
mod pi_est_tests {
  use pi_est;

  #[test]
  fn pi_est_test() {
    let pi = pi_est(1e6);
    assert!((pi > 2.64) && (pi < 3.64), "estimated pi value is more than 0.5 off");
  }
}

#[cfg(not(target_os = "emscripten"))]
#[cfg(test)]
mod ws_pi_est_tests {
 use ws_pi_est;

  #[test]
  fn ws_pi_est_test() {
    let pi = ws_pi_est(1e6);
    assert!((pi > 2.64) && (pi < 3.64), "estimated pi value is more than 0.5 off");
  }
}
