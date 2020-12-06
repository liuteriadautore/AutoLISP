(defun c:LT-VesicaByStartEnd ()
  ; Construct a Vesica Piscis from the start and end point at the maximum width
  (setq 
    vpq1 (getpoint "Set the first quadrant point")
    vpq2 (getpoint "Set the second quadrant point")
    )      
  
  ; draw the vesica
  (drawvesicapiscis vpq1 vpq2)
)

(defun c:LT-VesicaByStartCenter ()
  (setq
    vpq1 (getpoint "Set the first quadrant point")
    vpc (getpoint "Set the center point")
  ) 
  
  ; find the second quadrant point
  (setq vpq2x(- (car vpq1) (* (- (car vpq1) (car vpc)) 2)))
  (setq vpq2y(- (cadr vpq1) (* (- (cadr vpq1) (cadr vpc)) 2)))
  (setq vpq2 (list vpq2x vpq2y))
  
  ; draw the vesica
  (drawvesicapiscis vpq1 vpq2)
)

(defun c:LT-VesicaByStartIntersection ()
  (setq
    vpq1 (getpoint "Set the first quadrant point")
    vpi (getpoint "Set the intersection point")
  ) 
  
  ; find the second quadrant point
  (setq vpq2x(+ (car vpq1) (* (- (car vpi) (car vpq1)) 2)))
  (setq vpq2y (cadr vpq1))
  (setq vpq2 (list vpq2x vpq2y))
  
  ; draw the vesica
  (drawvesicapiscis vpq1 vpq2)
)

(defun c:LT-VesicaByCenterEnd ()
  ; Constuct a Vesica Piscis from the center and the end point, at the maximum width
  (setq 
    vpc (getpoint "Set the center point")
    vpq1 (getpoint "Set the second quadrant point")
    )      
  
  ; find the second quadrant point
  (setq vpq2x(- (car vpq1) (* (- (car vpq1) (car vpc)) 2)))
  (setq vpq2y(- (cadr vpq1) (* (- (cadr vpq1) (cadr vpc)) 2)))
  (setq vpq2 (list vpq2x vpq2y))
  
  ; draw the vesica
  (drawvesicapiscis vpq1 vpq2)
)

(defun c:LT-VesicaByCenterIntersection ()
  (setq 
    vpc (getpoint "Set the center point")  
    vpi (getpoint "Set the intersection point")
  )
  
  ; find the first quadrant point
  (setq vpq1x ( -  (car vpc) ( * ( / ( - (cadr vpc) (cadr vpi)) 1.73) 3)))  
  (setq vpq1 (list vpq1x (cadr vpc)))
  
  ; find the second quadrant point
  (setq vpq2x ( +  (car vpc) ( * ( / ( - (cadr vpc) (cadr vpi)) 1.73) 3)))  
  (setq vpq2 (list vpq2x (cadr vpc)))
        
  ; draw the vesica
  (drawvesicapiscis vpq1 vpq2)
)


;;; Internal Functions
(defun DrawVesicaPiscis (vpq1 vpq2)
  ; define the first center point, at one third between the two defined points
  (setq x1(/ (- (car vpq2) (car vpq1)) 3.00))
  (setq y1(/ (- (cadr vpq2) (cadr vpq1)) 3.00))
  (setq vpc1 (list (+ (car vpq1) x1) (+ (cadr vpq1) y1)))
  
  ; define the second center point, at two thirds between the two defined points
  (setq x2(/ (- (car vpq1) (car vpq2)) 3.00))
  (setq y2(/ (- (cadr vpq1) (cadr vpq2)) 3.00))
  (setq vpc2 (list (+ (car vpq2) x2) (+ (cadr vpq2) y2)))
  
  ; draw the vesica
  (command "circle" vpc1 vpq1)  
  (command "circle" vpc2 vpq2)  
)