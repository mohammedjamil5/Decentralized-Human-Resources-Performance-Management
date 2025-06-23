;; Development Planning Contract
;; Plans and tracks employee development activities

(define-constant ERR_UNAUTHORIZED (err u500))
(define-constant ERR_PLAN_NOT_FOUND (err u501))
(define-constant ERR_INVALID_PRIORITY (err u502))

;; Priority levels
(define-constant PRIORITY_LOW u1)
(define-constant PRIORITY_MEDIUM u2)
(define-constant PRIORITY_HIGH u3)

;; Plan status
(define-constant PLAN_DRAFT u0)
(define-constant PLAN_ACTIVE u1)
(define-constant PLAN_COMPLETED u2)

;; Data structures
(define-map development-plans uint {
    employee: principal,
    manager: principal,
    skill-area: (string-ascii 100),
    description: (string-ascii 500),
    target-completion: uint,
    priority: uint,
    status: uint,
    created-at: uint
})

(define-data-var plan-counter uint u0)

;; Read-only functions
(define-read-only (get-development-plan (plan-id uint))
    (map-get? development-plans plan-id)
)

(define-read-only (get-plan-counter)
    (var-get plan-counter)
)

;; Public functions
(define-public (create-development-plan (employee principal) (skill-area (string-ascii 100)) (description (string-ascii 500)) (target-completion uint) (priority uint))
    (let ((plan-id (+ (var-get plan-counter) u1)))
        (asserts! (<= priority PRIORITY_HIGH) ERR_INVALID_PRIORITY)
        (asserts! (>= priority PRIORITY_LOW) ERR_INVALID_PRIORITY)
        (map-set development-plans plan-id {
            employee: employee,
            manager: tx-sender,
            skill-area: skill-area,
            description: description,
            target-completion: target-completion,
            priority: priority,
            status: PLAN_DRAFT,
            created-at: block-height
        })
        (var-set plan-counter plan-id)
        (ok plan-id)
    )
)

(define-public (activate-plan (plan-id uint))
    (let ((plan (unwrap! (map-get? development-plans plan-id) ERR_PLAN_NOT_FOUND)))
        (asserts! (or (is-eq tx-sender (get employee plan)) (is-eq tx-sender (get manager plan))) ERR_UNAUTHORIZED)
        (map-set development-plans plan-id (merge plan { status: PLAN_ACTIVE }))
        (ok true)
    )
)

(define-public (complete-plan (plan-id uint))
    (let ((plan (unwrap! (map-get? development-plans plan-id) ERR_PLAN_NOT_FOUND)))
        (asserts! (or (is-eq tx-sender (get employee plan)) (is-eq tx-sender (get manager plan))) ERR_UNAUTHORIZED)
        (map-set development-plans plan-id (merge plan { status: PLAN_COMPLETED }))
        (ok true)
    )
)
