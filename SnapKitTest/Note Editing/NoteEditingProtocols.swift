//
//  NoteEditingProtocols.swift
//  SnapKitTest
//
//  Created by Lugalu on 07/02/23.
//

import UIKit

protocol NoteEditingViewProtocol: UIViewController {
    var interactor: NoteEditingInteractorProtocol? { get set }
    
    func couldSave(_ status: Bool)
    func insertContents(_ note: Note)
}

protocol NoteEditingPresenterProtocol {
    var view: NoteEditingViewProtocol? { get set }
    
    func insertContents(_ note: Note)
    func couldSave(_ status: Bool)
}

protocol NoteEditingRouterProtocol {
    static func createView(_ note: Note?, accessLevel: AccessType) -> NoteEditingViewProtocol
}

protocol NoteEditingInteractorProtocol{
    var note: Note? {get set}
    var presenter: NoteEditingPresenterProtocol? { get set }
    
    func save(withTitle title: String?, withContent content: String?)
}
