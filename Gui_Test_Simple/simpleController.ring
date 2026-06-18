# Form/Window Controller - Source Code File

load "simpleView.ring"

import System.GUI

if IsMainSourceFile() {
	new App {
		StyleFusion()
		openWindow(:simpleController)
		exec()
	}
}

class simpleController from windowsControllerParent

	oView = new simpleView


	func Cierra
		oView {
			oApp.Quit()
		}
