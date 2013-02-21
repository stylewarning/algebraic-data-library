;;;; generics.lisp
;;;; Copyright (c) 2013 Robert Smith

;;;; Generic functions that correspond to type classes in Haskell.

(in-package #:algebraic-data-library)

;;;; Functors
(defgeneric fmap (fun val)
  (:documentation "A way to lift FUN into a container-like value VAL."))

(defun fmap* (fun)
  "A curried version of FMAP: lift FUN to operate on functor types."
  (lambda (val)
    (fmap fun val)))
