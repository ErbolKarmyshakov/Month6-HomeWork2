//
//  JSONParser.swift
//  Month6-HomeWork2
//
//  Created by Mac User on 10/1/24.
//

import Foundation

struct JSONParser {
    
    let decoder = JSONDecoder()
    
    func getStudent(completion: @escaping ([Student]) -> Void) {
        if let path = Bundle.main.path(forResource: "Student", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let studens = try decoder.decode([Student].self, from: data)
                completion(studens)
            } catch {
                print(error)
            }
        }
    }
}
