//
//  APODListView.swift
//  Planetarium
//
//  Created by Mikael Holm on 3.11.2021.
//

import SwiftUI

struct APODListView: View {
    @EnvironmentObject var apodListViewModel: APODListViewModel
    
    var body: some View {
        NavigationView {
            List (apodListViewModel.pictureInfos) { pictureInfo in
                NavigationLink(destination: APODItemView(pictureInfo: pictureInfo).navigationTitle("Picture \(pictureInfo.date)")) {
                    APODListItemView(pictureInfo: pictureInfo)
                }
            }
            .navigationTitle("Astronomical Pictures")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct APODListView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        APODListView()
            .environmentObject(APODListViewModel())
    }
}