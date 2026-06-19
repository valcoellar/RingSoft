# Form/Window Controller - Source Code File

load "reporteView.ring"
load "pdfgen.ring"

import System.GUI

if IsMainSourceFile() {
	new App {
		StyleFusion()
		openWindow(:reporteController)
		exec()
	}
}

class reporteController from windowsControllerParent

	oView = new reporteView


	func imprime
		sTexto = oView.textEdit1.toPlaintext()
		oView {
			
		//	-----




cPDFFileName = "output.pdf"

pdf = pdf_create(PDF_LETTER_WIDTH, PDF_LETTER_HEIGHT, [
        :creator  = "Ring",
        :producer = "Ring",
        :title    = "PDF Report",
        :author   = "Valentin Coellar ",
        :subject  = "Report",
        :date     = "18/06/2026"
] )

pdf_set_font(pdf, "Times-Roman")
pdf_append_page(pdf)

pdf_add_text(pdf, NULL, sTexto, 12, 100, 720, PDF_BLACK)
                              //size, xoff, yoff, de abajo hacia arriba

// Dividir texto en líneas manualmente
        aLineas = split(sTexto, nl)
        nY = 720
        for linea in aLineas
            pdf_add_text(pdf, NULL, linea, 12, 100, nY, PDF_BLACK)
            nY -= 14  // interlineado
        next

                              

pdf_save(pdf, cPDFFileName)
pdf_destroy(pdf)

system(cPDFFileName)


			

			}
