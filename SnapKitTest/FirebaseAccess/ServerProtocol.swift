//
//  ServerProtocol.swift
//  SnapKitTest
//
//  Created by Lugalu on 13/02/23.
//

import Foundation
import RxSwift

var ServerEntryPoint: ServerAccess {
    get {
        return FirebaseMain()
    }
}

protocol ServerAccess {
    func requestData() -> Single<[Note]>
    func insertNew(Note note: Note)
    func update(Note note: Note)
    func noteObserver() -> BehaviorSubject<[Note]>
}
