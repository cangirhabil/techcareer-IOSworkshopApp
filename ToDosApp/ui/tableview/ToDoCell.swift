//
//  ToDoCell.swift
//  ToDosApp
//
//  Created by HCangir on 25.05.2024.
//

import UIKit

class ToDoCell: UITableViewCell {
    var cellProtocol:CellProtocol?
    var indexPath:IndexPath?
    @IBOutlet weak var labelName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    @IBAction func deleteButton(_ sender: Any) {
        cellProtocol?.buttonDeleteClicked(indexPath: indexPath!)
    }
}

protocol CellProtocol{
    func buttonDeleteClicked(indexPath: IndexPath)
}
