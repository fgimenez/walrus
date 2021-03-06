;; Do not gc non-exported, but transitively called functions.

(module
  (type (;0;) (func (result i32)))
  (func $f (type 0) (result i32)
    (i32.add (i32.const 42) (i32.const 1)))
  (func $g (type 0) (result i32)
    (call $f))
  (export "g" (func $g)))

;; CHECK: (module
;; NEXT:    (type (;0;) (func (result i32)))
;; NEXT:    (func $f (type 0) (result i32)
;; NEXT:      i32.const 42
;; NEXT:      i32.const 1
;; NEXT:      i32.add)
;; NEXT:    (func $g (type 0) (result i32)
;; NEXT:      call $f)
;; NEXT:    (export "g" (func $g)))

