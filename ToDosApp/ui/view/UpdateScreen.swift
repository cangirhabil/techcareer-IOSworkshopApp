//
//  UpdateScreen.swift
//  ToDosApp
//
//  Created by HCangir on 25.05.2024.
//

import UIKit

class UpdateScreen: UIViewController {

    @IBOutlet weak var textFieldName: UITextField!
    var toDo: ToDosModel?
    var updateVM = UpdateViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Update Screen"
        
        if let t = toDo{
            textFieldName.text = t.name
        }
        
    }
    
    @IBAction func buttonUpdate(_ sender: Any) {
        if let t = toDo, let name = textFieldName.text{
            updateVM.update(toDo: t, name: name )
        }
    }
    
}
