# Form/Window Controller - Source Code File

load "TextEditorView.ring"
load "TextEditorModule.ring"    # Cargamos nuestro Modulo

import System.GUI

if IsMainSourceFile() {
	new App {
		StyleFusion()
		openWindow(:TextEditorController)
		exec()
	}
}

class TextEditorController from windowsControllerParent

	oView = new TextEditorView
	oModuloPrincipal = new ModuloPrincipal  # Instanciamos nuestro Modulo

# Creamos los eventos que disparan las acciones 
func	LoadFile
	# Obtenemos el nombre del archivo	
	new qfiledialog("") {cName = getopenfilename("","open file","\","Text files(*.txt)") }
	# Colocamos la ruta cName en NombreArchivo
	oView.NombreArchivo.setText(cName)
	# abrimos el archivo y cargamos su contenido en memoria
	cFileContents = read(cName)
	# Colocamos el contenido en TextEdit1
	oView.TextEdit1.setText(cFileContents)

	oModuloPrincipal.CargarArchivo()
end
	
	func	SaveFile
	oModuloPrincipal.GuardarArchivo()
	end
