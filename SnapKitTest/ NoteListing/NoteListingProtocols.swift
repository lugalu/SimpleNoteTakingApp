//
//  NoteListingProtocols.swift
//  SnapKitTest
//
//  Created by Lugalu on 05/02/23.
//

import UIKit

protocol NoteListingRouterProtocol{
    func openNoteEditing(withNote note: Note?, View view: UIViewController)
}

protocol NoteListingPresenterProtocol{
    var view: NoteListingViewProtocol? {get set}
    
    func presentNewNotes(newNotes: [Note])
}

protocol NoteListingInteractorProtocol{
    var presenter: NoteListingPresenterProtocol? {get set}
    
    func fetchAllNotes()
    
}

protocol NoteListingViewProtocol: UIViewController{
    var interactor: NoteListingInteractorProtocol? {get set}
    
    func insertNewContent(_ notes: [Note])
}
