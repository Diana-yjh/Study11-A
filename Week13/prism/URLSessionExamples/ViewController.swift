//
//  ViewController.swift
//  URLSessionExamples
//
//  Created by Jaehun Lee on 4/4/24.
//

import UIKit

struct ProductListResponseDTO: Decodable {
    private enum CodingKeys: String, CodingKey {
        case items = "pages"
    }
    
    let items: [ItemDTO]
}

extension ProductListResponseDTO {
    struct ItemDTO: Decodable {
        let id: Int
        let name: String
        let description: String
        let thumbnail: String
    }
}

class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        requestItems()
        requestProductDeleteURI(productID: 2486)
    }
    
    func requestItems() {
        let url = URL(string: "http://openmarket.yagom-academy.kr/api/products?page_no=1&items_for_page=10")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error {
                print(error)
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                return
            }
            
            if let data {
                guard let items = try? JSONDecoder().decode(ProductListResponseDTO.self, from: data) else {
                    return
                }
                print(items)
            }
        }
        task.resume()
    }
    
    func requestProductDeleteURI(productID: Int) {
        let url = URL(string: "http://openmarket.yagom-academy.kr/api/products/\(productID)/archived")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.allHTTPHeaderFields = [
            "identifier": "c5b13912-43b9-11ed-8b9b-0956155ef06a",
            "Content-Type": "application/json"
        ]
        
        var httpBody = Data()
        
        httpBody.append(#"{"secret": "soobak1234"}"#.data(using: .utf8)!)
        urlRequest.httpBody = httpBody
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, _, error in
            if let data {
                print(String(data: data, encoding: .utf8)!)
            } else {
                print(error)
            }
        }
        task.resume()
    }
}
