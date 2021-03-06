//
//  APODListViewModel.swift
//  Planetarium
//
//  Created by Mikael Holm on 4.11.2021.
//
import Foundation
import SwiftUI

class APODListViewModel: ObservableObject {
    @Published var pictureInfos: [PictureInfo] = [PictureInfo]()
    private let apodRequest = APODRequest()
    private let favoriteRepository = FavoriteRepository()
    
    init() {
        apodRequest.getPictureInfos(startDate: Date(timeIntervalSinceNow: -60 * 60 * 24 * 30), endDate: Date()) { (result) in
            switch result {
            case .success(let infos):
                DispatchQueue.main.async {
                    self.pictureInfos = infos
                }
                print("Successfully loaded pictures.")
            case .failure(let error):
                print("There was an error loading pictures: \(error)")
            }
        }
    }
    
    func isInFavorites(_ date: String) -> Bool {
        return favoriteRepository.favoriteExists(date: date)
    }
}
