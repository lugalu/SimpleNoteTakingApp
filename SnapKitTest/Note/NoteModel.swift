//
//  NoteModel.swift
//  SnapKitTest
//
//  Created by Lugalu on 03/02/23.
//

import Foundation
import RxSwift
import RealmSwift

class Note: Object{
    @objc dynamic var id: UUID = UUID()
    @objc dynamic var title: String = ""
    @objc dynamic var content: String = ""
    @objc dynamic var created: Date = Date()
    
    
    
    func editNote(title: String? = nil, content: String? = nil) -> Result<Void, Error> {
        do{
            try realm?.write({
                if let title, self.title != title {
                    self.title = title
                }
                
                if let content, self.content != content{
                    self.content = content
                }
            })
            
            return .success(())
            
        }catch{
            return .failure(error)
        }
    }
    
    func deleteNote() -> Result<Void, Error> {
        do{
            try self.realm?.write{
                realm?.delete(self)
            }
            
            
            return .success(())
            
        }catch{
            return .failure(error)
        }
    }
    
    static func insertNewNote(withTitle title: String? = "", withContent content: String? = "") -> Result<Note, Error> {
        do{
            
            
            var note = Note()
            
            note.title = title ?? ""
            note.content = content ?? ""
        
            let realm = try Realm()
            try realm.write{
                realm.add(note)
            }
            
            return .success(note)
            
        }catch{
            return .failure(error)
        }
        
    }
 
    static func retrieveAllNotes() -> Single<[Note]> {
        return Single<[Note]>.create { single in
            do{
                let realm = try Realm()
                let notes: Results<Note> = {
                    realm.objects(Note.self)
                }()
                
                let arr: [Note] = notes.map({$0 as Note})
                
                single(.success(arr))
                
            }catch{
                single(.failure(error))
            }
            
            return Disposables.create()
            
        }
    }
    
}
