//
//  EditNoteViewController.swift
//  NoteifyMe
//
//  Created by Justin Baumgartner  on 1/5/15.
//  Copyright (c) 2015 Justin Baumgartner. All rights reserved.
//

import UIKit

class EditNoteViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleTextView()
    }
    
    // MARK: Actions
    
    @IBAction func saveNote(sender: AnyObject) {
        
    }
    
    @IBAction func cancel(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    // MARK: Private helper methods
    
    func styleTextView() {
        contentTextView.layer.borderColor = UIColor(red: 0xe8/255.0, green: 0xe8/255.0, blue: 0xe8/255.0, alpha: 1.0).CGColor
        contentTextView.layer.borderWidth = 1.0
        contentTextView.layer.cornerRadius = 5.0
    }

}
