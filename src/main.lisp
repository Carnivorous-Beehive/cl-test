(defpackage :cl-test
  (:use :cl)
  (:export :run :context :it))
(in-package :cl-test)

(defun run (c)
  (declare (ignore c)))

(defmacro with-gensyms ((&rest names) &body body)
  `(let ,(loop for n in names collect `(,n (gensym)))
     ,@body))

(defmacro combine-results (&body forms)
  (with-gensyms (result)
    `(let ((,result t))
       ,@(loop for f in forms collect `(unless ,f (setf ,result nil)))
       ,result)))

(defmacro context (name &body body)
  `(progn
     (format t "~%~a~%" ,name)
     ,@body))

(defmacro it (test &body forms)
  `(combine-results
     ,@(loop for f in forms collect `(report-result ,test ,f ',f))))

(defun report-result (test result form)
  (format t "~:[❌~;✅~] \"~a\"~%    ~a~%" result test form))
