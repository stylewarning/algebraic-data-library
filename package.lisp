;;;; package.lisp
;;;; Copyright (c) 2013 Robert Smith

(defpackage #:algebraic-data-library
  (:use #:cl)
  (:nicknames #:adl)
  
  ;; generics.lisp
  (:export #:fmap
           #:fmap*)
  
  ;; unit.lisp
  (:export #:unit
           #:nul)
  
  ;; maybe.lisp
  (:export #:maybe
           #:just
           #:nothing
           
           #:just-or-else)
  
  ;; either.lisp
  (:export #:either
           #:left
           #:right
           
           #:mirror))

