//
//  ViewController.swift
//  ToDosApp
//
//  Created by HCangir on 25.05.2024.
//

import UIKit

class MainScreen: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var toDosTableView: UITableView!
    var toDosList = [ToDosModel]()
    
    var mainVM = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTeheme()
        searchBar.delegate = self
        toDosTableView.delegate = self
        toDosTableView.dataSource = self
        _ = mainVM.toDosList.subscribe(onNext: { list in
            self.toDosList = list
            self.toDosTableView.reloadData()
        })
     }
    
    
    override func viewWillAppear(_ animated: Bool) {
        mainVM.loadToDos()
    }
                                  
   
    func setupTeheme(){
        self.navigationItem.title = "ToDos"
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "MainColor")
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor(named: "AlternativeColor1")!,
            .font: UIFont(name: "Pacifico-Regular", size: 22)!]
        navigationController?.navigationBar.tintColor = UIColor(named: "AlternativeColor1")
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare çalisti")
        if segue.identifier == "toUpdate" {
            print("toUpdate çalisti")
            if let toDo = sender as? ToDosModel {//Downcasting (Superclass > Subclass)
                let destinationVC = segue.destination as! UpdateScreen
                destinationVC.toDo = toDo
            }
        }
    }
}

extension MainScreen : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            mainVM.loadToDos ()
        }else{
            mainVM.search(searchText: searchText)
        }
    }
}

extension MainScreen: UITableViewDelegate, UITableViewDataSource, CellProtocol{
    func buttonDeleteClicked(indexPath: IndexPath) {
        let toDo = self.toDosList[indexPath.row]
        let alert = UIAlertController(title: "Delete Process", message: "Do you want to delete the \(toDo.name!) ?", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(cancelAction)
        let yesAction = UIAlertAction(title: "Yes", style: .destructive){ action in
            self.mainVM.delete(toDo: toDo)
        }
        alert.addAction(yesAction)
        self.present(alert, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDosList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoCell") as! ToDoCell
        let toDo = toDosList[indexPath.row]
        cell.labelName.text = toDo.name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toDo = toDosList[indexPath.row]
        performSegue(withIdentifier: "toUpdate", sender: toDo)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

    func tableView(_ tableView: UITableView,trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){
            contextualAction, view, bool in
            let toDo = self.toDosList[indexPath.row]
            
            
            let alert = UIAlertController(title: "Delete Process", message: "Do you want to delete '\(toDo.name!)'?", preferredStyle: .alert)
            let cancleAction = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(cancleAction)
            
            let yesAction = UIAlertAction(title: "Yes", style: .destructive){ action in
                self.mainVM.delete(toDo: toDo)
            }
            
            alert.addAction(yesAction)
            
            self.present(alert, animated: true)
            
            
            
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
