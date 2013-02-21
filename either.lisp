;;;; either.lisp
;;;; Copyright (c) 2013 Robert Smith

;;;; An implementation of the Either data type.

(in-package #:algebraic-data-library)

(adt:defdata either
  (left t)
  (right t))

(defun mirror (either-val)
  (adt:match either either-val
    ((left x) (right x))
    ((right x) (left x))))
