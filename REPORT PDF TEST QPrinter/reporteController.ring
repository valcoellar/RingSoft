# Form/Window Controller - Source Code File

load "guilib.ring"
load "reporteView.ring"

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
    cPDFFileName = "output.pdf"

    oPrinter = new qPrinter(0)
    oPrinter.setOutputFormat(1)         // PdfFormat
    oPrinter.setOutputFileName(cPDFFileName)

    new qpainter() {
        begin(oPrinter)

        myfont = new qfont("Times", 12, -1, 0)
        setfont(myfont)

        nMargenIzq = 100
        nMargenTop = 100
        nAnchoUtil = 412
        nAltoPagina = 792
        nInterlineado = 14
        nY = nMargenTop

        aLineas = split(sTexto, nl)

        for linea in aLineas
            if nY > nAltoPagina - nMargenTop
                oPrinter.newpage()
                nY = nMargenTop
            ok

            drawtext(nMargenIzq, nY, linea)
            nY += nInterlineado
        next

        endpaint()
    }

    system(cPDFFileName)
end
   
