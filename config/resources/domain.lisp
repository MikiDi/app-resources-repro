(in-package :mu-cl-resources)

(defparameter *cache-count-queries* nil)
(defparameter *supply-cache-headers-p* t)
(defparameter *include-count-in-paginated-responses* t)
(defparameter *max-group-sorted-properties* t)
(setf *cache-model-properties-p* t)
(setf *log-delta-clear-keys* t)
 
;; reading in the domain.json
; (read-domain-file "domain.json")

(define-resource job ()
  :class (s-prefix "cogs:Job")
  :properties `((:created       :datetime  ,(s-prefix "dct:created"))
                (:status        :url       ,(s-prefix "ext:status"))
                (:time-started  :datetime  ,(s-prefix "prov:startedAtTime"))
                (:time-ended    :datetime  ,(s-prefix "prov:endedAtTime"))
                (:used          :uri-set   ,(s-prefix "prov:used"))
  )
  :resource-base (s-url "http://example.com/jobs/")
  :features `(include-uri)
  :on-path "jobs"
)

