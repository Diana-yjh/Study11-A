//
//  ViewController.swift
//  CacheExamples
//
//  Created by Jaehun Lee on 4/13/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var firstImageView: UIImageView!
    @IBOutlet var secondImageView: UIImageView!
    
    @IBAction func loadFirstImage(_ sender: UIButton) {
        let url = URL(string: "https://wallpaperaccess.com/download/europe-4k-1369012")!
        
        loadImage(from: url, to: firstImageView)
    }
    
    @IBAction func loadSecondImage(_ sender: UIButton) {
        let url = URL(string: "https://wallpaperaccess.com/download/europe-4k-1318341")!
        
        loadImage(from: url, to: secondImageView)
    }
    
    func loadImage(from url: URL, to imageView: UIImageView) {
        let request = URLRequest(url: url)
        
        if let cachedResponse = URLCache.shared.cachedResponse(for: request) {
            imageView.image = UIImage(data: cachedResponse.data)
        } else {
            URLSession.shared.dataTask(with: url) { data, response, _ in
                if let data, let response,
                   let image = UIImage(data: data) {
                    let cachedResponse = CachedURLResponse(response: response, data: data)
                    URLCache.shared.storeCachedResponse(cachedResponse, for: request)
                    
                    DispatchQueue.main.async {
                        imageView.image = image
                    }
                }
            }.resume()
        }
    }
    
    @IBAction func removeImages() {
        firstImageView.image = nil
        secondImageView.image = nil
    }
    
    @IBAction func removeCache() {
        URLCache.shared.removeAllCachedResponses()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
