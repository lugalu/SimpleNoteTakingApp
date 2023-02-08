//
//  NotesListingPresenter.swift
//  SnapKitTest
//
//  Created by Lugalu on 05/02/23.
//

import Foundation

class NoteListingPresenter: NoteListingPresenterProtocol {
    var view: NoteListingViewProtocol? = nil
    
    init(view: NoteListingViewProtocol? = nil) {
        self.view = view
    }
    
    func presentNewNotes(newNotes: [Note]){
        view?.insertNewContent(newNotes)
    }
}
