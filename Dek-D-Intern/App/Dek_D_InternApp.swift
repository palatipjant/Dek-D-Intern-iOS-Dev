//
//  Dek_D_InternApp.swift
//  Dek-D-Intern
//
//  Created by Palatip Jantawong on 21/2/2567 BE.
//

import SwiftUI

@main
struct Dek_D_InternApp: App     {
    
    @StateObject var viewModel = NovelsListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NovelsListView()
                .environmentObject(viewModel)
        }
    }
}
