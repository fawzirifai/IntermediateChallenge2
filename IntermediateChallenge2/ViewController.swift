//
//  ViewController.swift
//  IntermediateChallenge2
//
//  Created by Fawzi Rifai on 07/08/2022.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet var choosePhotoButton: UIButton!
    @IBOutlet var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func selectPhoto() {
        let alertController = UIAlertController(title: "Choose from...", message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "Camera", style: .default) { _ in
            self.choosePhoto(from: .camera)
        })
        alertController.addAction(UIAlertAction(title: "Photo Library", style: .default) { _ in
            self.choosePhoto(from: .photoLibrary)
        })
        alertController.addAction(UIAlertAction.init(title: "Cancel", style: .cancel))
        self.present(alertController, animated: true)
        
    }
    
    func choosePhoto(from sourceType: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(sourceType) {
            let imagePickerController = UIImagePickerController()
            imagePickerController.sourceType = sourceType
            imagePickerController.delegate = self
            present(imagePickerController, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        guard let image = info[.originalImage] as? UIImage else { return }
        imageView.image = image
        imageView.isHidden = false
        choosePhotoButton.isHidden = true
    }

}

