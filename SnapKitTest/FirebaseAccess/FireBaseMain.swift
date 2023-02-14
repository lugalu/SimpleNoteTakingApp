//
//  FireBaseMain.swift
//  SnapKitTest
//
//  Created by Lugalu on 13/02/23.
//

import FirebaseCore
import RxSwift

enum AccessType{
    case privateDB
    case publicDB
}

class FirebaseMain: ServerAccess{
    func requestData() -> Single<[Note]> {
        return Single.create{ _ in
            
            return Disposables.create()
        }
    }
    
    func insertNew(Note note: Note) -> Result<Void, Error> {
        return .success(())
    }
    
    func update(Note note: Note) -> Result<Void, Error> {
        return .success(())
    }
    
    
}
