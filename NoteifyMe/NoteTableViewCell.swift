//
//  NoteTableViewCell.swift
//  NoteifyMe
//
//  Created by Justin Baumgartner  on 1/4/15.
//  Copyright (c) 2015 Justin Baumgartner. All rights reserved.
//

import UIKit
import NoteifyMeCommons

class NoteTableViewCell: UITableViewCell {

    // MARK: Outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var colorIndicator: UIView!
    
    // MARK: Initialization
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func styleCellWithNote(note: Note) {
        self.titleLabel.text = note.title
        self.colorIndicator.backgroundColor = note.color.colorRef
    }
    
    // MARK: Class functions
    
    class func nibForClass() -> UINib {
        return UINib(nibName: NSStringFromClass(self), bundle: nil)
    }
    
}
