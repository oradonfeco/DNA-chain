;; evolution-nft
;; Dynamic NFT Evolution Engine Contract

;; Define the NFT
(define-non-fungible-token evolution-nft uint)

;; Constants
(define-constant contract-owner tx-sender)
(define-constant err-owner-only (err u100))
(define-constant err-not-token-owner (err u101))
(define-constant err-invalid-token (err u102))

;; Data Variables
(define-data-var last-token-id uint u0)

;; NFT Collection Data Maps
(define-map tokens 
    { token-id: uint }
    { 
        owner: principal,
        strength: uint,
        speed: uint,
        evolution-level: uint,
        metadata-uri: (string-ascii 256)
    }
)

(define-map token-evolution-progress
    { token-id: uint }
    {
        steps-count: uint,
        meditation-minutes: uint,
        last-update: uint
    }
)

;; Public Functions
(define-public (mint)
    (let
        ((token-id (+ (var-get last-token-id) u1)))
        (try! (nft-mint? evolution-nft token-id tx-sender))
        (map-set tokens
            { token-id: token-id }
            {
                owner: tx-sender,
                strength: u1,
                speed: u1,
                evolution-level: u1,
                metadata-uri: "ipfs://initial-metadata"
            }
        )
        (map-set token-evolution-progress
            { token-id: token-id }
            {
                steps-count: u0,
                meditation-minutes: u0,
                last-update: stacks-block-height
            }
        )
        (var-set last-token-id token-id)
        (ok token-id)
    )
)

;; Rest of the contract remains the same...