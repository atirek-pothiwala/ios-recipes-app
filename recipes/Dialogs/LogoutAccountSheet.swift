//
//  SheetDialogExample.swift
//  recipes
//
//  Created by Atirek Pothiwala on 07/04/25.
//

import SwiftUI

struct LogoutAccountSheet: View {
    
    let onDismiss: (_ isLoggedOut: Bool) -> Void
    @State private var swipe: SwipeActionView.SwipeAction = .none

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
                    
            titleView
                        
            Spacer()
            
            btnLogout
            
            Text("We'll be here when you get back.")
                .frame(maxWidth: .infinity, alignment: .center)
                .font(.system(size: 14, weight: .regular))
                .foregroundStyle(Color.gray)
                .multilineTextAlignment(.center)
                .padding(.top, 10)
        }
        .safeAreaPadding(.all, 24)
        .presentationDetents([.medium, .large])
        .presentationDragIndicator(.visible)
    }
    
    var titleView: some View {
        VStack(alignment: .leading, spacing: 0) {
            Image(systemName: "power.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 75, height: 75)
                .foregroundStyle(Color.accent)
                .padding(.bottom, 15)
            
            Text("Logging out? See you soon!")
                .font(.system(size: 24, weight: .semibold))
                .foregroundStyle(Color.accent)
                .padding(.bottom, 5)
            
            Text("You will need to log in again to access your data.")
                .font(.system(size: 16, weight: .regular))
                .foregroundStyle(Color.accent.opacity(0.5))
                .multilineTextAlignment(.center)
                .padding(.bottom, 15)
        }
    }
        
    var btnLogout: some View {
        SwipeActionView(
            swipe: $swipe,
            thumbTint: Color.accentColor,
            backgroundColor: Color.accent,
            defaultText: "Swipe to Logout",
            progressText: "Processing",
            completeText: "Logged Out") { action in
                if action == .progress {
                    swipe = .completed
                } else if action == .completed {
                    onDismiss(true)
                }
            }
    }
}


#Preview {
    LogoutAccountSheet { isLoggedOut in
        
    }
}
