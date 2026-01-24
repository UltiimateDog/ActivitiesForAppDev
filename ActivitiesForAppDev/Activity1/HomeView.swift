//
//  HomeView.swift
//  ActivitiesForAppDev
//
//  Created by Ultiimate Dog on 23/01/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Spacer()
                
                Text("My App")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    .shadow(radius: 3, y: 3)
                
                NavigationLink("Register") {
                    LoadingViewWrapper {
                        RegisterView()
                    }
                }
                .buttonStyle(.glassProminent)
                
                Spacer()
                
                NavigationLink("Gallery") {
                    LoadingViewWrapper {
                        GalleryView()
                    }
                }
                .buttonStyle(.glassProminent)
                
                NavigationLink("App Info") {
                    LoadingViewWrapper {
                        InfoView()
                    }
                }
                .buttonStyle(.glassProminent)
            }
            .padding()
        }
    }
}

struct LoadingViewWrapper<Content: View>: View {
    @State private var isLoading = true
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        ZStack {
            content
                .opacity(isLoading ? 0 : 1)

            if isLoading {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()

                ProgressView("Loading...")
                    .progressViewStyle(.circular)
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                    isLoading = false
                }
            }
        }
    }
}


#Preview {
    HomeView()
}
