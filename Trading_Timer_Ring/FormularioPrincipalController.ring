# Form/Window Controller - Source Code File
# *****************************************
# Trading Timer Ring Version
# Valentin Coellar Serrano 2026
# *****************************************


load "FormularioPrincipalView.ring"

import System.GUI

if IsMainSourceFile() {
	new App {
		StyleFusion()
		openWindow(:FormularioPrincipalController)
		exec()
	}
}

class FormularioPrincipalController from windowsControllerParent

	oView = new FormularioPrincipalView

# **************  Variables Globales *******************
	nMinutos  = 5
	nSegundos = 0

	nMinutos15  = 15
	nSegundos15 = 0

	nMinutos1h  = 60
	nSegundos1h = 0

# ********** Inicio de Timer **********
        oView.Timer5.setTimeoutevent(Method(:EnCadaTick))
        oView.Timer5.start()  # ✅ Arrancar desde aquí


# ****** Esta funcion al ser llamada por el timer5 dispara todas las demas ***
func EnCadaTick
    # Aquí llamas a TODA la lógica que debe ejecutarse cada segundo
    	Counter_Cinco_Minutos()
    	Counter_Quince_Minutos()
	Counter_Sesenta_Minutos()
  end


# Función de cierre
    func Cerrar
        oView.win.close()
    end


# *********** Funciones Set Para cada Counter ***********	

# Set 5 minutos 

    func Ajusta_Cinco
	see "Cinco minutos"
// Mostramos dialogo y asignaremos el nuevo valor a las variables
// de Minutos y Segundos globales
	 oInput = New QInputDialog(oView.win)
	        {
	                setwindowtitle("Set 5 Minutos")
	                setgeometry(100,100,400,50)
	                setlabeltext("MM:SS")
	                settextvalue("00:00")
	                lcheck = exec()
			 
		sTexto = oInput.textvalue()      # "12:53"
		aDatos = split(sTexto, ":")      # Devuelve ["12", "53"]
		Mins  = number(aDatos[1])    # ⚠️ Ring usa índices desde 1, no desde 0
		Segs = number(aDatos[2])
	# Validación de rango
	    if Mins > 5 or Segs > 59 
	        Mins = 00
		Segs = 00
	        return
	    ok
	
	        }
	nMinutos = Mins
	nSegundos = Segs

	    end
	
# Set 15 minutos 

    func Ajusta_Quince
	see "Quince minutos"
// Mostramos dialogo y asignaremos el nuevo valor a las variables
// de Minutos y Segundos globales
	 oInput = New QInputDialog(oView.win)
	        {
	                setwindowtitle("Set 15 Minutos")
	                setgeometry(100,100,400,50)
	                setlabeltext("MM:SS")
	                settextvalue("15:00")
	                lcheck = exec()
			 
		sTexto = oInput.textvalue()      # "12:53"
		aDatos = split(sTexto, ":")      # Devuelve ["12", "53"]
		Mins  = number(aDatos[1])    # ⚠️ Ring usa índices desde 1, no desde 0
		Segs = number(aDatos[2])
	# Validación de rango
	    if Mins > 15 or Segs > 59 
	        Mins = 00
		Segs = 00
	        return
	    ok
	
	        }
	nMinutos15 = Mins
	nSegundos15 = Segs
    end

# Set 1 Hora 

    func Ajusta_Sesenta
	see "Sesenta minutos"
// Mostramos dialogo y asignaremos el nuevo valor a las variables
// de Minutos y Segundos globales
	 oInput = New QInputDialog(oView.win)
	        {
	                setwindowtitle("Set 60 Minutos")
	                setgeometry(100,100,400,50)
	                setlabeltext("MM:SS")
	                settextvalue("60:00")
	                lcheck = exec()
			 
		sTexto = oInput.textvalue()      # "12:53"
		aDatos = split(sTexto, ":")      # Devuelve ["12", "53"]
		Mins  = number(aDatos[1])    # ⚠️ Ring usa índices desde 1, no desde 0
		Segs = number(aDatos[2])
	# Validación de rango
	    if Mins > 15 or Segs > 59 
	        Mins = 00
		Segs = 00
	        return
	    ok
	
	        }
	nMinutos1h = Mins
	nSegundos1h = Segs
    end


# ***************  Counter 5 Minutos *********************

	func Counter_Cinco_Minutos

# Si estamos en el inicio del ciclo (05:00) y el timer se dispara:
    if nSegundos = 0
        if nMinutos = 0
            # Si ya llego a 00:00, reiniciamos a 5 minutos
            nMinutos  = 5
            nSegundos = 0
        else
            # Si los segundos estan en 0 pero quedan minutos,
            # bajamos un minuto y los segundos pasan a 59
            nMinutos = nMinutos - 1
            nSegundos = 59
        ok
    else
        # Caso normal: solo restamos un segundo
        nSegundos = nSegundos - 1
    ok

    # 4. Formatear la salida con ceros a la izquierda si es necesario
    sMin = "" + nMinutos
    sSeg = "" + nSegundos

    if nMinutos < 10  sMin = "0" + sMin ok
    if nSegundos < 10 sSeg = "0" + sSeg ok

    # 5. Actualizar la interfaz grafica con el resultado (04:59, 04:58...)
    oView.TextEdit1.setText(sMin + ":" + sSeg)

 //see "Ejecutando.."
  
  end


# *****************  Counter 15 Minutos *****************

	func Counter_Quince_Minutos

# Si estamos en el inicio del ciclo (05:00) y el timer se dispara:
    if nSegundos15 = 0
        if nMinutos15 = 0
            # Si ya llego a 00:00, reiniciamos a 5 minutos
            nMinutos15  = 15
            nSegundos15 = 0
        else
            # Si los segundos estan en 0 pero quedan minutos,
            # bajamos un minuto y los segundos pasan a 59
            nMinutos15 = nMinutos15 - 1
            nSegundos15 = 59
        ok
    else
        # Caso normal: solo restamos un segundo
        nSegundos15 = nSegundos15 - 1
    ok

    # 4. Formatear la salida con ceros a la izquierda si es necesario
    sMin = "" + nMinutos15
    sSeg = "" + nSegundos15

    if nMinutos15 < 10  sMin = "0" + sMin ok
    if nSegundos15 < 10 sSeg = "0" + sSeg ok

    # 5. Actualizar la interfaz grafica con el resultado (04:59, 04:58...)
    oView.TextEdit6.setText(sMin + ":" + sSeg)

 //see "Ejecutando.."
  
  end

# *****************  Counter 1 Hora *****************

	func Counter_Sesenta_Minutos

# Si estamos en el inicio del ciclo (60:00) y el timer se dispara:
    if nSegundos1h = 0
        if nMinutos1h = 0
            # Si ya llego a 00:00, reiniciamos a 60 minutos
            nMinutos1h  = 60
            nSegundos1h = 0
        else
            # Si los segundos estan en 0 pero quedan minutos,
            # bajamos un minuto y los segundos pasan a 59
            nMinutos1h = nMinutos1h - 1
            nSegundos1h = 59
        ok
    else
        # Caso normal: solo restamos un segundo
        nSegundos1h = nSegundos1h - 1
    ok

    # 4. Formatear la salida con ceros a la izquierda si es necesario
    sMin = "" + nMinutos1h
    sSeg = "" + nSegundos1h

    if nMinutos1h < 10  sMin = "0" + sMin ok
    if nSegundos1h < 10 sSeg = "0" + sSeg ok

    # 5. Actualizar la interfaz grafica con el resultado (04:59, 04:58...)
    oView.TextEdit11.setText(sMin + ":" + sSeg)

 //see "Ejecutando.."
  
  end
