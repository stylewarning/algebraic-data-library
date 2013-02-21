;;;; unit.lisp
;;;; Copyright (c) 2013 Robert Smith

;;;; An implementation of the Unit data type.

(in-package #:algebraic-data-library)

;; The UNIT data type usually has the constructor "()", but since
;; parentheses are important in Lisp, we'll go with the next best
;; thing: "nul"
(adt:defdata unit
  nul)
