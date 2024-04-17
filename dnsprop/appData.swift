//
//  Model.swift
//  dnsprop
//
//  Created by Michael Neal on 4/16/24.
//

import Foundation

//struct Model: Identifiable {
//	var id: String
//	var IPs: [String]
//	var dataCenter: String
//	var status: statusState
//
//}
var dataCenters = ["US-East", "US-West", "Canada-East", "Canada-West", "England", "Spain", "Japan"]
enum statusState {
	case online, offline, checking, cannotConnect, waiting
}

