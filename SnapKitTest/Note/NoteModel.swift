//
//  NoteModel.swift
//  SnapKitTest
//
//  Created by Lugalu on 03/02/23.
//

import Foundation
import RealmSwift

class Note: Object{
    @objc dynamic var id: UUID = UUID()
    @objc dynamic var title = ""
    @objc dynamic var content = ""
    @objc dynamic var lastEdited = Date()
}
