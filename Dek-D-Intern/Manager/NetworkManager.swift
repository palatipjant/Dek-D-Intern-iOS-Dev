//
//  NetworkManager.swift
//  Dek-D-Intern
//
//  Created by Palatip Jantawong on 21/2/2567 BE.
//

import Foundation
import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    let authToken = "DrVDKp2ancYmyW2b3wRVU6yssBcjiyJ4"
    
    private init() {}
    
    func fetchUpcomingMovie(page: Int) async throws -> [NovelList] {
        
        guard let url = URL(string: "https://www.dek-d.com/api/rest/open/quiz/novel/list?page=\(page)") else {
            throw APError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.addValue("\(authToken)", forHTTPHeaderField: "SECRET")
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decoder = JSONDecoder()
//            if let rawDataString = String(data: data, encoding: .utf8) {
//                        print("Raw Data:\n\(rawDataString)")
//                    } else {
//                        print("Raw data could not be converted to a UTF-8 string")
//                    }

            let novel = try decoder.decode(NovelResponse.self, from: data)
            return novel.list
        } catch {
            print(error.localizedDescription)
            throw APError.invalidData
        }
    }
    
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            guard let data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
            
        }
        task.resume()
    }
}
