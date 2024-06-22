//
//  SaveScreen.swift
//  ToDosApp
//
//  Created by HCangir on 25.05.2024.
//

import UIKit

class SaveScreen: UIViewController {

    @IBOutlet weak var textFieldName: UITextField!
    var SaveVM = SaveViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Save Screen"
    }
    
    @IBAction func buttonSave(_ sender: Any) {
        if let name = textFieldName.text{
            SaveVM.save(name: name)
        }
    }
}
