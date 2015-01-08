//
//  EditNoteViewController.swift
//  NoteifyMe
//
//  Created by Justin Baumgartner  on 1/5/15.
//  Copyright (c) 2015 Justin Baumgartner. All rights reserved.
//

import UIKit
import NoteifyMeCommons

class EditNoteViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    // MARK: Properties
    
    var editingNote: Note?
    let colorArray = ["Gray", "Blue", "Green", "Orange", "Yellow", "Red"]

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var colorPicker: UIPickerView!
    
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
        if (editingNote == nil) {
            let note = Note(title: titleTextField.text, content: contentTextView.text, date: datePicker.date, color: Note.Color(rawValue: colorPicker.selectedRowInComponent(0))!)
            NoteBusinessService.addNote(note)
            
        } else {
            editingNote?.title = titleTextField.text
            editingNote?.content = contentTextView.text
            editingNote?.date = datePicker.date
            editingNote?.color = Note.Color(rawValue: colorPicker.selectedRowInComponent(0))!
            NoteBusinessService.saveNote(editingNote!)
        }
        
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func cancel(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    // MARK: UIPickerView
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colorArray.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return colorArray[row]
    }
    
    // MARK: Private helper methods
    
    private func setupEditMode() {
        if let note = editingNote {
            titleTextField.text = note.title
            contentTextView.text = note.content
            datePicker.date = note.date
            colorPicker.selectRow(note.color.rawValue, inComponent: 0, animated: false)
        }
    }
    
    private func styleTextView() {
        contentTextView.layer.borderColor = UIColor(red: 0xe8/255.0, green: 0xe8/255.0, blue: 0xe8/255.0, alpha: 1.0).CGColor
        contentTextView.layer.borderWidth = 1.0
        contentTextView.layer.cornerRadius = 5.0
    }

}
