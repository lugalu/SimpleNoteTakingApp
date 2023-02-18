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
    lazy var notes: BehaviorRelay<[Note]> = BehaviorRelay(value: [])
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notesView.register(NoteListingCell.self, forCellReuseIdentifier: "NotesListingCell")
        notesView.rowHeight = 60
        notesView.delegate = self
        
        self.configureElements()
        self.makeUI()
        
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Task{
            self.fetchNotes()
        }
    }
    
    func fetchNotes(){
        interactor?.fetchAllNotes()
    }
    
    func configureElements(){
        DispatchQueue.main.async {
            
            _ = self.notes.bind(to: self.notesView.rx.items(cellIdentifier: "NotesListingCell", cellType: NoteListingCell.self)){ index, note, cell in
                cell.configure(withNote: note)
            }
            
            self.notesView.rx.modelSelected(Note.self)
                .subscribe(onNext: {[weak self] element in
                    guard let self else { return }
                    
                    let router: NoteListingRouterProtocol? = NoteListingRouter()
                    router?.openNoteEditing(withNote: element, View: self)
                    
                }).disposed(by: self.disposeBag)
            
            _ = self.notesView.rx.itemDeleted.subscribe(onNext: { [weak self] indexPath in
                guard let self else { return }
                var notesCopy = self.notes.value
                let note = notesCopy.remove(at: indexPath.row)
                
                switch note.deleteNote() {
                case.success(_):
                    print("success deleting")
                    self.notes.accept(notesCopy)
                case .failure(let error):
                    print(error.localizedDescription)
                }
                
            })
        }
    }

    func insertNewContent(_ notes: [Note]) {
        self.notes.accept(notes)
    }
    
}





