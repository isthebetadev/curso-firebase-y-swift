//
//  LinkDataSource.swift
//  SaveLink
//
//  Created by Ruben on 4/6/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct LinkModel: Decodable, Encodable, Identifiable {
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
    
    func createNew(with link: LinkModel, completionBlock: @escaping (Result<LinkModel, Error>) -> Void) {
        do {
            _ = try database.collection(collection).addDocument(from: link)
            completionBlock(.success(link))
        } catch {
            completionBlock(.failure(error))
        }
    }
    
    func updateLink(link: LinkModel) {
        guard let documentId = link.id else {
            return
        }
        do {
            _ = try database.collection(collection).document(documentId).setData(from: link)
        } catch {
            print("❌ Error updating link")
        }
    }
    
    func deleteLink(link: LinkModel) {
        guard let documentId = link.id else {
            return
        }
        database.collection(collection).document(documentId).delete()
    }
    
}
