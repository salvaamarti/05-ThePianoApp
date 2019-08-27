//
//  SecondViewController.swift
//  05-PianoApp
//
//  Created by Salvador Martí Solsona on 06/08/2019.
//  Copyright © 2019 Salvador Martí Solsona. All rights reserved.
//

import UIKit


//CONTROLADORES FUEREA DE USO. NO SE GASTAN EN LA APP. BASURA (HISTORICO)
class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let elementos : [String] = ["Volumen"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    required init?(coder aDecoder: NSCoder) {
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
    
    //MARK: DataSource of UITableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.elementos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "ConfigCell", for: indexPath)
        
        let item = self.elementos[indexPath.row]
        
        cell.textLabel?.text = item
        
        return cell
        
        
    }

}
