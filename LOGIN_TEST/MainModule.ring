#Modulo Principal
#
#Funciones principales para 
#no tener codigo en el controller
func Prueba
	? "En funcion"
func ValidaUsuario usr,pass,oView
	usuario = "admin"
	password = "12345"
	load "AplicacionController.ring"
	if usr = usuario and pass = password { 
		? "Usuario Valido"
		openWindow(:AplicacionController)
		oView.win.close()
	}
