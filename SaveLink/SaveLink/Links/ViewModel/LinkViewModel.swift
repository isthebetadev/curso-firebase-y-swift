//
//  LinkViewModel.swift
//  SaveLink
//
//  Created by Ruben on 4/6/24.
//

import Foundation

final class LinkViewModel: ObservableObject {
    
    
    @Published var links: [LinkModel] = []
    @Published var messageError: String?
    
    private let linkRepository: LinkRepository
    
    init(linkRepository: LinkRepository = LinkRepository()) {
        self.linkRepository = linkRepository
    }
    
    func getAllLinks() {
        linkRepository.getAllLinks { [weak self] result in
            switch result {
            case .success(let linkModels):
                self?.links = linkModels
            case .failure(let error):
                self?.messageError = error.localizedDescription
            }
        }
    }
    
    func createNewLink(fromURL url: String) {
        linkRepository.createNewLink(withURL: url, completionBlock: { [weak self] result in
            switch result {
            case .success(let linkModel):
                //self?.links.append(linkModel)
                print("✅ Actualizada lista de links con : \(linkModel.title)")
            case .failure(let error):
                self?.messageError = error.localizedDescription
            }
        })
    }
    
    func updateIsFavorite(link: LinkModel) {
        let updateLink = LinkModel(id: link.id,
                                   url: link.url,
                                   title: link.title,
                                   isFavorite: link.isFavorite ? false : true,
                                   isViewed: link.isViewed)
        linkRepository.update(link: updateLink)
    }
    
    func updateIsViewed(link: LinkModel) {
        let updateLink = LinkModel(id: link.id, 
                                   url: link.url,
                                   title: link.title,
                                   isFavorite: link.isFavorite,
                                   isViewed: link.isViewed ? false : true)
        linkRepository.update(link: updateLink)
    }
    
    func delete(link: LinkModel) {
        linkRepository.delete(link: link)
    }
    
}
