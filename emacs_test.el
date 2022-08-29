(defun et-multiply (x y )
  (* x y))

(require 'ert)

(ert-deftest et-multiply ()
  "Test multilication"
  (should (eq (et-multiply 2 7) 14)))
