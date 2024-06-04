//
//  LinkDataSource.swift
//  SaveLink
//
//  Created by Ruben on 4/6/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct LinkModel: Decodable, Identifiable {
    @DocumentID var id: String?
    let url: String
    let title: String
    let isFavorite: Bool
    let isViewed: Bool 
}
