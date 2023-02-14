//
//  ServerProtocol.swift
//  SnapKitTest
//
//  Created by Lugalu on 13/02/23.
//

import Foundation
import RxSwift

protocol ServerAccess{
    var entryPoint: ServerAccess { get }
    
    func requestData() -> Single<[Note]>
    func insertNew(Note note: Note) -> Result<Void,Error>
    func update(Note note: Note) -> Result<Void, Error>
}

extension ServerAccess{
    var entryPoint: ServerAccess{ FirebaseMain() }
}
