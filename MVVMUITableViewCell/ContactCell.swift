//
//  ContactCell.swift
//  MVVMUITableViewCell
//
//  Created by Eric Giannini on 4/7/17.
//  Copyright © 2017 Unicorn Mobile, LLC. All rights reserved.
//

import UIKit

class ContactCell: UITableViewCell {
    
    /* lazy instantiation avoids layoutSubviews in view life cycle dance */
    
    lazy public var nameLabel: UILabel = {
        
        self.nameLabel = UILabel(frame: CGRect.init(x: 10, y: 10, width: self.bounds.size.width, height: 40))
        self.nameLabel.textColor = UIColor.black
        
        return self.nameLabel
    }()
    
    lazy public var numberLabel: UILabel = {
        
        self.numberLabel = UILabel(frame: CGRect.init(x: 10, y: 90, width: self.bounds.size.width, height: 20))
        
        self.numberLabel.textColor = UIColor.black
        
        return self.numberLabel
    }()
    
    lazy public var informationLabel: UILabel = {
        
        self.informationLabel = UILabel(frame: CGRect.init(x: self.bounds.size.width - 100, y: 40, width: self.bounds.size.width, height: 20))
        
        self.informationLabel.textColor = UIColor.black
        
        return self.informationLabel
    }()
    
    var contact: Contact? {
        didSet {
            nameLabel.text = contact?.name
            numberLabel.text = contact?.number
            informationLabel.text = contact?.information
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //        contentView.frame
        [nameLabel, numberLabel, informationLabel].forEach(contentView.addSubview)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("The method init(coder:) has not been implemented")
    }
    
    
}
