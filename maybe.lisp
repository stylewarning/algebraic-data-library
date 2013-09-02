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

(defun lookup (key hash-table)
  "A type-safe version of GETHASH. Look up the key KEY in the hash
table HASH-TABLE."
  (multiple-value-bind (result found?)
      (gethash key hash-table)
    (if found?        
        (just result)
        nothing)))

;;; Functors

(defmethod fmap ((f function) (val maybe))
  (adt:match maybe val
    ((just x) (just (funcall f x)))
    (nothing nothing)))


;;; Monads

(defmethod wrap ((x (eql 'maybe)) value)
  (just value))

(defmethod >>= ((val maybe) f)
  ;; F :: a -> Maybe a
  (adt:match maybe val
    ((just x) (funcall f x))
    (nothing  nothing)))

