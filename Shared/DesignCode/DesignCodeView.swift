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
            // MARK: View only
            Section {
                NavigationLink("SideBar", destination: SideBarView())
                
                NavigationLink("Text", destination: ContentViewText())
                
                NavigationLink("ShadowView", destination: ShadowView())
                
                NavigationLink("MaskView", destination: MaskView())
                
                NavigationLink("TabView", destination: TabViewView())
                
                NavigationLink("BackgroundBlurView", destination: BackgroundBlurView())
                
                NavigationLink("LazyGridLayoutView", destination: LazyGridLayoutView())
                
                NavigationLink("LazyStackView", destination: LazyStackView())
                
                NavigationLink("Gradient preview", destination: GradientPreviewView())
            }
            
            // MARK: User Interactive only
            Section {
                NavigationLink("LongPressGestureView", destination: LongPressGestureView())
                
                NavigationLink("DragGestureView", destination: DragGestureView())
                
                NavigationLink("ShareSheetView", destination: ShareSheetView())
                
                NavigationLink("TrackableScrollView", destination: MyTrackableScrollView())
                
                NavigationLink("BindingView", destination: BindingView())
                
                NavigationLink("ModalView", destination: ModalView())
                
                NavigationLink("CustomModalView", destination: CustomModalView())
            }
            
            // MARK: With animation
            Section {
                NavigationLink("TransitionView", destination: TransitionView())
                
                NavigationLink("AnimationView", destination: DesignCodeAnimationView())
                
                NavigationLink("Rotation3DView", destination: Rotation3DView())
                
                NavigationLink("MatchedGeometryEffectView", destination: MatchedGeometryEffectView())
                
                NavigationLink("AdvancedMatchedGeometryEffectView", destination: AdvancedMatchedGeometryEffectView())
                
                NavigationLink("RedactedPlaceholder", destination: RedactedPlaceholder())
                
                NavigationLink("CardScrollView", destination: CardScrollView())
                
                NavigationLink("LoadingAnimView", destination: LoadingAnimView())
            }
            
            Section {
                NavigationLink("Term and Privacy", destination: TermAndPrivacyView())
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
