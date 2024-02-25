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
    @Published var banner: [Banner] = []
    
    func getNovel(page: Int) {
        Task {
            do {
                novels.append(contentsOf: try await NetworkManager.shared.fetchNovel(page: page))
            } catch {
                alertItem = AlertContext.GeneralError
            }
        }
    }
    
    func getBanner() {
        Task {
            do {
                banner = try await NetworkManager.shared.fetchBanner()
            } catch {
                print(error.localizedDescription)
                alertItem = AlertContext.GeneralError
            }
        }
    }
}
