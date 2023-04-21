//
//  DetailViewController.swift
//  StormViewer
//
//  Created by Ozgun Dogus on 21.04.2023.
//

import UIKit

class DetailViewController: UIViewController {
   
    var selectedImages : String?
      var totalPictures = 0
      var pictureNumber = 0
    
    private var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.frame = view.bounds
        imageView.contentMode = .scaleAspectFill
        
        imageView.clipsToBounds = true
        view.addSubview(imageView)

        if let imageToLoad = selectedImages {
            guard let image = UIImage(named: imageToLoad) else { return }
            let newSize = CGSize(width: 400, height: 880) // Yeni boyutu belirleyin
            let scaledImage = image.scaleImage(toSize: newSize)
            imageView.image = scaledImage
        }
    }
    }
extension UIImage {
    func scaleImage(toSize newSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        self.draw(in: CGRect(origin: CGPoint.zero, size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage ?? UIImage()
    }
}
