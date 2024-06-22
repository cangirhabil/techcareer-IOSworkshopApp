//
//  MainViewModel.swift
//  ToDosApp
//
//  Created by HCangir on 26.05.2024.
//

import Foundation
import RxSwift
class MainViewModel{
    private var toDosRepo = ToDosDaoReporistory()
    
    var toDosList = BehaviorSubject<[ToDosModel]>(value: [ToDosModel]())
    
    init(){//Siniftan nesne olusturuldugunda çalisir.
        toDosList = toDosRepo.toDosList
    }
        
    func delete(toDo:ToDosModel){
        toDosRepo.delete(toDo: toDo)
        loadToDos()
    }
    func search(searchText: String){
        toDosRepo.search(searchText: searchText)
    }
    
    func loadToDos(){
        toDosRepo.loadToDos()
    }
}
