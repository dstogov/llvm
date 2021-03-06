; Test the MSA intrinsics that are encoded with the VEC instruction format.

; RUN: llc -march=mips -mattr=+msa < %s | FileCheck -check-prefix=ANYENDIAN %s
; RUN: llc -march=mipsel -mattr=+msa < %s | FileCheck -check-prefix=ANYENDIAN %s

@llvm_mips_and_v_b_ARG1 = global <16 x i8> <i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10, i8 11, i8 12, i8 13, i8 14, i8 15>, align 16
@llvm_mips_and_v_b_ARG2 = global <16 x i8> <i8 16, i8 17, i8 18, i8 19, i8 20, i8 21, i8 22, i8 23, i8 24, i8 25, i8 26, i8 27, i8 28, i8 29, i8 30, i8 31>, align 16
@llvm_mips_and_v_b_RES  = global <16 x i8> <i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0>, align 16

define void @llvm_mips_and_v_b_test() nounwind {
entry:
  %0 = load <16 x i8>* @llvm_mips_and_v_b_ARG1
  %1 = load <16 x i8>* @llvm_mips_and_v_b_ARG2
  %2 = bitcast <16 x i8> %0 to <16 x i8>
  %3 = bitcast <16 x i8> %1 to <16 x i8>
  %4 = tail call <16 x i8> @llvm.mips.and.v(<16 x i8> %2, <16 x i8> %3)
  %5 = bitcast <16 x i8> %4 to <16 x i8>
  store <16 x i8> %5, <16 x i8>* @llvm_mips_and_v_b_RES
  ret void
}

; ANYENDIAN: llvm_mips_and_v_b_test:
; ANYENDIAN: ld.b
; ANYENDIAN: ld.b
; ANYENDIAN: and.v
; ANYENDIAN: st.b
; ANYENDIAN: .size llvm_mips_and_v_b_test
;
@llvm_mips_and_v_h_ARG1 = global <8 x i16> <i16 0, i16 1, i16 2, i16 3, i16 4, i16 5, i16 6, i16 7>, align 16
@llvm_mips_and_v_h_ARG2 = global <8 x i16> <i16 8, i16 9, i16 10, i16 11, i16 12, i16 13, i16 14, i16 15>, align 16
@llvm_mips_and_v_h_RES  = global <8 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, align 16

define void @llvm_mips_and_v_h_test() nounwind {
entry:
  %0 = load <8 x i16>* @llvm_mips_and_v_h_ARG1
  %1 = load <8 x i16>* @llvm_mips_and_v_h_ARG2
  %2 = bitcast <8 x i16> %0 to <16 x i8>
  %3 = bitcast <8 x i16> %1 to <16 x i8>
  %4 = tail call <16 x i8> @llvm.mips.and.v(<16 x i8> %2, <16 x i8> %3)
  %5 = bitcast <16 x i8> %4 to <8 x i16>
  store <8 x i16> %5, <8 x i16>* @llvm_mips_and_v_h_RES
  ret void
}

; ANYENDIAN: llvm_mips_and_v_h_test:
; ANYENDIAN: ld.b
; ANYENDIAN: ld.b
; ANYENDIAN: and.v
; ANYENDIAN: st.b
; ANYENDIAN: .size llvm_mips_and_v_h_test
;
@llvm_mips_and_v_w_ARG1 = global <4 x i32> <i32 0, i32 1, i32 2, i32 3>, align 16
@llvm_mips_and_v_w_ARG2 = global <4 x i32> <i32 4, i32 5, i32 6, i32 7>, align 16
@llvm_mips_and_v_w_RES  = global <4 x i32> <i32 0, i32 0, i32 0, i32 0>, align 16

define void @llvm_mips_and_v_w_test() nounwind {
entry:
  %0 = load <4 x i32>* @llvm_mips_and_v_w_ARG1
  %1 = load <4 x i32>* @llvm_mips_and_v_w_ARG2
  %2 = bitcast <4 x i32> %0 to <16 x i8>
  %3 = bitcast <4 x i32> %1 to <16 x i8>
  %4 = tail call <16 x i8> @llvm.mips.and.v(<16 x i8> %2, <16 x i8> %3)
  %5 = bitcast <16 x i8> %4 to <4 x i32>
  store <4 x i32> %5, <4 x i32>* @llvm_mips_and_v_w_RES
  ret void
}

; ANYENDIAN: llvm_mips_and_v_w_test:
; ANYENDIAN: ld.b
; ANYENDIAN: ld.b
; ANYENDIAN: and.v
; ANYENDIAN: st.b
; ANYENDIAN: .size llvm_mips_and_v_w_test
;
@llvm_mips_and_v_d_ARG1 = global <2 x i64> <i64 0, i64 1>, align 16
@llvm_mips_and_v_d_ARG2 = global <2 x i64> <i64 2, i64 3>, align 16
@llvm_mips_and_v_d_RES  = global <2 x i64> <i64 0, i64 0>, align 16

define void @llvm_mips_and_v_d_test() nounwind {
entry:
  %0 = load <2 x i64>* @llvm_mips_and_v_d_ARG1
  %1 = load <2 x i64>* @llvm_mips_and_v_d_ARG2
  %2 = bitcast <2 x i64> %0 to <16 x i8>
  %3 = bitcast <2 x i64> %1 to <16 x i8>
  %4 = tail call <16 x i8> @llvm.mips.and.v(<16 x i8> %2, <16 x i8> %3)
  %5 = bitcast <16 x i8> %4 to <2 x i64>
  store <2 x i64> %5, <2 x i64>* @llvm_mips_and_v_d_RES
  ret void
}

; ANYENDIAN: llvm_mips_and_v_d_test:
; ANYENDIAN: ld.b
; ANYENDIAN: ld.b
; ANYENDIAN: and.v
; ANYENDIAN: st.b
; ANYENDIAN: .size llvm_mips_and_v_d_test
;
define void @and_v_b_test() nounwind {
entry:
  %0 = load <16 x i8>* @llvm_mips_and_v_b_ARG1
  %1 = load <16 x i8>* @llvm_mips_and_v_b_ARG2
  %2 = and <16 x i8> %0, %1
  store <16 x i8> %2, <16 x i8>* @llvm_mips_and_v_b_RES
  ret void
}

; CHECK: and_v_b_test:
; CHECK: ld.b
; CHECK: ld.b
; CHECK: and.v
; CHECK: st.b
; CHECK: .size and_v_b_test
;
define void @and_v_h_test() nounwind {
entry:
  %0 = load <8 x i16>* @llvm_mips_and_v_h_ARG1
  %1 = load <8 x i16>* @llvm_mips_and_v_h_ARG2
  %2 = and <8 x i16> %0, %1
  store <8 x i16> %2, <8 x i16>* @llvm_mips_and_v_h_RES
  ret void
}

; CHECK: and_v_h_test:
; CHECK: ld.h
; CHECK: ld.h
; CHECK: and.v
; CHECK: st.h
; CHECK: .size and_v_h_test
;

define void @and_v_w_test() nounwind {
entry:
  %0 = load <4 x i32>* @llvm_mips_and_v_w_ARG1
  %1 = load <4 x i32>* @llvm_mips_and_v_w_ARG2
  %2 = and <4 x i32> %0, %1
  store <4 x i32> %2, <4 x i32>* @llvm_mips_and_v_w_RES
  ret void
}

; CHECK: and_v_w_test:
; CHECK: ld.w
; CHECK: ld.w
; CHECK: and.v
; CHECK: st.w
; CHECK: .size and_v_w_test
;

define void @and_v_d_test() nounwind {
entry:
  %0 = load <2 x i64>* @llvm_mips_and_v_d_ARG1
  %1 = load <2 x i64>* @llvm_mips_and_v_d_ARG2
  %2 = and <2 x i64> %0, %1
  store <2 x i64> %2, <2 x i64>* @llvm_mips_and_v_d_RES
  ret void
}

; CHECK: and_v_d_test:
; CHECK: ld.d
; CHECK: ld.d
; CHECK: and.v
; CHECK: st.d
; CHECK: .size and_v_d_test
;
@llvm_mips_bmnz_v_b_ARG1 = global <16 x i8> <i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10, i8 11, i8 12, i8 13, i8 14, i8 15>, align 16
@llvm_mips_bmnz_v_b_ARG2 = global <16 x i8> <i8 16, i8 17, i8 18, i8 19, i8 20, i8 21, i8 22, i8 23, i8 24, i8 25, i8 26, i8 27, i8 28, i8 29, i8 30, i8 31>, align 16
@llvm_mips_bmnz_v_b_RES  = global <16 x i8> <i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0>, align 16

define void @llvm_mips_bmnz_v_b_test() nounwind {
entry:
  %0 = load <16 x i8>* @llvm_mips_bmnz_v_b_ARG1
  %1 = load <16 x i8>* @llvm_mips_bmnz_v_b_ARG2
  %2 = bitcast <16 x i8> %0 to <16 x i8>
  %3 = bitcast <16 x i8> %1 to <16 x i8>
  %4 = tail call <16 x i8> @llvm.mips.bmnz.v(<16 x i8> %2, <16 x i8> %3)
  %5 = bitcast <16 x i8> %4 to <16 x i8>
  store <16 x i8> %5, <16 x i8>* @llvm_mips_bmnz_v_b_RES
  ret void
}

; ANYENDIAN: llvm_mips_bmnz_v_b_test:
; ANYENDIAN: ld.b
; ANYENDIAN: ld.b
; ANYENDIAN: bmnz.v
; ANYENDIAN: st.b
; ANYENDIAN: .size llvm_mips_bmnz_v_b_test
;
@llvm_mips_bmnz_v_h_ARG1 = global <8 x i16> <i16 0, i16 1, i16 2, i16 3, i16 4, i16 5, i16 6, i16 7>, align 16
@llvm_mips_bmnz_v_h_ARG2 = global <8 x i16> <i16 8, i16 9, i16 10, i16 11, i16 12, i16 13, i16 14, i16 15>, align 16
@llvm_mips_bmnz_v_h_RES  = global <8 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, align 16

define void @llvm_mips_bmnz_v_h_test() nounwind {
entry:
  %0 = load <8 x i16>* @llvm_mips_bmnz_v_h_ARG1
  %1 = load <8 x i16>* @llvm_mips_bmnz_v_h_ARG2
  %2 = bitcast <8 x i16> %0 to <16 x i8>
  %3 = bitcast <8 x i16> %1 to <16 x i8>
  %4 = tail call <16 x i8> @llvm.mips.bmnz.v(<16 x i8> %2, <16 x i8> %3)
  %5 = bitcast <16 x i8> %4 to <8 x i16>
  store <8 x i16> %5, <8 x i16>* @llvm_mips_bmnz_v_h_RES
  ret void
}

; ANYENDIAN: llvm_mips_bmnz_v_h_test:
; ANYENDIAN: ld.b
; ANYENDIAN: ld.b
; ANYENDIAN: bmnz.v
; ANYENDIAN: st.b
; ANYENDIAN: .size llvm_mips_bmnz_v_h_test
;
@llvm_mips_bmnz_v_w_ARG1 = global <4 x i32> <i32 0, i32 1, i32 2, i32 3>, align 16
@llvm_mips_bmnz_v_w_ARG2 = global <4 x i32> <i32 4, i32 5, i32 6, i32 7>, align 16
@llvm_mips_bmnz_v_w_RES  = global <4 x i32> <i32 0, i32 0, i32 0, i32 0>, align 16

define void @llvm_mips_bmnz_v_w_test() nounwind {
entry:
  %0 = load <4 x i32>* @llvm_mips_bmnz_v_w_ARG1
  %1 = load <4 x i32>* @llvm_mips_bmnz_v_w_ARG2
  %2 = bitcast <4 x i32> %0 to <16 x i8>
  %3 = bitcast <4 x i32> %1 to <16 x i8>
  %4 = tail call <16 x i8> @llvm.mips.bmnz.v(<16 x i8> %2, <16 x i8> %3)
  %5 = bitcast <16 x i8> %4 to <4 x i32>
  store <4 x i32> %5, <4 x i32>* @llvm_mips_bmnz_v_w_RES
  ret void
}

; ANYENDIAN: llvm_mips_bmnz_v_w_test:
; ANYENDIAN: ld.b
; ANYENDIAN: ld.b
; ANYENDIAN: bmnz.v
; ANYENDIAN: st.b
; ANYENDIAN: .size llvm_mips_bmnz_v_w_test
;
@llvm_mips_bmnz_v_d_ARG1 = global <2 x i64> <i64 0, i64 1>, align 16
@llvm_mips_bmnz_v_d_ARG2 = global <2 x i64> <i64 2, i64 3>, align 16
@llvm_mips_bmnz_v_d_RES  = global <2 x i64> <i64 0, i64 0>, align 16

define void @llvm_mips_bmnz_v_d_test() nounwind {
entry:
  %0 = load <2 x i64>* @llvm_mips_bmnz_v_d_ARG1
  %1 = load <2 x i64>* @llvm_mips_bmnz_v_d_ARG2
  %2 = bitcast <2 x i64> %0 to <16 x i8>
  %3 = bitcast <2 x i64> %1 to <16 x i8>
  %4 = tail call <16 x i8> @llvm.mips.bmnz.v(<16 x i8> %2, <16 x i8> %3)
  %5 = bitcast <16 x i8> %4 to <2 x i64>
  store <2 x i64> %5, <2 x i64>* @llvm_mips_bmnz_v_d_RES
  ret void
}

; ANYENDIAN: llvm_mips_bmnz_v_d_test:
; ANYENDIAN: ld.b
; ANYENDIAN: ld.b
; ANYENDIAN: bmnz.v
; ANYENDIAN: st.b
; ANYENDIAN: .size llvm_mips_bmnz_v_d_test
;
@llvm_mips_bmz_v_b_ARG1 = global <16 x i8> <i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10, i8 11, i8 12, i8 13, i8 14, i8 15>, align 16
@llvm_mips_bmz_v_b_ARG2 = global <16 x i8> <i8 16, i8 17, i8 18, i8 19, i8 20, i8 21, i8 22, i8 23, i8 24, i8 25, i8 26, i8 27, i8 28, i8 29, i8 30, i8 31>, align 16
@llvm_mips_bmz_v_b_RES  = global <16 x i8> <i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0>, align 16

define void @llvm_mips_bmz_v_b_test() nounwind {
entry:
  %0 = load <16 x i8>* @llvm_mips_bmz_v_b_ARG1
  %1 = load <16 x i8>* @llvm_mips_bmz_v_b_ARG2
  %2 = bitcast <16 x i8> %0 to <16 x i8>
  %3 = bitcast <16 x i8> %1 to <16 x i8>
  %4 = tail call <16 x i8> @llvm.mips.bmz.v(<16 x i8> %2, <16 x i8> %3)
  %5 = bitcast <16 x i8> %4 to <16 x i8>
  store <16 x i8> %5, <16 x i8>* @llvm_mips_bmz_v_b_RES
  ret void
}

; ANYENDIAN: llvm_mips_bmz_v_b_test:
; ANYENDIAN: ld.b
; ANYENDIAN: ld.b
; ANYENDIAN: bmz.v
; ANYENDIAN: st.b
; ANYENDIAN: .size llvm_mips_bmz_v_b_test
;
@llvm_mips_bmz_v_h_ARG1 = global <8 x i16> <i16 0, i16 1, i16 2, i16 3, i16 4, i16 5, i16 6, i16 7>, align 16
@llvm_mips_bmz_v_h_ARG2 = global <8 x i16> <i16 8, i16 9, i16 10, i16 11, i16 12, i16 13, i16 14, i16 15>, align 16
@llvm_mips_bmz_v_h_RES  = global <8 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, align 16

define void @llvm_mips_bmz_v_h_test() nounwind {
entry:
  %0 = load <8 x i16>* @llvm_mips_bmz_v_h_ARG1
  %1 = load <8 x i16>* @llvm_mips_bmz_v_h_ARG2
  %2 = bitcast <8 x i16> %0 to <16 x i8>
  %3 = bitcast <8 x i16> %1 to <16 x i8>
  %4 = tail call <16 x i8> @llvm.mips.bmz.v(<16 x i8> %2, <16 x i8> %3)
  %5 = bitcast <16 x i8> %4 to <8 x i16>
  store <8 x i16> %5, <8 x i16>* @llvm_mips_bmz_v_h_RES
  ret void
}

; ANYENDIAN: llvm_mips_bmz_v_h_test:
; ANYENDIAN: ld.b
; ANYENDIAN: ld.b
; ANYENDIAN: bmz.v
; ANYENDIAN: st.b
; ANYENDIAN: .size llvm_mips_bmz_v_h_test
;
@llvm_mips_bmz_v_w_ARG1 = global <4 x i32> <i32 0, i32 1, i32 2, i32 3>, align 16
@llvm_mips_bmz_v_w_ARG2 = global <4 x i32> <i32 4, i32 5, i32 6, i32 7>, align 16
@llvm_mips_bmz_v_w_RES  = global <4 x i32> <i32 0, i32 0, i32 0, i32 0>, align 16

define void @llvm_mips_bmz_v_w_test() nounwind {
entry:
  %0 = load <4 x i32>* @llvm_mips_bmz_v_w_ARG1
  %1 = load <4 x i32>* @llvm_mips_bmz_v_w_ARG2
  %2 = bitcast <4 x i32> %0 to <16 x i8>
  %3 = bitcast <4 x i32> %1 to <16 x i8>
  %4 = tail call <16 x i8> @llvm.mips.bmz.v(<16 x i8> %2, <16 x i8> %3)
  %5 = bitcast <16 x i8> %4 to <4 x i32>
  store <4 x i32> %5, <4 x i32>* @llvm_mips_bmz_v_w_RES
  ret void
}

; ANYENDIAN: llvm_mips_bmz_v_w_test:
; ANYENDIAN: ld.b
; ANYENDIAN: ld.b
; ANYENDIAN: bmz.v
; ANYENDIAN: st.b
; ANYENDIAN: .size llvm_mips_bmz_v_w_test
;
@llvm_mips_bmz_v_d_ARG1 = global <2 x i64> <i64 0, i64 1>, align 16
@llvm_mips_bmz_v_d_ARG2 = global <2 x i64> <i64 2, i64 3>, align 16
@llvm_mips_bmz_v_d_RES  = global <2 x i64> <i64 0, i64 0>, align 16

define void @llvm_mips_bmz_v_d_test() nounwind {
entry:
  %0 = load <2 x i64>* @llvm_mips_bmz_v_d_ARG1
  %1 = load <2 x i64>* @llvm_mips_bmz_v_d_ARG2
  %2 = bitcast <2 x i64> %0 to <16 x i8>
  %3 = bitcast <2 x i64> %1 to <16 x i8>
  %4 = tail call <16 x i8> @llvm.mips.bmz.v(<16 x i8> %2, <16 x i8> %3)
  %5 = bitcast <16 x i8> %4 to <2 x i64>
  store <2 x i64> %5, <2 x i64>* @llvm_mips_bmz_v_d_RES
  ret void
}

; ANYENDIAN: llvm_mips_bmz_v_d_test:
; ANYENDIAN: ld.b
; ANYENDIAN: ld.b
; ANYENDIAN: bmz.v
; ANYENDIAN: st.b
; ANYENDIAN: .size llvm_mips_bmz_v_d_test
;
@llvm_mips_bsel_v_b_ARG1 = global <16 x i8> <i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10, i8 11, i8 12, i8 13, i8 14, i8 15>, align 16
@llvm_mips_bsel_v_b_ARG2 = global <16 x i8> <i8 16, i8 17, i8 18, i8 19, i8 20, i8 21, i8 22, i8 23, i8 24, i8 25, i8 26, i8 27, i8 28, i8 29, i8 30, i8 31>, align 16
@llvm_mips_bsel_v_b_RES  = global <16 x i8> <i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0>, align 16

define void @llvm_mips_bsel_v_b_test() nounwind {
entry:
  %0 = load <16 x i8>* @llvm_mips_bsel_v_b_ARG1
  %1 = load <16 x i8>* @llvm_mips_bsel_v_b_ARG2
  %2 = bitcast <16 x i8> %0 to <16 x i8>
  %3 = bitcast <16 x i8> %1 to <16 x i8>
  %4 = tail call <16 x i8> @llvm.mips.bsel.v(<16 x i8> %2, <16 x i8> %2, <16 x i8> %3)
  %5 = bitcast <16 x i8> %4 to <16 x i8>
  store <16 x i8> %5, <16 x i8>* @llvm_mips_bsel_v_b_RES
  ret void
}

; ANYENDIAN: llvm_mips_bsel_v_b_test:
; ANYENDIAN: ld.b
; ANYENDIAN: ld.b
; ANYENDIAN: bsel.v
; ANYENDIAN: st.b
; ANYENDIAN: .size llvm_mips_bsel_v_b_test
;
@llvm_mips_bsel_v_h_ARG1 = global <8 x i16> <i16 0, i16 1, i16 2, i16 3, i16 4, i16 5, i16 6, i16 7>, align 16
@llvm_mips_bsel_v_h_ARG2 = global <8 x i16> <i16 8, i16 9, i16 10, i16 11, i16 12, i16 13, i16 14, i16 15>, align 16
@llvm_mips_bsel_v_h_RES  = global <8 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, align 16

define void @llvm_mips_bsel_v_h_test() nounwind {
entry:
  %0 = load <8 x i16>* @llvm_mips_bsel_v_h_ARG1
  %1 = load <8 x i16>* @llvm_mips_bsel_v_h_ARG2
  %2 = bitcast <8 x i16> %0 to <16 x i8>
  %3 = bitcast <8 x i16> %1 to <16 x i8>
  %4 = tail call <16 x i8> @llvm.mips.bsel.v(<16 x i8> %2, <16 x i8> %2, <16 x i8> %3)
  %5 = bitcast <16 x i8> %4 to <8 x i16>
  store <8 x i16> %5, <8 x i16>* @llvm_mips_bsel_v_h_RES
  ret void
}

; ANYENDIAN: llvm_mips_bsel_v_h_test:
; ANYENDIAN: ld.b
; ANYENDIAN: ld.b
; ANYENDIAN: bsel.v
; ANYENDIAN: st.b
; ANYENDIAN: .size llvm_mips_bsel_v_h_test
;
@llvm_mips_bsel_v_w_ARG1 = global <4 x i32> <i32 0, i32 1, i32 2, i32 3>, align 16
@llvm_mips_bsel_v_w_ARG2 = global <4 x i32> <i32 4, i32 5, i32 6, i32 7>, align 16
@llvm_mips_bsel_v_w_RES  = global <4 x i32> <i32 0, i32 0, i32 0, i32 0>, align 16

define void @llvm_mips_bsel_v_w_test() nounwind {
entry:
  %0 = load <4 x i32>* @llvm_mips_bsel_v_w_ARG1
  %1 = load <4 x i32>* @llvm_mips_bsel_v_w_ARG2
  %2 = bitcast <4 x i32> %0 to <16 x i8>
  %3 = bitcast <4 x i32> %1 to <16 x i8>
  %4 = tail call <16 x i8> @llvm.mips.bsel.v(<16 x i8> %2, <16 x i8> %2, <16 x i8> %3)
  %5 = bitcast <16 x i8> %4 to <4 x i32>
  store <4 x i32> %5, <4 x i32>* @llvm_mips_bsel_v_w_RES
  ret void
}

; ANYENDIAN: llvm_mips_bsel_v_w_test:
; ANYENDIAN: ld.b
; ANYENDIAN: ld.b
; ANYENDIAN: bsel.v
; ANYENDIAN: st.b
; ANYENDIAN: .size llvm_mips_bsel_v_w_test
;
@llvm_mips_bsel_v_d_ARG1 = global <2 x i64> <i64 0, i64 1>, align 16
@llvm_mips_bsel_v_d_ARG2 = global <2 x i64> <i64 2, i64 3>, align 16
@llvm_mips_bsel_v_d_RES  = global <2 x i64> <i64 0, i64 0>, align 16

define void @llvm_mips_bsel_v_d_test() nounwind {
entry:
  %0 = load <2 x i64>* @llvm_mips_bsel_v_d_ARG1
  %1 = load <2 x i64>* @llvm_mips_bsel_v_d_ARG2
  %2 = bitcast <2 x i64> %0 to <16 x i8>
  %3 = bitcast <2 x i64> %1 to <16 x i8>
  %4 = tail call <16 x i8> @llvm.mips.bsel.v(<16 x i8> %2, <16 x i8> %2, <16 x i8> %3)
  %5 = bitcast <16 x i8> %4 to <2 x i64>
  store <2 x i64> %5, <2 x i64>* @llvm_mips_bsel_v_d_RES
  ret void
}

; ANYENDIAN: llvm_mips_bsel_v_d_test:
; ANYENDIAN: ld.b
; ANYENDIAN: ld.b
; ANYENDIAN: bsel.v
; ANYENDIAN: st.b
; ANYENDIAN: .size llvm_mips_bsel_v_d_test
;
@llvm_mips_nor_v_b_ARG1 = global <16 x i8> <i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10, i8 11, i8 12, i8 13, i8 14, i8 15>, align 16
@llvm_mips_nor_v_b_ARG2 = global <16 x i8> <i8 16, i8 17, i8 18, i8 19, i8 20, i8 21, i8 22, i8 23, i8 24, i8 25, i8 26, i8 27, i8 28, i8 29, i8 30, i8 31>, align 16
@llvm_mips_nor_v_b_RES  = global <16 x i8> <i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0>, align 16

define void @llvm_mips_nor_v_b_test() nounwind {
entry:
  %0 = load <16 x i8>* @llvm_mips_nor_v_b_ARG1
  %1 = load <16 x i8>* @llvm_mips_nor_v_b_ARG2
  %2 = bitcast <16 x i8> %0 to <16 x i8>
  %3 = bitcast <16 x i8> %1 to <16 x i8>
  %4 = tail call <16 x i8> @llvm.mips.nor.v(<16 x i8> %2, <16 x i8> %3)
  %5 = bitcast <16 x i8> %4 to <16 x i8>
  store <16 x i8> %5, <16 x i8>* @llvm_mips_nor_v_b_RES
  ret void
}

; ANYENDIAN: llvm_mips_nor_v_b_test:
; ANYENDIAN: ld.b
; ANYENDIAN: ld.b
; ANYENDIAN: nor.v
; ANYENDIAN: st.b
; ANYENDIAN: .size llvm_mips_nor_v_b_test
;
@llvm_mips_nor_v_h_ARG1 = global <8 x i16> <i16 0, i16 1, i16 2, i16 3, i16 4, i16 5, i16 6, i16 7>, align 16
@llvm_mips_nor_v_h_ARG2 = global <8 x i16> <i16 8, i16 9, i16 10, i16 11, i16 12, i16 13, i16 14, i16 15>, align 16
@llvm_mips_nor_v_h_RES  = global <8 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, align 16

define void @llvm_mips_nor_v_h_test() nounwind {
entry:
  %0 = load <8 x i16>* @llvm_mips_nor_v_h_ARG1
  %1 = load <8 x i16>* @llvm_mips_nor_v_h_ARG2
  %2 = bitcast <8 x i16> %0 to <16 x i8>
  %3 = bitcast <8 x i16> %1 to <16 x i8>
  %4 = tail call <16 x i8> @llvm.mips.nor.v(<16 x i8> %2, <16 x i8> %3)
  %5 = bitcast <16 x i8> %4 to <8 x i16>
  store <8 x i16> %5, <8 x i16>* @llvm_mips_nor_v_h_RES
  ret void
}

; ANYENDIAN: llvm_mips_nor_v_h_test:
; ANYENDIAN: ld.b
; ANYENDIAN: ld.b
; ANYENDIAN: nor.v
; ANYENDIAN: st.b
; ANYENDIAN: .size llvm_mips_nor_v_h_test
;
@llvm_mips_nor_v_w_ARG1 = global <4 x i32> <i32 0, i32 1, i32 2, i32 3>, align 16
@llvm_mips_nor_v_w_ARG2 = global <4 x i32> <i32 4, i32 5, i32 6, i32 7>, align 16
@llvm_mips_nor_v_w_RES  = global <4 x i32> <i32 0, i32 0, i32 0, i32 0>, align 16

define void @llvm_mips_nor_v_w_test() nounwind {
entry:
  %0 = load <4 x i32>* @llvm_mips_nor_v_w_ARG1
  %1 = load <4 x i32>* @llvm_mips_nor_v_w_ARG2
  %2 = bitcast <4 x i32> %0 to <16 x i8>
  %3 = bitcast <4 x i32> %1 to <16 x i8>
  %4 = tail call <16 x i8> @llvm.mips.nor.v(<16 x i8> %2, <16 x i8> %3)
  %5 = bitcast <16 x i8> %4 to <4 x i32>
  store <4 x i32> %5, <4 x i32>* @llvm_mips_nor_v_w_RES
  ret void
}

; ANYENDIAN: llvm_mips_nor_v_w_test:
; ANYENDIAN: ld.b
; ANYENDIAN: ld.b
; ANYENDIAN: nor.v
; ANYENDIAN: st.b
; ANYENDIAN: .size llvm_mips_nor_v_w_test
;
@llvm_mips_nor_v_d_ARG1 = global <2 x i64> <i64 0, i64 1>, align 16
@llvm_mips_nor_v_d_ARG2 = global <2 x i64> <i64 2, i64 3>, align 16
@llvm_mips_nor_v_d_RES  = global <2 x i64> <i64 0, i64 0>, align 16

define void @llvm_mips_nor_v_d_test() nounwind {
entry:
  %0 = load <2 x i64>* @llvm_mips_nor_v_d_ARG1
  %1 = load <2 x i64>* @llvm_mips_nor_v_d_ARG2
  %2 = bitcast <2 x i64> %0 to <16 x i8>
  %3 = bitcast <2 x i64> %1 to <16 x i8>
  %4 = tail call <16 x i8> @llvm.mips.nor.v(<16 x i8> %2, <16 x i8> %3)
  %5 = bitcast <16 x i8> %4 to <2 x i64>
  store <2 x i64> %5, <2 x i64>* @llvm_mips_nor_v_d_RES
  ret void
}

; ANYENDIAN: llvm_mips_nor_v_d_test:
; ANYENDIAN: ld.b
; ANYENDIAN: ld.b
; ANYENDIAN: nor.v
; ANYENDIAN: st.b
; ANYENDIAN: .size llvm_mips_nor_v_d_test
;
@llvm_mips_or_v_b_ARG1 = global <16 x i8> <i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10, i8 11, i8 12, i8 13, i8 14, i8 15>, align 16
@llvm_mips_or_v_b_ARG2 = global <16 x i8> <i8 16, i8 17, i8 18, i8 19, i8 20, i8 21, i8 22, i8 23, i8 24, i8 25, i8 26, i8 27, i8 28, i8 29, i8 30, i8 31>, align 16
@llvm_mips_or_v_b_RES  = global <16 x i8> <i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0>, align 16

define void @llvm_mips_or_v_b_test() nounwind {
entry:
  %0 = load <16 x i8>* @llvm_mips_or_v_b_ARG1
  %1 = load <16 x i8>* @llvm_mips_or_v_b_ARG2
  %2 = bitcast <16 x i8> %0 to <16 x i8>
  %3 = bitcast <16 x i8> %1 to <16 x i8>
  %4 = tail call <16 x i8> @llvm.mips.or.v(<16 x i8> %2, <16 x i8> %3)
  %5 = bitcast <16 x i8> %4 to <16 x i8>
  store <16 x i8> %5, <16 x i8>* @llvm_mips_or_v_b_RES
  ret void
}

; ANYENDIAN: llvm_mips_or_v_b_test:
; ANYENDIAN: ld.b
; ANYENDIAN: ld.b
; ANYENDIAN: or.v
; ANYENDIAN: st.b
; ANYENDIAN: .size llvm_mips_or_v_b_test
;
@llvm_mips_or_v_h_ARG1 = global <8 x i16> <i16 0, i16 1, i16 2, i16 3, i16 4, i16 5, i16 6, i16 7>, align 16
@llvm_mips_or_v_h_ARG2 = global <8 x i16> <i16 8, i16 9, i16 10, i16 11, i16 12, i16 13, i16 14, i16 15>, align 16
@llvm_mips_or_v_h_RES  = global <8 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, align 16

define void @llvm_mips_or_v_h_test() nounwind {
entry:
  %0 = load <8 x i16>* @llvm_mips_or_v_h_ARG1
  %1 = load <8 x i16>* @llvm_mips_or_v_h_ARG2
  %2 = bitcast <8 x i16> %0 to <16 x i8>
  %3 = bitcast <8 x i16> %1 to <16 x i8>
  %4 = tail call <16 x i8> @llvm.mips.or.v(<16 x i8> %2, <16 x i8> %3)
  %5 = bitcast <16 x i8> %4 to <8 x i16>
  store <8 x i16> %5, <8 x i16>* @llvm_mips_or_v_h_RES
  ret void
}

; ANYENDIAN: llvm_mips_or_v_h_test:
; ANYENDIAN: ld.b
; ANYENDIAN: ld.b
; ANYENDIAN: or.v
; ANYENDIAN: st.b
; ANYENDIAN: .size llvm_mips_or_v_h_test
;
@llvm_mips_or_v_w_ARG1 = global <4 x i32> <i32 0, i32 1, i32 2, i32 3>, align 16
@llvm_mips_or_v_w_ARG2 = global <4 x i32> <i32 4, i32 5, i32 6, i32 7>, align 16
@llvm_mips_or_v_w_RES  = global <4 x i32> <i32 0, i32 0, i32 0, i32 0>, align 16

define void @llvm_mips_or_v_w_test() nounwind {
entry:
  %0 = load <4 x i32>* @llvm_mips_or_v_w_ARG1
  %1 = load <4 x i32>* @llvm_mips_or_v_w_ARG2
  %2 = bitcast <4 x i32> %0 to <16 x i8>
  %3 = bitcast <4 x i32> %1 to <16 x i8>
  %4 = tail call <16 x i8> @llvm.mips.or.v(<16 x i8> %2, <16 x i8> %3)
  %5 = bitcast <16 x i8> %4 to <4 x i32>
  store <4 x i32> %5, <4 x i32>* @llvm_mips_or_v_w_RES
  ret void
}

; ANYENDIAN: llvm_mips_or_v_w_test:
; ANYENDIAN: ld.b
; ANYENDIAN: ld.b
; ANYENDIAN: or.v
; ANYENDIAN: st.b
; ANYENDIAN: .size llvm_mips_or_v_w_test
;
@llvm_mips_or_v_d_ARG1 = global <2 x i64> <i64 0, i64 1>, align 16
@llvm_mips_or_v_d_ARG2 = global <2 x i64> <i64 2, i64 3>, align 16
@llvm_mips_or_v_d_RES  = global <2 x i64> <i64 0, i64 0>, align 16

define void @llvm_mips_or_v_d_test() nounwind {
entry:
  %0 = load <2 x i64>* @llvm_mips_or_v_d_ARG1
  %1 = load <2 x i64>* @llvm_mips_or_v_d_ARG2
  %2 = bitcast <2 x i64> %0 to <16 x i8>
  %3 = bitcast <2 x i64> %1 to <16 x i8>
  %4 = tail call <16 x i8> @llvm.mips.or.v(<16 x i8> %2, <16 x i8> %3)
  %5 = bitcast <16 x i8> %4 to <2 x i64>
  store <2 x i64> %5, <2 x i64>* @llvm_mips_or_v_d_RES
  ret void
}

; ANYENDIAN: llvm_mips_or_v_d_test:
; ANYENDIAN: ld.b
; ANYENDIAN: ld.b
; ANYENDIAN: or.v
; ANYENDIAN: st.b
; ANYENDIAN: .size llvm_mips_or_v_d_test
;
define void @or_v_b_test() nounwind {
entry:
  %0 = load <16 x i8>* @llvm_mips_or_v_b_ARG1
  %1 = load <16 x i8>* @llvm_mips_or_v_b_ARG2
  %2 = or <16 x i8> %0, %1
  store <16 x i8> %2, <16 x i8>* @llvm_mips_or_v_b_RES
  ret void
}

; CHECK: or_v_b_test:
; CHECK: ld.b
; CHECK: ld.b
; CHECK: or.v
; CHECK: st.b
; CHECK: .size or_v_b_test
;
define void @or_v_h_test() nounwind {
entry:
  %0 = load <8 x i16>* @llvm_mips_or_v_h_ARG1
  %1 = load <8 x i16>* @llvm_mips_or_v_h_ARG2
  %2 = or <8 x i16> %0, %1
  store <8 x i16> %2, <8 x i16>* @llvm_mips_or_v_h_RES
  ret void
}

; CHECK: or_v_h_test:
; CHECK: ld.h
; CHECK: ld.h
; CHECK: or.v
; CHECK: st.h
; CHECK: .size or_v_h_test
;

define void @or_v_w_test() nounwind {
entry:
  %0 = load <4 x i32>* @llvm_mips_or_v_w_ARG1
  %1 = load <4 x i32>* @llvm_mips_or_v_w_ARG2
  %2 = or <4 x i32> %0, %1
  store <4 x i32> %2, <4 x i32>* @llvm_mips_or_v_w_RES
  ret void
}

; CHECK: or_v_w_test:
; CHECK: ld.w
; CHECK: ld.w
; CHECK: or.v
; CHECK: st.w
; CHECK: .size or_v_w_test
;

define void @or_v_d_test() nounwind {
entry:
  %0 = load <2 x i64>* @llvm_mips_or_v_d_ARG1
  %1 = load <2 x i64>* @llvm_mips_or_v_d_ARG2
  %2 = or <2 x i64> %0, %1
  store <2 x i64> %2, <2 x i64>* @llvm_mips_or_v_d_RES
  ret void
}

; CHECK: or_v_d_test:
; CHECK: ld.d
; CHECK: ld.d
; CHECK: or.v
; CHECK: st.d
; CHECK: .size or_v_d_test
;
@llvm_mips_xor_v_b_ARG1 = global <16 x i8> <i8 0, i8 1, i8 2, i8 3, i8 4, i8 5, i8 6, i8 7, i8 8, i8 9, i8 10, i8 11, i8 12, i8 13, i8 14, i8 15>, align 16
@llvm_mips_xor_v_b_ARG2 = global <16 x i8> <i8 16, i8 17, i8 18, i8 19, i8 20, i8 21, i8 22, i8 23, i8 24, i8 25, i8 26, i8 27, i8 28, i8 29, i8 30, i8 31>, align 16
@llvm_mips_xor_v_b_RES  = global <16 x i8> <i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0, i8 0>, align 16

define void @llvm_mips_xor_v_b_test() nounwind {
entry:
  %0 = load <16 x i8>* @llvm_mips_xor_v_b_ARG1
  %1 = load <16 x i8>* @llvm_mips_xor_v_b_ARG2
  %2 = bitcast <16 x i8> %0 to <16 x i8>
  %3 = bitcast <16 x i8> %1 to <16 x i8>
  %4 = tail call <16 x i8> @llvm.mips.xor.v(<16 x i8> %2, <16 x i8> %3)
  %5 = bitcast <16 x i8> %4 to <16 x i8>
  store <16 x i8> %5, <16 x i8>* @llvm_mips_xor_v_b_RES
  ret void
}

; ANYENDIAN: llvm_mips_xor_v_b_test:
; ANYENDIAN: ld.b
; ANYENDIAN: ld.b
; ANYENDIAN: xor.v
; ANYENDIAN: st.b
; ANYENDIAN: .size llvm_mips_xor_v_b_test
;
@llvm_mips_xor_v_h_ARG1 = global <8 x i16> <i16 0, i16 1, i16 2, i16 3, i16 4, i16 5, i16 6, i16 7>, align 16
@llvm_mips_xor_v_h_ARG2 = global <8 x i16> <i16 8, i16 9, i16 10, i16 11, i16 12, i16 13, i16 14, i16 15>, align 16
@llvm_mips_xor_v_h_RES  = global <8 x i16> <i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0, i16 0>, align 16

define void @llvm_mips_xor_v_h_test() nounwind {
entry:
  %0 = load <8 x i16>* @llvm_mips_xor_v_h_ARG1
  %1 = load <8 x i16>* @llvm_mips_xor_v_h_ARG2
  %2 = bitcast <8 x i16> %0 to <16 x i8>
  %3 = bitcast <8 x i16> %1 to <16 x i8>
  %4 = tail call <16 x i8> @llvm.mips.xor.v(<16 x i8> %2, <16 x i8> %3)
  %5 = bitcast <16 x i8> %4 to <8 x i16>
  store <8 x i16> %5, <8 x i16>* @llvm_mips_xor_v_h_RES
  ret void
}

; ANYENDIAN: llvm_mips_xor_v_h_test:
; ANYENDIAN: ld.b
; ANYENDIAN: ld.b
; ANYENDIAN: xor.v
; ANYENDIAN: st.b
; ANYENDIAN: .size llvm_mips_xor_v_h_test
;
@llvm_mips_xor_v_w_ARG1 = global <4 x i32> <i32 0, i32 1, i32 2, i32 3>, align 16
@llvm_mips_xor_v_w_ARG2 = global <4 x i32> <i32 4, i32 5, i32 6, i32 7>, align 16
@llvm_mips_xor_v_w_RES  = global <4 x i32> <i32 0, i32 0, i32 0, i32 0>, align 16

define void @llvm_mips_xor_v_w_test() nounwind {
entry:
  %0 = load <4 x i32>* @llvm_mips_xor_v_w_ARG1
  %1 = load <4 x i32>* @llvm_mips_xor_v_w_ARG2
  %2 = bitcast <4 x i32> %0 to <16 x i8>
  %3 = bitcast <4 x i32> %1 to <16 x i8>
  %4 = tail call <16 x i8> @llvm.mips.xor.v(<16 x i8> %2, <16 x i8> %3)
  %5 = bitcast <16 x i8> %4 to <4 x i32>
  store <4 x i32> %5, <4 x i32>* @llvm_mips_xor_v_w_RES
  ret void
}

; ANYENDIAN: llvm_mips_xor_v_w_test:
; ANYENDIAN: ld.b
; ANYENDIAN: ld.b
; ANYENDIAN: xor.v
; ANYENDIAN: st.b
; ANYENDIAN: .size llvm_mips_xor_v_w_test
;
@llvm_mips_xor_v_d_ARG1 = global <2 x i64> <i64 0, i64 1>, align 16
@llvm_mips_xor_v_d_ARG2 = global <2 x i64> <i64 2, i64 3>, align 16
@llvm_mips_xor_v_d_RES  = global <2 x i64> <i64 0, i64 0>, align 16

define void @llvm_mips_xor_v_d_test() nounwind {
entry:
  %0 = load <2 x i64>* @llvm_mips_xor_v_d_ARG1
  %1 = load <2 x i64>* @llvm_mips_xor_v_d_ARG2
  %2 = bitcast <2 x i64> %0 to <16 x i8>
  %3 = bitcast <2 x i64> %1 to <16 x i8>
  %4 = tail call <16 x i8> @llvm.mips.xor.v(<16 x i8> %2, <16 x i8> %3)
  %5 = bitcast <16 x i8> %4 to <2 x i64>
  store <2 x i64> %5, <2 x i64>* @llvm_mips_xor_v_d_RES
  ret void
}

; ANYENDIAN: llvm_mips_xor_v_d_test:
; ANYENDIAN: ld.b
; ANYENDIAN: ld.b
; ANYENDIAN: xor.v
; ANYENDIAN: st.b
; ANYENDIAN: .size llvm_mips_xor_v_d_test
;
define void @xor_v_b_test() nounwind {
entry:
  %0 = load <16 x i8>* @llvm_mips_xor_v_b_ARG1
  %1 = load <16 x i8>* @llvm_mips_xor_v_b_ARG2
  %2 = xor <16 x i8> %0, %1
  store <16 x i8> %2, <16 x i8>* @llvm_mips_xor_v_b_RES
  ret void
}

; CHECK: xor_v_b_test:
; CHECK: ld.b
; CHECK: ld.b
; CHECK: xor.v
; CHECK: st.b
; CHECK: .size xor_v_b_test
;
define void @xor_v_h_test() nounwind {
entry:
  %0 = load <8 x i16>* @llvm_mips_xor_v_h_ARG1
  %1 = load <8 x i16>* @llvm_mips_xor_v_h_ARG2
  %2 = xor <8 x i16> %0, %1
  store <8 x i16> %2, <8 x i16>* @llvm_mips_xor_v_h_RES
  ret void
}

; CHECK: xor_v_h_test:
; CHECK: ld.h
; CHECK: ld.h
; CHECK: xor.v
; CHECK: st.h
; CHECK: .size xor_v_h_test
;

define void @xor_v_w_test() nounwind {
entry:
  %0 = load <4 x i32>* @llvm_mips_xor_v_w_ARG1
  %1 = load <4 x i32>* @llvm_mips_xor_v_w_ARG2
  %2 = xor <4 x i32> %0, %1
  store <4 x i32> %2, <4 x i32>* @llvm_mips_xor_v_w_RES
  ret void
}

; CHECK: xor_v_w_test:
; CHECK: ld.w
; CHECK: ld.w
; CHECK: xor.v
; CHECK: st.w
; CHECK: .size xor_v_w_test
;

define void @xor_v_d_test() nounwind {
entry:
  %0 = load <2 x i64>* @llvm_mips_xor_v_d_ARG1
  %1 = load <2 x i64>* @llvm_mips_xor_v_d_ARG2
  %2 = xor <2 x i64> %0, %1
  store <2 x i64> %2, <2 x i64>* @llvm_mips_xor_v_d_RES
  ret void
}

; CHECK: xor_v_d_test:
; CHECK: ld.d
; CHECK: ld.d
; CHECK: xor.v
; CHECK: st.d
; CHECK: .size xor_v_d_test
;
declare <16 x i8> @llvm.mips.and.v(<16 x i8>, <16 x i8>) nounwind
declare <16 x i8> @llvm.mips.bmnz.v(<16 x i8>, <16 x i8>) nounwind
declare <16 x i8> @llvm.mips.bmz.v(<16 x i8>, <16 x i8>) nounwind
declare <16 x i8> @llvm.mips.bsel.v(<16 x i8>, <16 x i8>, <16 x i8>) nounwind
declare <16 x i8> @llvm.mips.nor.v(<16 x i8>, <16 x i8>) nounwind
declare <16 x i8> @llvm.mips.or.v(<16 x i8>, <16 x i8>) nounwind
declare <16 x i8> @llvm.mips.xor.v(<16 x i8>, <16 x i8>) nounwind
