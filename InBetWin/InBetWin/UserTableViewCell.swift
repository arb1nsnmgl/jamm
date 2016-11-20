//
//  UserTableViewCell.swift
//  InBetWin
//
//  Created by Michael Young on 11/19/16.
//  Copyright © 2016 com.AppRising.JAMM. All rights reserved.
//

import Foundation
import UIKit

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var opponentCardOneImageView: UIImageView!
    @IBOutlet weak var opponentCardTwoImageView: UIImageView!
    @IBOutlet weak var cellUsernameLabel: UILabel!
    @IBOutlet weak var cellBGView: UIView!
    
    
    func updateCellView() {
                
        cellUsernameLabel.layer.cornerRadius = 2.0
        cellBGView.layer.cornerRadius = 2.0
        
        
        cellBGView.layer.masksToBounds = false
        cellBGView.layer.shadowColor = UIColor.black.cgColor
        cellBGView.layer.shadowOpacity = 1
        cellBGView.layer.shadowRadius = CGFloat(5)
        cellBGView.layer.shadowOffset = CGSize(width: -1, height: 1)
        
    }
}
