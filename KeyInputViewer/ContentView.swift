//
//  ContentView.swift
//  KeyInputViewer
//
//  Created by masumi on 2021/11/30.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var keyFetcher: KeyFetcherViewModel = KeyFetcherViewModel()

    var body: some View {
        HStack(alignment: .center) {
            List {
                Section(header: Text("devise")){
                    Text(verbatim: self.keyFetcher.status.input.count > 0 ? self.keyFetcher.status.input : "None")
                }
                Section(header: Text("input")){
                    Text(self.keyFetcher.status.key)
                    Text(self.keyFetcher.status.keyCode)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView() .previewDevice("iPad Pro (11-inch) (3rd generation)")
    }
}
