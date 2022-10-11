//
//  NetworkManager.swift
//  GetComments
//
//  Created by Karpinets Alexander on 05.10.2022.
//
import Alamofire
import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    
    func getComments( _ complition: @escaping([Comments])-> Void) {
        
        AF.request("https://jsonplaceholder.typicode.com/comments", method: .get)
            .responseDecodable(of: [Comments].self) { dataResponse in
                switch dataResponse.result {
                case .success(let comments):
                    DispatchQueue.main.async {
                        complition(comments)
                    }
                case .failure(let error):
                    print(error)
                }
            }
        
        
//        guard let url = URL(string: "https://jsonplaceholder.typicode.com/comments") else { return }
//        URLSession.shared.dataTask(with: url) { data, _, error in
//            guard let data = data else {
//                print(error?.localizedDescription ?? "No error")
//                return
//            }
//
//            do {
//                let comments = try JSONDecoder().decode([Comments].self, from: data)
//                DispatchQueue.main.async {
//                   complition(comments)
//                }
//            } catch let error {
//                print(error.localizedDescription)
//            }
//        }.resume()
    }
}
