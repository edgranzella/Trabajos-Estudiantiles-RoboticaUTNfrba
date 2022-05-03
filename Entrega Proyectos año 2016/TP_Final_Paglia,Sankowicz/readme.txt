Todo debe empezar con init y terminar con end
Las instrucciones no llevan punto y coma final

movl (speed, time): movimiento lineal
	speed: [int] 0-100
	time: [int] milisegundos

movc(speed, time, delta_v, clockwise): movimiento circular 
	speed: [int] 0-100
	time: [int] milisegundos
	delta_v: [int] 0-speed, hay protección por si llega a ser mayor que speed 
	clockwise: [int] 1=clockwise, else anticlockwise

wait(time): se queda quieto
	time: [int] milisegundos
	

Ejemplo:

init 		
movl(90, 1000)
wait(500)
movc(90, 1000, 40, 1)
movc(90, 1000, 40, 0)
movc(90, 1000, 100, 1)
end
