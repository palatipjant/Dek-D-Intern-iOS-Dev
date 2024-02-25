//
//  NovelsListViewModel.swift
//  Dek-D-Intern
//
//  Created by Palatip Jantawong on 21/2/2567 BE.
//

import SwiftUI

@MainActor final class NovelsListViewModel: ObservableObject {
    
    @Published var novels: [NovelList] = []
    @Published var alertItem: AlertItem?
    
    func getNovel(page: Int) {
        Task {
            do {
                novels.append(contentsOf: try await NetworkManager.shared.fetchUpcomingMovie(page: page))
            } catch {
                alertItem = AlertContext.GeneralError
            }
        }
    }
}
