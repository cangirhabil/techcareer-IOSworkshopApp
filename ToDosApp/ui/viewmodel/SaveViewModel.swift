//
//  SaveViewModel.swift
//  ToDosApp
//
//  Created by HCangir on 26.05.2024.
//

import Foundation
class SaveViewModel{
    var toDosRepo = ToDosDaoReporistory()
    
    func save (name:String){
        toDosRepo.save(name: name)
    }
}
