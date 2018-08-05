;;;; generics.lisp
;;;; Copyright (c) 2013-2018 Robert Smith

;;;; Generic functions that correspond to type classes in Haskell.

(in-package #:algebraic-data-library)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Functors ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defgeneric fmap (fun val)
  (:documentation "A way to lift FUN into a container-like value VAL."))

(defun fmap* (fun)
  "A curried version of FMAP: lift FUN to operate on functor types."
  (lambda (val)
    (fmap fun val)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Monads ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; We must provide the type because we don't have magical type
;;; inference to tell us. :(
(defgeneric wrap (type value)
  (:documentation "Lift VALUE to type TYPE."))

(defgeneric >>= (val f)
  (:documentation "Send/compose the result of VAL to F."))

(defgeneric >> (a b)
  (:documentation "Compute A and then B, discarding A."))

;;; Default implementation
(defmethod >> (a b)
  (funcall (constantly b) a))

(defmacro mlet (bindings &body body)
  "Similar to Haskell's `do' notation, allows for `>>=' to be chained together."
  (if (null bindings)
      `(progn ,@body)
      (destructuring-bind ((variable value-form) . rest-bindings)
          bindings
        (check-type variable symbol)
        `(>>= ,value-form (lambda (,variable) (mlet ,rest-bindings ,@body))))))
