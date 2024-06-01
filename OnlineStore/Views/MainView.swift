//
//  MainView.swift
//  OnlineStore
//
//  Created by Ali Hodroj on 31/05/2024.
//

import SwiftUI

struct MainView: View {
    
    // view properties
    @State private var selectedTab: TabBarItems = .Home
    
    var body: some View {
        // main container
        ZStack {
            // background color
            Color.background
                .ignoresSafeArea()
            // main sub view
            VStack(alignment: .center, spacing: 0) {
                Spacer()
                TabBar
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
    // subviews
    
    private var TabBar: some View {
        HStack(alignment: .center, spacing: 0) {
            ForEach(TabBarItems.allCases, id:\.self) { tab in
                VStack(alignment: .center, spacing: 0) {
                    Image(tab.rawValue.lowercased() + (tab == selectedTab ? "_selected" : "_unselected"))
                        .resizable()
                        .frame(width: tab == selectedTab ?  28 : 20,
                               height: tab == selectedTab ?  28 : 20)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
                .onTapGesture {
                    withAnimation {
                        selectedTab = tab
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color.white.shadow(.drop(radius: 10)), in: .rect(cornerRadius: 60))
        .padding(.horizontal)
        .padding(.bottom, 10)
    }
}

#Preview {
    MainView()
}
