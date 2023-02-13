//
//  NoteListingView + Delegate.swift
//  SnapKitTest
//
//  Created by Lugalu on 13/02/23.
//

import UIKit

extension NoteListingView: UITableViewDelegate{
  
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deletebutton = UIContextualAction(style: .destructive, title: "delete", handler: {[weak self] _,_,_ in
            guard let self, let datasource = self.notesView.dataSource else { return }
            datasource.tableView?(tableView, commit: .delete, forRowAt: indexPath)
        })
        
        deletebutton.image = UIImage(systemName: "trash")
        
        return UISwipeActionsConfiguration(actions: [ deletebutton ])
    }
    
}
