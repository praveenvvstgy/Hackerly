//
//  PostTableViewCell.swift
//  Hackerly
//
//  Created by Gowda I V, Praveen on 12/30/15.
//  Copyright © 2015 Gowda I V, Praveen. All rights reserved.
//

import UIKit
import DOFavoriteButton

class PostTableViewCell: UITableViewCell {
    
    @IBOutlet weak var unreadIndicator: UIView!
    @IBOutlet weak var domain: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var author: UILabel!
    @IBOutlet weak var authorImage: UIImageView!
    @IBOutlet weak var timeImage: UIImageView!
    @IBOutlet weak var scoreCard: DOFavoriteButton!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var favicon: UIImageView!
    var rowId: Int!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
