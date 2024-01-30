//
//  Journi.swift
//  Journi
//
//  Created by Huy Ong on 1/28/24.
//

import UIKit
import SwiftData
import CoreLocation

@Model
final class Journi {
    var id: UUID
    var createdDate: Date
    var content: String
    
    init(id: UUID = .init(), createdDate: Date, content: String) {
        self.id = id
        self.createdDate = createdDate
        self.content = content
    }
}
