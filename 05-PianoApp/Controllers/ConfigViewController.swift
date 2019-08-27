//
//  ConfigViewController.swift
//  05-PianoApp
//
//  Created by Salvador Martí Solsona on 06/08/2019.
//  Copyright © 2019 Salvador Martí Solsona. All rights reserved.
//

import UIKit
import AVFoundation

class ConfigViewController: UIViewController {
    
    //ATRIBUTOS DE LA CLASE ------------------------
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var volumenLabel: UILabel!
    @IBOutlet weak var volumenSlider: UISlider!
    //----------------------------------------------

    //MÉTODO AL CARGAR POR PRIMERA VEZ LA VISTA---------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        //Recupero la vista del TabBarController para asignar el valor general del volumen a el slider
        self.sliderLoaded()
    }
    //--------------------------------------------------------------------------------------------------
    
    //MÉTODO QUE SE EJECUTA SIEMPRE AL CAMBIAR Y SELECCIONAR ESTA VISTA---------------------------------
    override func viewDidAppear(_ animated: Bool) {
        //Recuperamos el volumen general, obligamos al usuario a hacer click en el botón de guardar-----
        self.sliderLoaded()
    }
    //---------------------------------------------------------------------------------------------------
    
    
    //Constructor por defecto (de la clase padre) ---
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    //-----------------------------------------------

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    //MARK: Evento click en botón guardar del NavBar
    /*
    @IBAction func savePressed(_ sender: UIBarButtonItem) {
        
    }
    */
    
    //MARK: Evento cambio de valor en el slider
    @IBAction func valueChanged(_ sender: UISlider) {
        self.actualizaEtiquetaVolumen(vol: sender.value)
        self.actualizaVolumenGeneral(volumen: self.volumenSlider.value)
    }
    
    //MARK: Funciones de la clase
    func actualizaEtiquetaVolumen(vol: Float) -> Void {
        self.volumenLabel.text = "\(String(Int(vol*100))) %"
        self.niveles(volumen: vol)
    }
    
    func niveles(volumen : Float) -> Void {
        if(volumen > 0.85) {
            self.volumenLabel.textColor = UIColor(displayP3Red: 1.0, green: 0.0, blue: 0.0, alpha: 0.80)
        }
        else if (volumen > 0.75){
            self.volumenLabel.textColor = UIColor(displayP3Red: 1.0, green: 164.0/255.0, blue: 32.0/255.0, alpha: 0.80)
        }
        else if (volumen > 0.20) {
            self.volumenLabel.textColor = UIColor(displayP3Red: 38.0/255.0, green: 161.0/255.0 , blue: 99.0/255.0, alpha: 0.80)
        }
        else {
            self.volumenLabel.textColor = UIColor(displayP3Red: 0.0, green: 0.0, blue: 0.0, alpha: 0.80)
        }
    }
    
    func actualizaVolumenGeneral(volumen : Float) -> Void {
        let tbc = self.tabBarController as! TBController
        tbc.volumenGeneral = volumen
    }
    
    
    private func sliderLoaded() -> Void {
        let tbc = self.tabBarController as! TBController
        self.volumenSlider.value = tbc.volumenGeneral
        self.actualizaEtiquetaVolumen(vol: self.volumenSlider.value)
    }
    
}
