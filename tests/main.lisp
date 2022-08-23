(defpackage :cl-test/tests
  (:use :cl :cl-test))
(in-package :cl-test/tests)

(context "Assertions"
  (it "passes when form evaluates to true"
    (= 1 1))
  (it "fails when form evaluates to false"
    (= 1 2)))
