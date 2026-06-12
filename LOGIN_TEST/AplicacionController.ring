# Form/Window Controller - Source Code File

load "AplicacionView.ring"

import System.GUI

if IsMainSourceFile() {
	new App {
		StyleFusion()
		openWindow(:AplicacionController)
		exec()
	}
}

class AplicacionController from windowsControllerParent

	oView = new AplicacionView
