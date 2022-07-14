//
//  SideBar.swift
//  DesignCode
//
//  Created by Bym on 13/07/2022.
//

import SwiftUI

/// The Sidebar is a List that is embeded inside a Navigation View.
/// You can customize the title and the layout will automatically adapt to the iPhone and iPad in portrait and landscape modes.
///
struct SideBarView: View {
    var body: some View {
        NavigationView {
            List {
                Label("Courses", systemImage: "book")
                Label("Tutorials", systemImage: "square")
            }
            .navigationTitle("Learn")
        }
    }
}

struct SideBarView_Previews: PreviewProvider {
    static var previews: some View {
        SideBarView()
    }
}
