//
//  NoteModel.swift
//  SnapKitTest
//
//  Created by Lugalu on 03/02/23.
//

import Foundation
import RealmSwift

class Note: Object{
    @objc dynamic var id: UUID
    @objc dynamic var title: String
    @objc dynamic var content: String
    @objc dynamic var created: Date
    
    init(id: UUID, title: String, content: String, created: Date) {
        self.id = id
        self.title = title
        self.content = content
        self.created = created
    }
    
}
