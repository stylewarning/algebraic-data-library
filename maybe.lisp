;;;; maybe.lisp
;;;; Copyright (c) 2013 Robert Smith

;;;; An implementation of the Maybe data type.

(in-package #:algebraic-data-library)

(adt:defdata maybe
  (just t)
  nothing)

(defun just-or-else (maybe-val or-else)
  (adt:match maybe maybe-val
    ((just x) x)
    (nothing  or-else)))
