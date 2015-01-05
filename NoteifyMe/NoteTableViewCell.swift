//
//  NoteTableViewCell.swift
//  NoteifyMe
//
//  Created by Justin Baumgartner  on 1/4/15.
//  Copyright (c) 2015 Justin Baumgartner. All rights reserved.
//

import UIKit

class NoteTableViewCell: UITableViewCell {

    // MARK: Outlets
    
    @IBOutlet weak var categoryIndicator: UIView!
    @IBOutlet weak var noteTitle: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    // MARK: Initialization
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func styleCellWith
    
    // MARK: Class functions
    
    class func nibForClass() -> UINib {
        return UINib(nibName: NSStringFromClass(self), bundle: nil)
    }
    
}
