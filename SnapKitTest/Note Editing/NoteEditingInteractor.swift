//
//  NoteEditingInteractor.swift
//  SnapKitTest
//
//  Created by Lugalu on 07/02/23.
//

import Foundation

class NoteEditingInteractor: NoteEditingInteractorProtocol{
    var presenter: NoteEditingPresenterProtocol?
    
    var note: Note? = nil {
        didSet{
            //warn Presenter to fill the UI with the data
            //self?.presenter
        }
    }

    func save(){
        //warn presenter if it worked or not
    }
    
    // Save note if correct
    // Save note Title if correct
    // Save/Create note in realm
    // Warn presenter
    
}
