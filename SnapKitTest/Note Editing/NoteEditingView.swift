//
//  NoteEditingView.swift
//  SnapKitTest
//
//  Created by Lugalu on 07/02/23.
//

import UIKit
import RxSwift

class NoteEditingView: UIViewController, NoteEditingViewProtocol {
    
    var disposeBag: DisposeBag = DisposeBag()
    
    
    var interactor: NoteEditingInteractorProtocol? = nil
    
    var noteTitleView: UITextField = {
        var textfield = UITextField()
        textfield.font = .systemFont(ofSize: 20, weight: .semibold)
        
        return textfield
    }()
    
    var noteContentView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Editing"
        makeUI()
        
    }
    
    func couldSave(_ status: Bool) {
        self.navigationItem.title = status ? "Saved" : "Couldn't Save"
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {

            self.navigationItem.title = "Editing"
        }
    }

    func insertContents(_ note: Note) {
        self.noteTitleView.text = note.title
        self.noteContentView.text = note.content
    }
}
