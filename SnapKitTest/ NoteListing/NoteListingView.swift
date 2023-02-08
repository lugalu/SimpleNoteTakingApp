//
//  NoteListingView.swift
//  SnapKitTest
//
//  Created by Lugalu on 05/02/23.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

//TODO: USE VIP
class NoteListingView: UIViewController, NoteListingViewProtocol {

    
    let disposeBag = DisposeBag()
    
    let notesView: UITableView = UITableView()
    var interactor: NoteListingInteractorProtocol? = nil
    var notes: AsyncSubject<[Note]> = AsyncSubject()
    
    init(){
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        //TODO: add the logic to determine which database should be accessed
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fetchNotes()
        self.makeUI()
        self.configureElements()
        
    }

    func fetchNotes(){
        interactor?.fetchAllNotes()
    }
    
    func configureElements(){
        _ = notes.bind(to: notesView.rx.items(cellIdentifier: "NotesListingCell", cellType: NoteListingCell.self)){ [weak self] _, note, cell in
            cell.configure(withNote: note)
        }.disposed(by: disposeBag)
        
        notesView.rx.modelSelected(NoteListingCell.self)
            .subscribe(onNext: {[weak self] element in
                guard let note = element.note, let self else { return }
                
                let router: NoteListingRouterProtocol? = NoteListingRouter()
                router?.openNoteEditing(withNote: note, View: self)
                
            }).disposed(by: disposeBag)
        
    }

    func insertNewContent(_ notes: [Note]) {
        self.notes.onNext(notes)
    }
    
}



