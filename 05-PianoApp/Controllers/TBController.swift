//
//  TBController.swift
//  05-PianoApp
//
//  Created by Salvador Martí Solsona on 07/08/2019.
//  Copyright © 2019 Salvador Martí Solsona. All rights reserved.
//

import UIKit
import AVFoundation

class TBController: UITabBarController {

    
    var volumenGeneral : Float

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.viewControllers = [pianoController,configController]
        // Do any additional setup after loading the view.
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.volumenGeneral = 0.45
        super.init(coder: aDecoder)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
