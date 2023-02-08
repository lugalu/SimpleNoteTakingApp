//
//  NoteEditingRouter.swift
//  SnapKitTest
//
//  Created by Lugalu on 07/02/23.
//

import Foundation

class NoteEditingRouter: NoteEditingRouterProtocol{
    static func createView(_ note: Note? = nil) -> NoteEditingViewProtocol {
        var view: NoteEditingViewProtocol = NoteEditingView()
        var interactor: NoteEditingInteractorProtocol = NoteEditingInteractor()
        var presenter: NoteEditingPresenterProtocol = NoteEditingPresenter()
        
        interactor.presenter = presenter
        presenter.view = view
        view.interactor = interactor
        
        if let note {
            interactor.note = note
        }
        
        return view
    }
    
    
}
