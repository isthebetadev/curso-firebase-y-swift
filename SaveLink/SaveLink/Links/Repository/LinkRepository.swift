//
//  LinkRepository.swift
//  SaveLink
//
//  Created by Ruben on 4/6/24.
//

import Foundation

final class LinkRepository {
    
    private let linkDataSource: LinkDataSource
    
    init(linkDataSource: LinkDataSource = LinkDataSource()) {
        self.linkDataSource = linkDataSource
    }
    
    func getAllLinks(completionBlock: @escaping (Result<[LinkModel], Error>) -> Void) {
        linkDataSource.getAllLinks(completionBlock: completionBlock)
    }
    
}
