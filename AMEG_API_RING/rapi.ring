# --------------------------------------------
# API Caja (versión Ring)
# Author:  Valentin Coellar Serrano.
# Email:   direccion@gruponucleon.com
# Date:    04/06/2026
# Version: 0.0.1 (Ring)
# License: Use under Author permission.
# Port:8081  
# Endpoints: 
# /status 	= Muestra "Exitoso" si api online
# /dash 	= FrontEnd de la aplicacion
# /notas       = (devuelve las notas del dia + clave cliente)
# /clientes    = retorna toda la lista de clientes con sus nombres de CLIE01
# /notasfull	= Retorna Notas del dia + todas sus partidas de cada una
# /nameproducts  =Retorna lista de productos con su descripcion y clave
# /sinexistencias2 =Retorna losta productos sin existencias en almacen 2
# --------------------------------------------

load "stdlib.ring"
load "httplib.ring"

oServer = new Server {

		# endpoint /status
		route(:Get,"/status",:status)

		# endpoint /dash
		route(:Get,"/dash",:dash)	
		
		# endpoint /notas
		route(:Get,"/notas",:notas)


        ? "Servidor iniciado. Valentin Coellar S. 2026 direccion@gruponucleon.com 8081 0.0.1 Ring"
        listen("0.0.0.0", 8081)
}


# --------- FUNCIONES ENDPOINTS ---------
func status
	oServer.SetContent("Api Online Conexion existosa", "text/plain")

func dash
	cFront = read("static/index.html")
	oServer.SetContent(cFront,"text/html")


func notas
	cmd = 'connectdb --query "SELECT CVE_DOC, CVE_CLPV, IMPORTE FROM FACTV01 WHERE CAST(FECHA_DOC AS DATE) = CAST(GETDATE() AS DATE)"'
    
    res = SystemCmd(cmd)
    ? res
   
   # If res = 1  != 0 
	#	oServer.SetContent(res, "text/plain")
    # Else 
	#	oServer.SetContent(res, "text/plain")
    # Ok
    
    
