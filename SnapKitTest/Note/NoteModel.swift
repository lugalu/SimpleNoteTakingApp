//
//  NoteModel.swift
//  SnapKitTest
//
//  Created by Lugalu on 03/02/23.
//

import Foundation
import RxSwift
import RealmSwift
import FirebaseDatabase

class Note: Object, Decodable{
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
    
    static func newFrom(snapshot: DataSnapshot) -> Note?{
        
        
        guard
          let value = snapshot.value as? [String: AnyObject],
          let idString = value["id"] as? String,
          let id = UUID(uuidString: idString),
          let title = value["title"] as? String,
          let content = value["content"] as? String,
          let createdString = value["created"] as? String
        else {
            print("error converting")
          return nil
        }
        
        
        
        let note = Note()
        
        guard let created = note.getDateFormatter().date(from: createdString) else {
            print("error converting date")
            return nil
        }
        
        note.id = id
        note.title = title
        note.content = content
        note.created = created
        
        return note
    }
    
    func toAnyObject() -> Any{
        let stringDate = getDateFormatter().string(from: self.created)
       
        return [
            "id": id.uuidString,
            "title": title,
            "content": content,
            "created": stringDate
        ]
        
    }
    
    private func getDateFormatter() -> DateFormatter{
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        
        return dateFormatter
    }
    
}
