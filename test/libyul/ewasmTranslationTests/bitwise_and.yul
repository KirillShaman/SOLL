// RUN: %soll -lang=Yul %s
// REQUIRES: YulFull
{
  sstore(0, and(not(0), 0))
  sstore(1, and(not(0), not(0)))
  sstore(2, and(not(0), 0xffffffffffffffff))
  sstore(3, and(not(0), 0xffffffffffffffffff00000000000000))
  sstore(4, and(not(0), 0xffffffffffffffffff00000000000000ffffffffffffffff))
  sstore(5, and(not(0), 0xffffffffffffffffff00000000000000ffffffffffffffff0000000000000000))
  sstore(6, and(not(0), 0xaaaaaaaaaaaaaa555555555555555555aa5555555555555aa555555555555555))
  sstore(7, and(
    0x5555555555550000aaaaaaaaaaaaaa000000aaaaaaaaa000000aaaaaaaaaaaaa,
    0xaaaaaaaaaaaaaa555555555555555555aa5555555555555aa555555555555555
  ))
}
// ----
// Trace:
// Memory dump:
//      0: 0000000000000000000000000000000000000000000000000000000000000007
// Storage dump:
//   0000000000000000000000000000000000000000000000000000000000000001: ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
//   0000000000000000000000000000000000000000000000000000000000000002: 000000000000000000000000000000000000000000000000ffffffffffffffff
//   0000000000000000000000000000000000000000000000000000000000000003: 00000000000000000000000000000000ffffffffffffffffff00000000000000
//   0000000000000000000000000000000000000000000000000000000000000004: 0000000000000000ffffffffffffffffff00000000000000ffffffffffffffff
//   0000000000000000000000000000000000000000000000000000000000000005: ffffffffffffffffff00000000000000ffffffffffffffff0000000000000000
//   0000000000000000000000000000000000000000000000000000000000000006: aaaaaaaaaaaaaa555555555555555555aa5555555555555aa555555555555555