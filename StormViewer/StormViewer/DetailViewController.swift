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
                imageView.contentMode = .scaleAspectFit
        
        
        view.addSubview(imageView)

        if let imageToLoad = selectedImages {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    


}
