//
//  CustomCell.swift
//  Form
//
//  Created by Gunin Gupta on 25/04/24.
//

import UIKit
import IQKeyboardManagerSwift

protocol CustomCellProtocol: AnyObject{
    func didTapCellButton(tag: Int)
}

class CustomCell: UICollectionViewCell {
    
    @IBOutlet weak var headingLbl: UILabel!
    @IBOutlet weak var tfInput: UITextField!
    @IBOutlet weak var imgValueType: UIImageView!
    @IBOutlet weak var cellBtn: UIButton!
    @IBOutlet weak var tvForDescription: IQTextView!
    @IBOutlet weak var borderView: UIView!
    
    weak var delegate: CustomCellProtocol?
    var currID: Int?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        tvForDescription.layer.borderColor = UIColor.black.cgColor
        borderView.layer.borderWidth = 1
        borderView.layer.borderColor = UIColor.black.cgColor
    }
    
    @IBAction func didTapCellButton(_ sender: UIButton) {
        delegate?.didTapCellButton(tag: currID ?? 2)
    }
    
    func loadData(data: FormData){
        self.currID = data.id
        self.isUserInteractionEnabled = data.type != -1
        self.headingLbl.text = data.title
        self.tfInput.text = data.userEnteredValue
        self.tfInput.isHidden = data.type != 0
        self.tfInput.tag = data.id
        self.tfInput.placeholder = data.title
        self.cellBtn.isHidden = data.type == 0 || data.type == 3
        self.cellBtn.setTitle(!(data.type == 0 || data.type == 3) ? data.title : "", for: .normal)
        self.cellBtn.tag = data.id
        self.tvForDescription.isHidden = data.type == 3 ? false : true
        self.tvForDescription.tag = data.id
        self.tvForDescription.text = data.userEnteredValue
        self.tvForDescription.placeholder = data.title
        self.imgValueType.image = data.image
    }

}
