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

    # Construir HTML con estilos inline (mejor compatibilidad con QTextDocument)
    cHTML = generarHTML(sTexto)

    # Crear documento y exportar a PDF
    oPrinter = new qPrinter(0)
    oPrinter.setOutputFormat(1)         # PdfFormat
    oPrinter.setOutputFileName(cPDFFileName)

    oDoc = new qTextDocument()
    oDoc.setHtml(cHTML)

    oDoc.print(oPrinter)

    system(cPDFFileName)
end

func generarHTML(sTexto)
    aParrafos = split(sTexto, nl)
    cContenido = ""
    for parrafo in aParrafos
        if trim(parrafo) != ""
            cContenido += "<p>" + parrafo + "</p>"
        ok
    next

    cHTML = "<html>
<body style='font-family: Times New Roman; font-size: 12pt; line-height: 1.6;'>
    <h1 style='text-align: center; color: #2c3e50; border-bottom: 2px solid #333; padding-bottom: 10px;'>
        Reporte Generado
    </h1>
    <p style='text-align: center; font-size: 10pt; color: #666;'>
        " + date() + " - Valentin Coellar
    </p>
    <hr>
    <div style='text-align: justify;'>
        " + cContenido + "
    </div>
</body>
</html>"

    return cHTML
end
