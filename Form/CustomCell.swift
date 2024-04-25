//
//  CustomCell.swift
//  Form
//
//  Created by Gunin Gupta on 25/04/24.
//

import UIKit
import IQKeyboardManagerSwift

class CustomCell: UICollectionViewCell {
    
    @IBOutlet weak var headingLbl: UILabel!
    @IBOutlet weak var tfInput: UITextField!
    @IBOutlet weak var imgValueType: UIImageView!
    @IBOutlet weak var cellBtn: UIButton!
    @IBOutlet weak var tvForDescription: IQTextView!
    @IBOutlet weak var borderView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        tvForDescription.layer.borderColor = UIColor.black.cgColor
        borderView.layer.borderWidth = 1
        borderView.layer.borderColor = UIColor.black.cgColor
    }

}
