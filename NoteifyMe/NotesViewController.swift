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
        tableView.estimatedRowHeight = 75.0
        setupRefresh()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        reloadData()
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
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        pushToEditNotesController(notes[indexPath.row])
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            NoteBusinessService.deleteNote(notes[indexPath.row].uuid)
            notes.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths(NSArray(object: indexPath), withRowAnimation: .Automatic)
        }
    }
    
    // MARK: Actions
    
    @IBAction func addNote(barButtonItem: UIBarButtonItem) {
        pushToEditNotesController(nil)
    }
    
    // MARK: Private helper methods
    
    private func pushToEditNotesController(note: Note?) {
        let storyboard = UIStoryboard(name: Constants.storyboardId, bundle: nil)
        let controller = storyboard.instantiateViewControllerWithIdentifier(Constants.editNoteControllerId) as EditNoteViewController
        controller.editingNote = note
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private func setupRefresh() {
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: "reloadData", forControlEvents: .ValueChanged)
    }
    
    func reloadData() {
        notes = NoteBusinessService.getNotes()
        tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }
    
}
