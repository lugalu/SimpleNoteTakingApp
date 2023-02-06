//
//  NoteListingProtocols.swift
//  SnapKitTest
//
//  Created by Lugalu on 05/02/23.
//

import Foundation

protocol NoteListingRouterProtocol{
    
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
