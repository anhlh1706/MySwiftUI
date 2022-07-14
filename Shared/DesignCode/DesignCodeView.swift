//
//  DesignCodeView.swift
//  MySwiftUI (iOS)
//
//  Created by Bym on 14/07/2022.
//

import SwiftUI

struct DesignCodeView: View {
    var body: some View {
        Form {
            Section {
                NavigationLink("SideBar", destination: SideBarView())
                
                NavigationLink("Text", destination: ContentViewText())
                
                NavigationLink("ShadowView", destination: ShadowView())
                
                NavigationLink("MaskView", destination: MaskView())
                
                NavigationLink("TabView", destination: TabViewView())
            }
            
            Section {
                NavigationLink("LongPressGestureView", destination: LongPressGestureView())
                
                NavigationLink("DragGestureView", destination: DragGestureView())
            }
            
            Section {
                NavigationLink("TransitionView", destination: TransitionView())
                
                NavigationLink("AnimationView", destination: DesignCodeAnimationView())
                
                NavigationLink("Rotation3DView", destination: Rotation3DView())
                
                NavigationLink("MatchedGeometryEffectView", destination: MatchedGeometryEffectView())
                
                NavigationLink("AdvancedMatchedGeometryEffectView", destination: AdvancedMatchedGeometryEffectView())
                
                NavigationLink("BackgroundBlurView", destination: BackgroundBlurView())
                
                NavigationLink("LazyGridLayoutView", destination: LazyGridLayoutView())
                
                NavigationLink("LazyStackView", destination: LazyStackView())
                
                NavigationLink("Gradient preview", destination: GradientPreviewView())
            }
            
            Section {
                NavigationLink("BindingView", destination: BindingView())
                
                NavigationLink("ModalView", destination: ModalView())
                
                NavigationLink("BindingView", destination: BindingView())
                
                NavigationLink("BindingView", destination: BindingView())
                
                NavigationLink("BindingView", destination: BindingView())
                
                
            }
            
            Section {
                Link(destination: URL(string: "https://github.com/anhlh1706/MySwiftUI")!) {
                    Text("Source code")
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}
