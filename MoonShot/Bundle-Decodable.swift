//
//  Bundle-Decodable.swift
//  MoonShot
//
//  Created by William on 5/5/23.
//

import Foundation

extension Bundle{
    // Before we had [String: Astronaut] meaning thats what it was returning
    // Now we can place T, meaning we can return any Type not just Astronaut types
    // This is called a Generic
    func decode<T: Codable>(_ file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else{
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else{
            fatalError("Failed to load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        //Decodes dates because they are strings
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(T.self, from: data) else{
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        return loaded
    }
}
