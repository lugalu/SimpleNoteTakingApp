//
//  NoteEditingInteractor.swift
//  SnapKitTest
//
//  Created by Lugalu on 07/02/23.
//

import Foundation

class NoteEditingInteractor: NoteEditingInteractorProtocol {
    var presenter: NoteEditingPresenterProtocol?
    var accessLevel: AccessType
    
    init(accessLevel: AccessType) {
        self.accessLevel = accessLevel
    }
    
    var note: Note? = nil {
        didSet{
            guard let note else { return }
            self.presenter?.insertContents(note)
        }
    }

    func save(withTitle title: String? = "", withContent content: String? = "") {
        
        if note != nil {
            saveExisting(title, content: content)
            return
        }
        
        createNewNote(title, content: content)
    }

    private func saveExisting(_ title: String? = "", content: String? = ""){
        accessLevel == .publicDB ? saveToCloud(title, content) : saveToLocal(title, content)
    }
    
    private func saveToLocal(_ title: String? = "", _ content: String? = ""){
        switch note?.editNote(title: title, content: content) {
        case .success(_):
            presenter?.couldSave(true)
            
        case .failure(_):
            presenter?.couldSave(false)
            
        default:
            print("note is nil")
        }
    }
    
    private func saveToCloud(_ title:String? = "", _ content: String? = ""){
        
    }
    
    private func createNewNote(_ title: String? = "", content: String? = ""){
        accessLevel == .publicDB ? uploadNewNote(title,content) : createNewLocalNote(title,content)
        
    }
    
    func createNewLocalNote(_ title: String? = "", _ content: String? = "") {
        switch Note.insertNewNote(withTitle: title, withContent: content) {
        case .success( let newNote):
            self.note = newNote
            presenter?.couldSave(true)
        case .failure(let error):
            print(error.localizedDescription)
            presenter?.couldSave(false)
        }
    }
    
    func uploadNewNote(_ title: String? = "", _ content: String? = "") {
        
    }
}
