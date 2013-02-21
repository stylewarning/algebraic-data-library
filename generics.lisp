;;;; generics.lisp
;;;; Copyright (c) 2013 Robert Smith

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
