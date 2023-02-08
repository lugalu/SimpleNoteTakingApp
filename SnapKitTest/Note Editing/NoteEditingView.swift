//
//  NoteEditingView.swift
//  SnapKitTest
//
//  Created by Lugalu on 07/02/23.
//

import UIKit


class NoteEditingView: UIViewController, NoteEditingViewProtocol {
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
        createSubscribers()
    }

    func createSubscribers(){
        
    }
    
    func couldSave(){
        self.navigationItem.title = "Saved"
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.navigationItem.title = "Editing"
        }
    }
    
    func couldntSave(){
        
    }

}

extension NoteEditingView{
    public func makeUI(){
        addViews()
        makeConstraints()
        
    }
    
    private func addViews(){
        view.addSubview(noteTitleView)
        view.addSubview(noteContentView)
    }
    
    private func makeConstraints(){
        noteTitleView.snp.makeConstraints{ make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(30)
        }
        
        noteContentView.snp.makeConstraints{ make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(noteTitleView.snp.bottom).offset(16)
            make.bottom.equalToSuperview()
            
        }
        
        
    }
    
    
}
