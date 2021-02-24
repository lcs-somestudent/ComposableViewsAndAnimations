//
//  ExerciseTwoView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-23.
//

import SwiftUI
import UIKit

struct ExerciseTwoView: View {
    
    // MARK: Stored properties
    
    // Controls whether this view is showing or not
    @Binding var showThisView: Bool
    
    // Controls what typeface the text is shown in
    @State private var typeFace: String = "Helvetica-Neue"
    
    // Controls the size of the text
    @State private var scaleFactor: CGFloat = 1.0
    
    // Controls whether the text is red or not
    @State private var isRed = false
    
    // Controls whether the text is lower down or not
    @State private var isLower = false

    // MARK: Computed properties

    // List all fonts available
    // NOTE: This is a very useful gist...
    //       https://gist.github.com/kristopherjohnson/c825cb97b1ad1fe0bc13d709986d0763
    private static let fontNames: [String] = {
        var names: [String] = []
        for familyName in UIFont.familyNames {
            names.append(contentsOf: UIFont.fontNames(forFamilyName: familyName))
        }
        return names.sorted()
    }()

    var body: some View {
        
        NavigationView {
            
            VStack {
                
                // Colour is not animatable for text
                Text(typeFace)
                    .font(.custom(typeFace, size: 30.0))
                    .foregroundColor(isRed ? .red : .blue)
                    .offset(x: 0, y: isLower ? -50.0 : 0)
                    .scaleEffect(scaleFactor)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 2.5)) {
                            isRed.toggle()
                        }
                        isLower.toggle()
                        if scaleFactor == 1.0 {
                            scaleFactor = 1.25
                        } else {
                            scaleFactor = 1.0
                        }
                    }

                // Colour is animated for a shape
                Circle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(isRed ? .red : .blue)
                    .offset(x: 0, y: isLower ? -50.0 : 0)
                    .scaleEffect(scaleFactor)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 2.5)) {
                            isRed.toggle()
                        }
                        isLower.toggle()
                        if scaleFactor == 1.0 {
                            scaleFactor = 1.25
                        } else {
                            scaleFactor = 1.0
                        }
                    }

            }
            .navigationTitle("Exercise 2")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Done") {
                        hideView()
                    }
                }
            }

        }
        
    }
    
    // MARK: Functions
    
    // Makes this view go away
    func hideView() {
        showThisView = false
    }
    
}

struct ExerciseTwoView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseTwoView(showThisView: .constant(true))
    }
}
