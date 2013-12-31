;Exercise 1.26
;
;When we use "square" procedure in the "exmod" method, it runs faster because
;the value is calculated only once in the exmod and that is passes to the
;square methos which doubles it.

;But when we use (* (exmod base (/ exp 2) m) (exmod base (/ exp 2) m) )
;The expression will be evaluated twice, which will take longer time.
;Result - Performance degradation
