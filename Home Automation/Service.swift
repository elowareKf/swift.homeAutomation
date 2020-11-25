//
//  Service.swift
//  Home Automation
//
//  Created by Klaus Fischer on 25.11.20.
//

import Foundation

extension String: Error{}

struct Item: Codable{
    let id: Int
    let name: String
    let value: Int
}

struct ItemResult: Codable {
    let names: [String]
    let values: [Int]
}


class RestService{
    let url: URL
    
    init(urlString: String = "http://192.168.178.89:3001/api/revpi/") throws {
        guard let url = URL(string: urlString) else {
            throw "Url invalid \(urlString)"
        }
        self.url = url
    }
    
    func getItems()->ItemResult?{
        guard let result = try? callRestService(url: self.url, data: nil) else {
            return nil
        }
        
        print(String(data: result, encoding: .utf8) ?? "Error decoding to utf8")
        
        if let items = try? JSONDecoder().decode(ItemResult.self, from: result){
            return items
        }
        return nil
    }
    
    func setItem(id: String, value: Int){
    }
    
    func getItem(id: String) -> Int{
        return 0;
    }
    
    func nameItem(id: String, name: String){
        
    }
    
    
    func callRestService(url: URL, data: Data?) throws -> Data? {
        let semaphore = DispatchSemaphore(value: 0)
        var result: Data?
        URLSession(configuration: .default).dataTask(with: url, completionHandler: {(data, response, error) in
            result = self.responseHandler(data: data, response: response,  error: error)
            semaphore.signal()
        }).resume()
        semaphore.wait()
        return result
    }
    
    func responseHandler(data: Data?, response: URLResponse?, error: Error?) -> Data?{
        if (error != nil){
            print(error!)
        }
        return data
    }
}


