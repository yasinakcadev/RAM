//
//  CharacterListViewModel.swift
//  RAM
//
//  Created by Yasin AKÇA (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 19.10.2025.
//

import Foundation

final class CharacterListViewModel {
    
    var characterCollectionViewCellViewModel: [CharacterCollectionViewCellViewModel] = []
    
    func getAllCharacters() async throws {
        let url = "https://rickandmortyapi.com/api/character"
        do {
           let response = try await NetworkManager.shared.apiCall(url, expecting: CharactersResponse.self)
            characterCollectionViewCellViewModel = response.results?.compactMap { character in
                CharacterCollectionViewCellViewModel(
                    imageName: character.image,
                    name: character.name,
                    status: character.status
                )
            } ?? []
        } catch {
            throw error
        }
    }
}
