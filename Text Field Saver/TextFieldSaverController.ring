# Form/Window Controller - Source Code File

load "TextFieldSaverView.ring"
load "MainModule.ring"


import System.GUI

if IsMainSourceFile() {
	new App {
		StyleFusion()
		openWindow(:TextFieldSaverController)
		exec()
	}
}

class TextFieldSaverController from windowsControllerParent


	oView = new TextFieldSaverView
	oMiModelo = new MainModule    //Instanciamos Modelo



// Botón del formulario (Button1)
	    func GuardarAction
		# Contenedores para que la llamada sea mas limpia
		c1 = oView.LineEdit1.text()
		c2 = oView.LineEdit2.text()
		c3 = oView.LineEdit3.text()

		oMiModelo.SaveFields(c1, c2, c3)      // llamamos funcion del modelo
		
new qmessagebox(oView.win) {
                setgeometry(100,100,400,100)
                setwindowtitle("click event!")
                settext("Campos Guardados")
                show()
        }

	     end



	
