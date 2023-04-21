//
//  ViewController.swift
//  StormViewer
//
//  Created by Ozgun Dogus on 16.04.2023.
//

import UIKit

class HomeViewController: UITableViewController {
   
    var pictures = [String]()
    var selectedImages = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        view.backgroundColor = .red
      
        navigationItem.title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        let fm = FileManager.default
        
       
        let path = Bundle.main.bundlePath
        print("Path: \(path)")
        
        if FileManager.default.isReadableFile(atPath: path) {
            // klasöre erişim izni var
        } else {
           
        }

        let contentsPath = Bundle.main.bundlePath + "/content"
        print("Contents path: \(contentsPath)")
     

        do {
            let items = try fm.contentsOfDirectory(atPath: contentsPath)
            print("Items: \(items)")
        } catch {
            print("Error: \(error)")
        }
        
        do {
                let items = try fm.contentsOfDirectory(atPath: path)
                
                for item in items {
                    if item.hasPrefix("nssl"){
                        pictures.append(item)
                    }
                }
                print(pictures)
            } catch {
                print("Error: \(error)")
            }
        print(pictures)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Picture")
        tableView.reloadData()
        print(pictures,  "resimler")
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.selectedImages = pictures[indexPath.row]
//        selectedImages.append(pictures[indexPath.section])
//        detailVC.totalPictures = pictures.count
//        detailVC.pictureNumber = indexPath.section + 1
        navigationController?.pushViewController(detailVC, animated: true)
    }  }


