(car ''abracadabra)

; i.e because when he types (car ''abracadabra)
; the quotation symbol wraps its argument as shown below.
; (car (quote (quote abracadabra)))
; 
; so car will give the first element in the (quote abracadabra)
; i.e quote