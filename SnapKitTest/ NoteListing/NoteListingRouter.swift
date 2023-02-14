//
//  NoteListingRouter.swift
//  SnapKitTest
//
//  Created by Lugalu on 05/02/23.
//

import UIKit


struct NoteListingRouter: NoteListingRouterProtocol {
    
    func openNoteEditing(withNote note: Note? = nil, View vc: (NoteListingView)) {
        let view: NoteEditingViewProtocol = NoteEditingView()
        var presenter: NoteEditingPresenterProtocol = NoteEditingPresenter()
        var interactor: NoteEditingInteractorProtocol = NoteEditingInteractor(accessLevel: vc.interactor?.accessLevel ?? .privateDB)
        
        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view
        
        interactor.note = note
        
        if let navigation = vc.navigationController{
            navigation.pushViewController(view, animated: true)
        }
    }
    
    static func createView(withAccessLevel accessLevel: AccessType) -> NoteListingViewProtocol{
        let view: NoteListingViewProtocol = NoteListingView()
        var presenter: NoteListingPresenterProtocol = NoteListingPresenter()
        var interactor: NoteListingInteractorProtocol = NoteListingInteractor(accessLevel: accessLevel)
        
        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view
        
        return view
    }
}
