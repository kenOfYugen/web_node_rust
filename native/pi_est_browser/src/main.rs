extern crate pi_est_c_wrapper;
//pub use pi_est_c_wrapper::pi_est;

#[no_mangle]
pub extern "C" fn pi_est(i: i32) -> i32 {
  4
}
fn main() {}
