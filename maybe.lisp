;;;; maybe.lisp
;;;; Copyright (c) 2013 Robert Smith

;;;; An implementation of the Maybe data type.

(in-package #:algebraic-data-library)

(adt:defdata maybe
  (just t)
  nothing)

(defun just-or-else (maybe-val or-else)
  "Return the encapsulated value of a JUST, otherwise return OR-ELSE
if MAYBE-VAL is NOTHING."
  (adt:match maybe maybe-val
    ((just x) x)
    (nothing  or-else)))

(defun lookup (hash-table value)
  "A type-safe version of GETHASH."
  (multiple-value-bind (result found?)
      (gethash value hash-table)
    (if found?        
        (just result)
        nothing)))

(defmethod fmap ((f function) (val maybe))
  (adt:match maybe val
    ((just x) (just (funcall f x)))
    (nothing nothing)))
