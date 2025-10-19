//
//  CharacterModel.swift
//  RAM
//
//  Created by Yasin AKÇA (Mobil Uygulamalar Uygulama Geliştirme Müdürlüğü) on 19.10.2025.
//
import Foundation

struct CharactersResponse: Codable {
    let info: Info?
    let results: [CharactersResult]?
}

struct Info: Codable {
    let count, pages: Int?
    let next: String?
    let prev: String?
}

struct CharactersResult: Codable {
    let id: Int?
    let name, status, species, type: String?
    let gender: String?
    let origin, location: Location?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

struct Location: Codable {
    let name: String?
    let url: String?
}
