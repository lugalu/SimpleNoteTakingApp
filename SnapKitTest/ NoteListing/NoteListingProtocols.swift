//
//  NoteListingProtocols.swift
//  SnapKitTest
//
//  Created by Lugalu on 05/02/23.
//

import UIKit

protocol NoteListingRouterProtocol{
    func openNoteEditing(withNote note: Note, View view: UIViewController)
}

protocol NoteListingPresenterProtocol{
    func presentNewNotes(newNotes: [Note])
}

protocol NoteListingInteractorProtocol{
    
    func fetchAllNotes()
    
}

protocol NoteListingViewProtocol{
    func insertNewContent(_ notes: [Note])
}
