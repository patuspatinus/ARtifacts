//
//  ListTableViewCell.swift
//  Test3
//
//  Created by Thanh Nguyen Viet on 20/05/2024.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var objectImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var heartButton: UIButton!
    
    var heartFill = false {
        didSet {
            if heartFill {
                heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            } else {
                heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func heartTap(_ sender: UIButton) {
        heartFill.toggle()
    }
    
}
