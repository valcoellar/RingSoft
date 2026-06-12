load "loginView.ring"
import System.GUI
if IsMainSourceFile() {
oApp= new App {
	StyleFusion()
	openWindow(:loginController)
	exec()
}
}
class loginController from windowsControllerParent
oView = new loginView

	func Entrar  { 
		oView {
			usr = TextEditUser.toPlainText()
			pass = TextEditPass.toPlainText()
		}
		ValidaUsuario(usr,pass,oView)
	} 
load "MainModule.ring"
