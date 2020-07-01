//
//  SwiftUIView.swift
//  Moonshot
//
//  Created by Joshua on 7/1/20.
//  Copyright © 2020 Joshua Cook. All rights reserved.
//

import SwiftUI


struct Address: Codable {
    var street: String
    var city: String
}

struct User: Codable {
    var name: String
    var address: Address
}

struct HierarchicalCodable: View {
    var body: some View {
        Button("Decode JSON") {
            let input = """
            {
                "name": "Taylor Swift",
                "address": {
                    "street": 555, Taylor Swift Ave.,
                    "city": "Nashville"
                }
            }
            """
            let data = Data(input.utf8)
            let decoder = JSONDecoder()
            
            if let user = try? decoder.decode(User.self, from: data) {
                print(user.address.street)
            }
        }
    }
}

struct HierarchicalCodable_Previews: PreviewProvider {
    static var previews: some View {
        HierarchicalCodable()
    }
}
