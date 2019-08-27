//
//  Extensions.swift
//  05-PianoApp
//
//  Created by Salvador Martí Solsona on 01/08/2019.
//  Copyright © 2019 Salvador Martí Solsona. All rights reserved.
//

// VAMOS A UTILIZAR ESTE ARCHIVO EXTENSIONS.SWIFT PARA EXTENDER FUNCIONALIDAD DE BOTONES.
//ES COMO EXTENDS DE JAVA

import Foundation
import UIKit

//Extensión de un UIButton (Sintaxis)
//Designable: diseñable ; IB: Interface Builder
@IBDesignable extension UIButton {
    
    //Estoy creando una nueva "propiedad" añadida que le llamo borderWidth, con setter y getter
    @IBInspectable var borderWidth : CGFloat {
        set {
            //capa --> layer | newValue es de tipo CGFloat (ya implementado?)
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    
    //Elementos de Inspector del Interface Builder
    @IBInspectable var cornerRadius : CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            return layer.cornerRadius
        }
    }

    @IBInspectable var borderColor : UIColor? {
        set {
          //Intenta    crear  UIColor  con  newValue  SINO  olvidate
            guard       let   uiColor   =   newValue  else  {return}
          //Si se ejecuta la linea siguiente es que alguien ha introducido valor para UIColor
            layer.borderColor = uiColor.cgColor
        }
        get {
            guard let color = layer.borderColor else {return nil}
            return UIColor(cgColor: color)
        }
    }
    

}
