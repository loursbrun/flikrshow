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
/*                                                                         */
/*     https://www.flickr.com/services/api/misc.urls.html                  */



import Foundation


class FlickrService {
    static let sharedInstance: FlickrService = {
        
        
        let instance = FlickrService()
        
        
        
        let session = URLSession.shared
        
        
        
        let usersGetURL = URL(string: "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=3a8ae2ce4481865b5e7de17a2fbce311&tags=sport&format=json&nojsoncallback=1&api_sig=8fac08b8e7be735a09f96c95f365b88f")!
        
        var requestUsers = URLRequest(url: usersGetURL)
        requestUsers.httpMethod = "GET"
        
        
        let getUsersTask = session.dataTask(with: usersGetURL){
            (data, response, error) in
            guard error == nil else {
                print(error!)
                return
            }
            guard let data = data else {
                print("missing data")
                return
            }
            
            let json = try? JSONSerialization.jsonObject(with: data, options: [])
            
            if let photos = json {
                print(photos)
            }
            
            
            
            
            
            
            //print(data!)
            //print(String(data: data, encoding: String.Encoding.utf8)!)
        }
        
        getUsersTask.resume()
        
    
        
        return instance
    }()
    
}
