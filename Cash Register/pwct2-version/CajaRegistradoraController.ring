# ************************************
# Cajero Simple
# Valentin Coellar S.
# 06/06/2026
# ************************************
load "CajaRegistradoraView.ring"
import System.GUI
if IsMainSourceFile() {
oApp= new App {
	StyleFusion()
	openWindow(:CajaRegistradoraController)
	exec()
}
}
class CajaRegistradoraController from windowsControllerParent
oView = new CajaRegistradoraView

	func Agregar  { 
		oView {
			sCajero = TextEditCajero.toPlainText()
			sArticulo = TextEditArticulo.toPlainText()
			sPrecio = TextEditPrecio.toPlainText()
			nRow = TableWidget1.rowCount()
			TextEditImpuesto.settext("0.16")
			nImpuesto = number(TextEditImpuesto.toPlainText())
			TableWidget1.insertrow(nRow)
			TableWidget1.setitem(nRow,1,new qtablewidgetitem(sArticulo))
			TableWidget1.setitem(nRow,2,new qtablewidgetitem(sPrecio))
			TableWidget1.setitem(nRow,4,new qtablewidgetitem(sCajero))
			#For para suma de totales
			nTotal = 0
			nFilas = TableWidget1.rowCount()
			for i = 1 to nFilas - 1 step 1 { 
				oItem = TableWidget1.item(i, 2)
				if not isnull(oItem) { 
					nPrecio = number(oItem.text())
					nTotal = nTotal + nPrecio
				}
			}
			TextEditSubtotal.settext(string(nTotal))
			TextEditTotal.settext(string(nTotal + (number(TextEditSubtotal.toPlainText() )* number(TextEditImpuesto.toPlainText() ))))
		}
	} 
