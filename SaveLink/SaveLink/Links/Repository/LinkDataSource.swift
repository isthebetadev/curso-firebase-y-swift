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

final class LinkDataSource {
    
    private let database = Firestore.firestore()
    private let collection = "links"

    func getAllLinks(completionBlock: @escaping (Result<[LinkModel], Error>) -> Void) {
        database.collection(collection)
            .addSnapshotListener { query, error in
                if let error = error {
                    print("Error getting all links \(error.localizedDescription)")
                    completionBlock(.failure(error))
                    return
                }
                guard let documents = query?.documents.compactMap({ $0 }) else {
                    completionBlock(.success([]))
                    return
                }
                let links = documents.map { try? $0.data(as: LinkModel.self) }
                                     .compactMap { $0 }
                completionBlock(.success(links))
            }
                            
    }
    
}
