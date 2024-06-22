//
//  UpdateViewModel.swift
//  ToDosApp
//
//  Created by HCangir on 26.05.2024.
//

import Foundation
class UpdateViewModel{
    var toDosRepo = ToDosDaoReporistory()
    
    func update(toDo: ToDosModel,name: String){
        toDosRepo.update(toDo: toDo, name: name)
    }
}
