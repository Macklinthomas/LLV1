//
//  VideoTableViewCell.swift
//  LLV1
//
//  Created by Macklin Thomas on 5/27/20.
//  Copyright © 2020 Macklin Thomas. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell
{
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var playThumbnailImageView: UIImageView!
    
    var video: Video!{
        didSet{
            updateUI()
        }
    }
    
    func updateUI(){
        thumbnailImageView.image = UIImage(named: video.thumbnailFileName)
        thumbnailImageView.layer.cornerRadius = 8.0
        thumbnailImageView.layer.masksToBounds = true
        usernameLabel.text = video.authorName
        playThumbnailImageView.image = UIImage(named: "playbutton")
    }
}
