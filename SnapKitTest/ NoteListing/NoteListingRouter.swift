//
//  NoteListingRouter.swift
//  SnapKitTest
//
//  Created by Lugalu on 05/02/23.
//

import UIKit


struct NoteListingRouter: NoteListingRouterProtocol {
    
    func openNoteEditing(withNote note: Note, View view: UIViewController) {
        if let navigation = view.navigationController{
            //Push Controller
            //navigation.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: true)
            return
        }
        //Present Controller
        // view.present(<#T##viewControllerToPresent: UIViewController##UIViewController#>, animated: true)
        return
    }
    
    static func createView() -> NoteListingViewProtocol{
        var view: NoteListingViewProtocol = NoteListingView()
        let presenter: NoteListingPresenterProtocol = NoteListingPresenter(view: view)
        let interactor: NoteListingInteractorProtocol = NoteListingInteractor(presenter: presenter)
        
        view.interactor = interactor
        
        return view
    }
}
