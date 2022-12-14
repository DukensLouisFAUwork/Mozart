//
//  PlaylistTableViewCell.swift
//  Mozart
//
//  Created by dukens on 12/14/22.
//

import UIKit

class PlaylistTableViewCell: UITableViewCell {

    
    @IBOutlet weak var playtitle: UILabel!
    @IBOutlet weak var playimage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
