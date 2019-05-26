//
//  MediaTableViewCell.swift
//  GeniusPlazaFeedSwift
//
//  Created by Pias khan on 5/26/19.
//  Copyright © 2019 Pias khan. All rights reserved.
//

import UIKit

class MediaTableViewCell: UITableViewCell {
    var mediaImageView: UIImageView?
    var mediaNameLabel: UILabel?
    var mediaTypeLabel: UILabel?


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addViews()
    }
    
    func addViews(){
        let width = UIScreen.main.bounds.width
        self.mediaImageView = UIImageView(frame: CGRect(x: 20, y: 20, width: 200, height: 200))
        self.mediaNameLabel = UILabel(frame: CGRect(x: 230, y: 20, width: width, height: 160))
        self.mediaTypeLabel = UILabel(frame: CGRect(x: 230, y: 20, width: width, height: 30))
        
        self.addSubview(self.mediaImageView!)
        self.addSubview(self.mediaNameLabel!)
        self.addSubview(self.mediaTypeLabel!)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
