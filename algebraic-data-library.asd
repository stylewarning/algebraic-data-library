;;;; algebraic-data-library.asd
;;;; Copyright (c) 2013 Robert Smith

(asdf:defsystem #:algebraic-data-library
  :serial t
  :description "A library of common algebraic data types."
  :author "Robert Smith <quad@symbo1ics.com>"
  :license "BSD 3-clause"
  :components ((:file "package")
               (:file "unit")
               (:file "maybe")
               (:file "either"))
  :depends-on ("cl-algebraic-data-type"))

