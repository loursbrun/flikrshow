//
//  GalleryCollectionViewController.swift
//  ImageGallery
//
//  Created by Fabien Brun on 23/03/2017.
//  Copyright © 2017 fabienbrun. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ImageCell"

class GalleryCollectionViewController: UICollectionViewController {
    
    
    var imageListe: [ImageListe] = [
        ImageListe(thumb: "thumb1", zoom: "zoom1"),
        ImageListe(thumb: "thumb2", zoom: "zoom2")
    ]
    

    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        if let path = Bundle.main.path(forResource: "ImageListe", ofType: "plist"),
            let data = NSArray(contentsOfFile: path) as? [Dictionary<String,String>]{
            // transformer data en [quotes]
            imageListe = data.map {ImageListe(thumb: $0["thumb"] ?? "unknow", zoom: $0["zoom"] ?? "unknow")}
            
        
            
            
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        
        if(segue.identifier == "image-detail-segue") {
            

            
            
            
             let ImageDetailViewController = (segue.destination as! ImageDetailViewController)
            
            ImageDetailViewController.urlImg = "https://dummyimage.com/100x100/123456/fff&text=lorem"
            
            
            
        }
        
    
        
        
    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return imageListe.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ImageCollectionViewCell
    
        
      
        
        
        // Configure the cell
        print("URL \(indexPath)" )
        print(imageListe[0].thumb)
        let url = URL(string: imageListe[indexPath.row].thumb)
        let data = try? Data(contentsOf: url!)
        cell.imageView.image = UIImage(data: data!)
        
        
        
        
        
        
        
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
