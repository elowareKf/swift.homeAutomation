//
//  Service.swift
//  Home Automation
//
//  Created by Klaus Fischer on 25.11.20.
//

import Foundation

extension String: Error {
}

protocol CanLoadIos {
    func LoadedIos(items: ItemResult)
}

struct Item: Codable {
    let id: Int
    let name: String
    let value: Int
}

struct ItemResult: Codable {
    let names: [String]
    let values: [Int]
}


class RestServiceBase {
    private var _urlString: String

    var urlString: String {
        get {
            return _urlString
        }
        set {
            if URL(string: newValue) != nil {
                _urlString = newValue
            }
        }
    }

    var url: URL {
        get {
            return URL(string: _urlString)!
        }
    }

    init(url: String = "http://192.168.178.89:3001/api/revpi/") {
        _urlString = url
    }

}

class RestService: RestServiceBase {
    var delegate: CanLoadIos?

    init() {
        super.init()
    }

    init(urlString: String) throws {
        guard URL(string: urlString) != nil else {
            throw "Url invalid \(urlString)"
        }
        super.init(url: urlString)
    }

    func getItems(callback: @escaping (ItemResult) -> Void) {
        print(super.url)
        URLSession(configuration: .default).dataTask(with: super.url, completionHandler: {(data: Data?, response: URLResponse?, error: Error?) in
            if (data != nil) {
                if let result = try? JSONDecoder().decode(ItemResult.self, from: data!) {
                    callback(result)
                }
            }
            
            if (error != nil){
                print(error!)
            }
        }).resume()
    }

    func setItem(id: String, value: Int) {
    }

    func getItem(id: String) -> Int {
        return 0;
    }

    func nameItem(id: String, name: String) {

    }


//    func callRestService(url: URL, data: Data?, callback @escaping ()) throws {
//        URLSession(configuration: .default).dataTask(with: url, completionHandler: {(data, response, error) in
//            if let result = self.responseHandler(data: data, response: response,  error: error)
//            {self.delegate?.LoadedIos(items: result)}
//        }).resume()
//    }
//
//    func responseHandler(data: Data?, response: URLResponse?, error: Error?) -> ItemResult?{
//        if (error != nil){
//            print(error!)
//        }
//        return data
//    }
}


