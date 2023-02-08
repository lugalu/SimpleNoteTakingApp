//
//  NoteEditingProtocols.swift
//  SnapKitTest
//
//  Created by Lugalu on 07/02/23.
//

import UIKit

protocol NoteEditingViewProtocol: UIViewController {
    var interactor: NoteEditingInteractorProtocol? {get set}
}

protocol NoteEditingPresenterProtocol {
    var view: NoteEditingViewProtocol? {get set}
}

protocol NoteEditingRouterProtocol {
    
    static func createView(_ note: Note?) -> NoteEditingViewProtocol
    
}

protocol NoteEditingInteractorProtocol{
    var note: Note? {get set}
    var presenter: NoteEditingPresenterProtocol? {get set}
}
