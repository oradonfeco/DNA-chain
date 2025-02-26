;; metadata-manager
;; Handles NFT metadata updates and storage

(define-constant contract-owner tx-sender)
(define-constant err-owner-only (err u100))

;; Metadata Storage
(define-map metadata-storage
    { token-id: uint }
    { 
        base-uri: (string-ascii 256),
        attributes: (string-ascii 1024)
    }
)

;; Public Functions
(define-public (update-metadata (token-id uint) (new-uri (string-ascii 256)) (new-attributes (string-ascii 1024)))
    (begin
        (asserts! (is-eq tx-sender contract-owner) err-owner-only)
        (ok (map-set metadata-storage
            { token-id: token-id }
            {
                base-uri: new-uri,
                attributes: new-attributes
            }
        ))
    )
)

;; Read-Only Functions
(define-read-only (get-metadata (token-id uint))
    (map-get? metadata-storage { token-id: token-id })
)