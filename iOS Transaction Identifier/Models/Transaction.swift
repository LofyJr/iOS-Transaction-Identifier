//
//  Transaction.swift
//  iOS Transaction Identifier
//
//  Created by Juliano Lofy Junior on 13/04/26.
//

import Foundation

struct Transaction: Identifiable, Codable {
    let id: UUID
    let date: Date
    let merchant: String
    let amount: Double
    let card: String
    let type: TransactionType

    enum TransactionType: String, Codable {
        case wallet = "Carteira Digital"
        case sms = "SMS"
    }
}
