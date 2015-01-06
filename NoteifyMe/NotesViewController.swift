//
//  NotesViewController.swift
//  NoteifyMe
//
//  Created by Justin Baumgartner  on 12/8/14.
//  Copyright (c) 2014 Justin Baumgartner. All rights reserved.
//

import UIKit
import NoteifyMeCommons

class NotesViewController : UITableViewController {
    
    private struct Constants {
        static let noteCellId = "NoteCell"
        static let storyboardId = "Main"
        static let editNoteControllerId = "EditNoteViewController"
    }
    
    private var notes: [Note] = []
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.registerNib(NoteTableViewCell.nibForClass(), forCellReuseIdentifier: Constants.noteCellId)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        notes = NoteBusinessService.getNotes()
    }
    
    // MARK: UITableViewDelegate
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Constants.noteCellId) as NoteTableViewCell
        cell.styleCellWithNote(notes[indexPath.row])
        return cell
    }
    
    // MARK: Actions
    
    @IBAction func addNote(barButtonItem: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: Constants.storyboardId, bundle: nil)
        let controller = storyboard.instantiateViewControllerWithIdentifier(Constants.editNoteControllerId) as UIViewController
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
