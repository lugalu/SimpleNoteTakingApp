//
//  NoteListingCell.swift
//  SnapKitTest
//
//  Created by Lugalu on 06/02/23.
//

import UIKit
import SnapKit

class NoteListingCell: UITableViewCell{
    var note: Note? = nil
    
    private var title: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        
        return label
    }()
    
    func configure(withNote note: Note){
        self.note = note
        makeUI()
        addContents()
    }
    
    private func makeUI(){
        title.snp.makeConstraints{ make in
            make.top.bottom.trailing.leading.equalToSuperview()
        }
    }
    
    private func addContents(){
        title.text = note?.title ?? ""
    }
}
