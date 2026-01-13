//
//  Created by Artem Novichkov on 13.01.2026.
//

import SwiftUI

struct ContentView: View {
    @State private var string: AttributedString = ""

    var body: some View {
        Text(string)
            .onAppear {
                do {
                    let markdown = "^[SwiftUI](color: 'red') **does** support Markdown, but with _nuances_. Read more on [artemnovichkov.com](https://artemnovichkov.com)"
                    string = try AttributedString(markdown: markdown, including: \.custom)
                    for run in string.runs {
                        if run.link != nil {
                            string[run.range].foregroundColor = .green
                            string[run.range].underlineStyle = .single
                        }
                        if let color = run.color {
                            string[run.range].foregroundColor = Color(color)
                        }
                    }
                } catch {
                    print("Failed to parse markdown: \(error)")
                }
            }
    }
}

#Preview {
    ContentView()
}
