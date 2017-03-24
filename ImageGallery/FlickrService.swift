//
//  FlickrService.swift
//  ImageGallery
//
//  Created by Fabien Brun on 24/03/2017.
//  Copyright © 2017 fabienbrun. All rights reserved.
//
//  Ce service permet de récupérer des photos en utilisant l'API Flikr
//  Attention l'api_key est temporaire
//

/* ----------------------------------------- */
/* ==           Flikr Api Sources            */
/* ----------------------------------------- */

/*     https://www.flickr.com/services/api/explore/flickr.photos.search    */

/*     https://www.flickr.com/services/api/misc.urls.html                  */



import Foundation


class FlickrService {
    static let sharedInstance: FlickrService = {
        
        /* -----------    URL Flickr     ------------ */
        let helloURL = URL(string: "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=3a8ae2ce4481865b5e7de17a2fbce311&tags=sport&format=json&nojsoncallback=1&api_sig=8fac08b8e7be735a09f96c95f365b88f")!
        /* ----------------------------------------- */

        
        let instance = FlickrService()
        
        // setup code
        print("Hello FlickrService !!! ")
        
        let session = URLSession.shared
        
       
        
        let task = session.dataTask(with: helloURL){
            (data, response, error) in
            guard error == nil else {
                print(error!)
                return
            }
            print(data!)
            print(String(data: data!, encoding: String.Encoding.utf8)!)
        }
        
        task.resume()
        
        
    
        
        return instance
    }()
    
}
