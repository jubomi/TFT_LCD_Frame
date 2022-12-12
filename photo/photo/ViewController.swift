//
//  ViewController.swift
//  photo
//
//  Created by 주보미 on 2022/11/27.
//

import UIKit
import Kingfisher

class ViewController: UIViewController {
    let defaultColor = UIColor.yellow
    var currentColor: UIColor?

    @IBOutlet weak var frameView: UIView!
    @IBOutlet weak var frameSwitch: UISwitch!
    @IBOutlet weak var selectPhoto: UIImageView!
    
    @IBAction func showColorPicker(_ sender: Any) {
        let colorPickerVC = UIColorPickerViewController()
        colorPickerVC.delegate = self
        present(colorPickerVC, animated: true)
    }
    
    @IBAction func loadPhotoAction(_ sender: Any) {
        if let photoURL = URL(string: "http://image.dongascience.com/Photo/2020/03/5bddba7b6574b95d37b6079c199d7101.jpg") {
            selectPhoto.kf.setImage(with: photoURL)
        }
        else {
            let alert = UIAlertController(title: "실패", message: "사진을 찾을 수 없습니다", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "확인", style: .destructive)
                            alert.addAction(okButton)
                            present(alert, animated: false, completion: nil)
        }
    }
    
    @IBAction func changeFrameStatus(_ sender: Any) {
        setFrameColor()
        frameSwitch.setOn(frameSwitch.isOn, animated: true)
    }
    
    func setFrameColor() {
        if frameSwitch.isOn {
            frameView.backgroundColor = currentColor
        }
        else {
            frameView.backgroundColor = defaultColor
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        currentColor = defaultColor
    }


}

// MARK: - Color Picker 관련된 부분
extension ViewController : UIColorPickerViewControllerDelegate {

        // colorPicker에서 선택된 색상 정보를 가져와 액자 배경색상에 입힌다.
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        currentColor = viewController.selectedColor
        setFrameColor()
    }

}
