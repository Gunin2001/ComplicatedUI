//
//  ViewController.swift
//  Form
//
//  Created by Gunin Gupta on 25/04/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var formCV: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        formCV.register(UINib(nibName: "CustomCell", bundle: nil), forCellWithReuseIdentifier: "CustomCell")
        formCV.delegate = self
        formCV.dataSource = self
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FormData.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let data = FormData.allCases[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        cell.isUserInteractionEnabled = data.type != -1
        cell.headingLbl.text = data.title
        cell.tfInput.isHidden = data.type != 0
        cell.tfInput.tag = data.id
        cell.tfInput.placeholder = data.title
        cell.cellBtn.isHidden = data.type == 0 || data.type == 3
        cell.cellBtn.setTitle(!(data.type == 0 || data.type == 3) ? data.title : "", for: .normal)
        cell.cellBtn.tag = data.id
        cell.cellBtn.addTarget(self, action: #selector(onClickCellAction(_:)), for: .touchUpInside)
        cell.tvForDescription.isHidden = data.type == 3 ? false : true
        cell.tvForDescription.tag = data.id
        cell.tvForDescription.delegate = self
        cell.tvForDescription.placeholder = data.title
        cell.imgValueType.image = data.image
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let data = FormData.allCases[indexPath.row]
        let width = (collectionView.frame.width)
        if data.doubleLine == 0 {
            return CGSize(width: width, height: data.height)
        } else {
            return CGSize(width: (width / 2), height: data.height)
        }
    }
}

extension ViewController : UITextViewDelegate{
    func textViewDidChange(_ textView: UITextView) {
        switch textView.tag{
        case 7:
            print(textView.text ?? "")
        case 8:
            print(textView.text ?? "")
        default:
            break
        }
    }
    
    @objc func onClickCellAction(_ sender: UIButton){
        switch sender.tag{
        case 1:
             print("Current Date with")
        case 3:
            print("from time picker")
        case 5:
            print("to time picker")
        case 2:
            print("Non editable touched")
        default:
            break
        }
    }
}

enum FormData : CaseIterable{
    case currentDate, fromDateTime, fromDropdown, toDateTime, toDropdown, totalHours, trainingName, trainingDesc
    
    var title : String{
        switch self{
            
        case .currentDate:
            return "Current Date"
        case .fromDateTime:
            return "From Date & Time"
        case .toDateTime:
            return "To Date & Time"
        case .totalHours:
            return "Total Self Learning Hours"
        case .trainingName:
            return "Training Name"
        case .trainingDesc:
            return "Key Learnings"
        case .fromDropdown:
            return ""
        case .toDropdown:
            return ""
        }
    }
    var doubleLine : Int
    {
        switch self{
            
        case .currentDate:
            return 0
        case .fromDateTime:
            return 1
        case .fromDropdown:
            return 1
        case .toDateTime:
            return 1
        case .toDropdown:
            return 1
        case .totalHours:
            return 0
        case .trainingName:
            return 0
        case .trainingDesc:
            return 0
        }
    }
    var isMandatory : Bool
    {
        switch self{
            
        case .currentDate:
            return true
        case .fromDateTime:
            return true
        case .toDateTime:
            return true
        case .totalHours:
            return false
        case .trainingName:
            return false
        case .trainingDesc:
            return false
        case .fromDropdown:
            return false
        case .toDropdown:
            return false
        }
    }
    
    var type : Int{
        // 0 - textfield, 1 - Date Picker, 2- Time Picker, 3- remarks textField, -1 par not editable
        switch self{
            
        case .currentDate:
            return 1
        case .fromDateTime:
            return -1
        case .fromDropdown:
            return 2
        case .toDateTime:
            return -1
        case .toDropdown:
            return 2
        case .totalHours:
            return -1
        case .trainingName:
            return 3
        case .trainingDesc:
            return 3
        }
    }
    var height: Double{
        switch self{
            
        case .currentDate:
            return 95.0
        case .fromDateTime:
            return 95.0
        case .fromDropdown:
            return 95.0
        case .toDateTime:
            return 95.0
        case .toDropdown:
            return 95.00
        case .totalHours:
            return 95.00
        case .trainingName:
            return 95.00
        case .trainingDesc:
            return 140.0
        }
    }
    var image: UIImage?{
        switch self{
            
        case .currentDate:
            return UIImage(systemName: "chevron.down")
        case .fromDateTime:
            return UIImage(systemName: "clock")
        case .fromDropdown:
            return nil
        case .toDateTime:
            return UIImage(systemName: "clock")
        case .toDropdown:
            return nil
        case .totalHours:
            return nil
        case .trainingName:
            return nil
        case .trainingDesc:
            return nil
        }
    }
    
    var id: Int{
        switch self{
            
        case .currentDate:
            return 1
        case .fromDateTime:
            return 2
        case .fromDropdown:
            return 3
        case .toDateTime:
            return 4
        case .toDropdown:
            return 5
        case .totalHours:
            return 6
        case .trainingName:
            return 7
        case .trainingDesc:
            return 8
        }
    }
}

