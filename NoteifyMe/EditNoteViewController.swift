//
//  EditNoteViewController.swift
//  NoteifyMe
//
//  Created by Justin Baumgartner  on 1/5/15.
//  Copyright (c) 2015 Justin Baumgartner. All rights reserved.
//

import UIKit
import NoteifyMeCommons

class EditNoteViewController: UIViewController {
    
    // MARK: Properties
    
    var editingNote: Note?

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    // MARK: Lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleTextView()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        setupEditMode()
    }
    
    // MARK: Actions
    
    @IBAction func saveNote(sender: AnyObject) {
        let note = Note(title: titleTextField.text, content: contentTextView.text, date: datePicker.date)
        NoteBusinessService.addNote(note)
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func cancel(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    // MARK: Private helper methods
    
    private func setupEditMode() {
        if let note = editingNote {
            titleTextField.text = note.title
            contentTextView.text = note.content
            datePicker.date = note.date
        }
    }
    
    private func styleTextView() {
        contentTextView.layer.borderColor = UIColor(red: 0xe8/255.0, green: 0xe8/255.0, blue: 0xe8/255.0, alpha: 1.0).CGColor
        contentTextView.layer.borderWidth = 1.0
        contentTextView.layer.cornerRadius = 5.0
    }

}
