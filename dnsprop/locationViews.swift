//
//  locationViews.swift
//  dnsprop
//
//  Created by Michael Neal on 4/16/24.
//

import SwiftUI

struct locationView: View {
	var dataCenter: String
	var status: Bool
	var firstIP: String
	var secondIP: String?
	var body: some View {
		HStack {
			Text("\(dataCenter):")
			Spacer()
			if !status {
				Image(systemName: "network.slash")
					.foregroundColor(.red)
			} else {
				VStack {
					HStack {
						Spacer()
						Text(firstIP)
						Image(systemName: "network")
							.foregroundColor(.green)
					}
					if secondIP != nil {
						HStack {
							Spacer()
							Text(secondIP!)
							Image(systemName: "network")
								.foregroundColor(.green)
						}
						
					}
				}
			}
		}
		.padding(5)
    }
}

#Preview {
	locationView(dataCenter: "US-West", status: true, firstIP: "10.0.0.1", secondIP: "10.0.0.2")
}
