//
//  PianoViewController.swift
//  05-PianoApp
//
//  Created by Salvador Martí Solsona on 07/08/2019.
//  Copyright © 2019 Salvador Martí Solsona. All rights reserved.
//

import UIKit
import AVFoundation

class PianoViewController: UIViewController {

    //Atributos
    let notas : [String]
    var reproductor : AVAudioPlayer
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.notas = ["c1","c1s","d1","d1s","e1","f1","f1s","g1","g1s","a1","a1s","b1","c2"]
        self.reproductor = AVAudioPlayer()
        super.init(coder: aDecoder)
    }
    
    
    //MARK: - Eventos de los botones
    //EVENTO QUE CAPTURA EL TOUCH DE LOS BOTONES, SE NECESITA CONFIGURAR PARA TODOS.
    @IBAction func playSound(_ sender: UIButton) {
        
        let etiquetaBoton : Int = sender.tag //Recupero etiqueta del botón
        let nota : String = self.notas[etiquetaBoton] //Recupero la nota correspondiente accediendo a la posicion del vector de notas
        
        //Genero ruta/path del fichero-sonido mediante un objeto de la clase Bundle. Llamo a .main.path
        let sonido = Bundle.main.path(forResource: nota, ofType: "mp3")
        //A continuación llamo a la clase URL pasándole en el constructor la ruta generada
        let urlSonido = URL(fileURLWithPath: sonido!)
        //----------------------------------------------------------------------------------------------
        
        do {
            self.reproductor = try AVAudioPlayer(contentsOf: urlSonido)
        }
        catch{
            print(error)
            return
        }
        //print("Tu nota: \(nota)")
        
        let tbc = self.tabBarController as! TBController
        self.reproductor.volume = tbc.volumenGeneral
        self.reproductor.play()
    }

}
