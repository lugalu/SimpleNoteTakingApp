//
//  NoteEditingPresenter.swift
//  SnapKitTest
//
//  Created by Lugalu on 07/02/23.
//

import Foundation

class NoteEditingPresenter: NoteEditingPresenterProtocol {
    var view: NoteEditingViewProtocol?
    
    func couldSave(_ status: Bool) {
        view?.couldSave(status)
    }
    
    func insertContents(_ note: Note) {
        view?.insertContents(note)
    }
    
}
