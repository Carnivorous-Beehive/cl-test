(defsystem "cl-test"
  :version "0.1.0"
  :author "Evan Duncan"
  :description "A unit test framework from Practical Common Lisp"
  :license "MIT"
  :components ((:module "src"
                :components ((:file "main"))))
  :in-order-to ((test-op (test-op "cl-test/tests"))))

(defsystem "cl-test/tests"
  :author "Evan Duncan"
  :license "MIT"
  :depends-on ("cl-test")
  :description "Tests for cl-test framework"
  :components ((:module "tests"
                :components ((:file "main"))))
  :perform (test-op (op c) (symbol-call :cl-test :run c)))
