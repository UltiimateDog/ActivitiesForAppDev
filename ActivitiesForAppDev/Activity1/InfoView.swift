//
//  InfoView.swift
//  ActivitiesForAppDev
//
//  Created by Ultiimate Dog on 23/01/26.
//

import SwiftUI

struct InfoView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            
            Image(systemName: "swift")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.orange)
            
            Text("This app was made using SwiftUI.")
                .multilineTextAlignment(.center)
                .padding()
            
            Button("Go back") {
                dismiss()
            }
            .padding()
            .foregroundColor(.white)
            .cornerRadius(10)
            .buttonStyle(.glassProminent)
        }
        .padding()
    }
}


#Preview {
    InfoView()
}
