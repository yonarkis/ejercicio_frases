
export async function encontrarFrases(req, res){

    const { texto, arrayFrases } = req.body

try{

        var sinEspacio = texto.replace(/ /g, "")

        var matrizTexto = sinEspacio.split("");

        var salida = []

        if (typeof (arrayFrases) == "undefined" || arrayFrases === null) {

        res.json({
            msg: "El array de frases esta vacio"
        })

    } else {
        
        for (var j = 0; j < arrayFrases.length; j++) {

            var sinEspacio2 = arrayFrases[j].replace(/ /g, "")
    
            var matrizFrases = sinEspacio2.split("");
    
            var letrasUsadas = []
    
        for (var i = 0; i < matrizTexto.length; i++) {
    
            var index = matrizTexto[i]
    
            let indice = matrizFrases.indexOf(index);
    
        if (indice > -1) {
            matrizFrases.splice(indice, 1);
         }
    
        if(matrizFrases.length === 0){
            letrasUsadas.push(index)
    
            salida.push(arrayFrases[j])
            break
         
        } else {
            continue
        }
    
        }
    
        for (var y = 0; y < letrasUsadas.length; y++) {
    
            var letraUsada = letrasUsadas[y]
            let indiceLetras = matrizTexto.indexOf(letraUsada);
    
            if (indiceLetras > -1) {
            matrizTexto.splice(indiceLetras, 1);
            }
        }
         
        }   
        
        res.json({
            data: salida
        })
    }

} catch(error){
    console.log(error)
    res.status(500).json({
        msg: "ha ocurrido un error inesperado",
        data:{}
    })
}
}