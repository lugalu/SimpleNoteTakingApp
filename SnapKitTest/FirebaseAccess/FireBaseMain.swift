//
//  FireBaseMain.swift
//  SnapKitTest
//
//  Created by Lugalu on 13/02/23.
//

import FirebaseCoreInternal
import FirebaseDatabase
import FirebaseCore

import RxSwift

enum AccessType{
    case privateDB
    case publicDB
}

class FirebaseMain: ServerAccess{
    private let databaseRef = Database.database().reference(withPath: "Notes")
    private var refObservers: [DatabaseHandle] = []
    private var valueUpdated: BehaviorSubject<[Note]> = BehaviorSubject<[Note]>(value: [])
    
    init(){
        databaseRef.observe(.value, with: { snapshots in
            var newItens: [Note] = []
            
            for newItem in snapshots.children{
                
                guard let snapshot = newItem as? DataSnapshot,
                      let newNote = Note.newFrom(snapshot: snapshot) else {
                    continue
                }
                newItens.append(newNote)
            }
            
            self.valueUpdated.onNext(newItens)
            
        })
    }
    
    func requestData() -> Single<[Note]> {
        return Single.create{ _ in
            
            
            
            return Disposables.create()
        }
        
        
    }
    
    func insertNew(Note note: Note){
        let noteRef = self.databaseRef.child(note.id.uuidString)
        noteRef.setValue(note.toAnyObject())
    }
    
    func update(Note note: Note){
        let noteRef = self.databaseRef.child(note.id.uuidString)
        noteRef.updateChildValues([
            "title" : note.title,
            "content": note.content
        ])
    }
    
    func noteObserver() -> BehaviorSubject<[Note]>{
        return self.valueUpdated
    }
    
}
