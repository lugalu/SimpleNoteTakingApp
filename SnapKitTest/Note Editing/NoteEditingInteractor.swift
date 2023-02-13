//
//  NoteEditingInteractor.swift
//  SnapKitTest
//
//  Created by Lugalu on 07/02/23.
//

import Foundation

class NoteEditingInteractor: NoteEditingInteractorProtocol {
    var presenter: NoteEditingPresenterProtocol?
    
    var note: Note? = nil {
        didSet{
            guard let note else { return }
            self.presenter?.insertContents(note)
        }
    }

    func save(withTitle title: String? = "", withContent content: String? = "") {
        //warn presenter if it worked or not
        
        if note != nil {
            saveExisting(title, content: content)
            return
        }
        
        createNewNote(title, content: content)
    }

    private func saveExisting(_ title: String? = "", content: String? = ""){
        switch note?.editNote(title: title, content: content) {
        case .success(_):
            print("Success saving")
            presenter?.couldSave(true)
        case .failure(let error):
            print(error.localizedDescription)
            presenter?.couldSave(false)
        default:
            print("note is nil")
        }
    }
    
    private func createNewNote(_ title: String? = "", content: String? = ""){
        
        switch Note.insertNewNote(withTitle: title, withContent: content) {
        case .success( let newNote):
            self.note = newNote
            presenter?.couldSave(true)
        case .failure(let error):
            print(error.localizedDescription)
            presenter?.couldSave(false)
        }
    }
    
}
