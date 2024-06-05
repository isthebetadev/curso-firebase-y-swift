//
//  LinkRepository.swift
//  SaveLink
//
//  Created by Ruben on 4/6/24.
//

import Foundation

final class LinkRepository {
    
    private let linkDataSource: LinkDataSource
    private let metadataDatasource: MetadataDatasource
    
    init(linkDataSource: LinkDataSource = LinkDataSource(), metadataDatasource: MetadataDatasource = MetadataDatasource() ) {
        self.linkDataSource = linkDataSource
        self.metadataDatasource = metadataDatasource
    }
    
    func getAllLinks(completionBlock: @escaping (Result<[LinkModel], Error>) -> Void) {
        linkDataSource.getAllLinks(completionBlock: completionBlock)
    }

    func createNewLink(withURL url: String, completionBlock: @escaping (Result<LinkModel, Error>) -> Void) {
        // metadataDatasource.getMetadata(fromURL: url, completionBlock: completionBlock)
        metadataDatasource.getMetadata(fromURL: url) { [weak self] result in
                    switch result {
                    case .success(let linkModel):
                        self?.linkDataSource.createNew(with: linkModel,
                                                       completionBlock: completionBlock)
                    case .failure(let error):
                        completionBlock(.failure(error))
                    }
                }
    }
    
    func update(link: LinkModel) {
        linkDataSource.updateLink(link: link)
    }
        
}
