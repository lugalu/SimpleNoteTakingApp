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
        
        //create New Note
    }

    private func saveExisting(_ title: String? = "", content: String? = ""){
        // Call Service
    }
    
    private func createNewNote(_ title: String? = "", content: String? = ""){
        // Call Service
    }
    
    // Missing Service
    // Save/Create note in realm
    // Warn presenter
    
}
