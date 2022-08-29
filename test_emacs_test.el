;;; -*- lexical-binding: t; -*-

;;(add-to-list 'load-path ".")
(require 'emacs_test)
(require 'ert)

(ert-deftest et-multiply ()
  "Test multilication"
  (should (eq (et-multiply 2 7) 14)))
