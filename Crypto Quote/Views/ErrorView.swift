//
//  QuoteView.swift
//  Crypto Quote
//
//  Created by Kleber Maia on 5/1/22.
//

import SwiftUI

/// A simple View for showing an error message.
struct ErrorView: View {
    var error: Error

    var body: some View {
        VStack {
            Spacer()

            Text(error.localizedDescription)
                .foregroundColor(.white)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(.red)
                )
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        let error = NSError(
            domain: "",
            code: 1,
            userInfo: [NSLocalizedDescriptionKey: "Such scary error to be presented to the user 👻"]
        )
        ErrorView(error: error)
    }
}
