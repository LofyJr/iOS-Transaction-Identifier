//
//  TransactionManager.swift
//  iOS Transaction Identifier
//
//  Created by Juliano Lofy Junior on 13/04/26.
//

import Foundation
import SwiftUI
import UserNotifications

@Observable
class TransactionManager {
    static let shared = TransactionManager()

    var transactions: [Transaction] = []

    private let saveKey = "SavedTransactions"

    init() {
        loadTransactions()
    }
}

// MARK: - Methods

extension TransactionManager {
    func addTransaction(merchant: String, amount: Double, card: String, type: Transaction.TransactionType) {
        let newTransaction = Transaction(
            id: UUID(),
            date: Date(),
            merchant: merchant,
            amount: amount,
            card: card,
            type: type
        )
        transactions.insert(newTransaction, at: 0)
        saveTransactions()
        sendNotification(for: newTransaction)
    }

    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {
                print("Permissão de notificação concedida")
            } else if let error = error {
                print("Erro ao solicitar permissão: \(error.localizedDescription)")
            }
        }
    }

    func processSMS(content: String) {
        let amountPattern = "R\\$\\s?([0-9]+[.,][0-9]{2})"
        let cardPattern = "cartão final ([0-9]{4})"
        let merchantPattern = "em\\s([^.]+)"

        var foundAmount: Double = 0.0
        var foundCard: String = "Desconhecido"
        var foundMerchant: String = "Comerciante Desconhecido"

        if let amountRange = content.range(of: amountPattern, options: .regularExpression) {
            let amountStr = String(content[amountRange])
                .replacingOccurrences(of: "R$", with: "")
                .replacingOccurrences(of: " ", with: "")
                .replacingOccurrences(of: ",", with: ".")
                .trimmingCharacters(in: .whitespaces)
            foundAmount = Double(amountStr) ?? 0.0
        }

        if let cardRange = content.range(of: cardPattern, options: .regularExpression) {
            foundCard = String(content[cardRange]).replacingOccurrences(of: "cartão final ", with: "")
        }

        if let merchantRange = content.range(of: merchantPattern, options: .regularExpression) {
            foundMerchant = String(content[merchantRange])
                .replacingOccurrences(of: "em ", with: "")
                .trimmingCharacters(in: .whitespacesAndNewlines)
        }

        addTransaction(merchant: foundMerchant, amount: foundAmount, card: foundCard, type: .sms)
    }
}

// MARK: - Private Methods

private extension TransactionManager {
    func sendNotification(for transaction: Transaction) {
        let content = UNMutableNotificationContent()
        content.title = "Pagamento Registrado"
        content.body = "\(transaction.merchant): R$ \(String(format: "%.2f", transaction.amount)) no \(transaction.card)"
        content.sound = .default

        let request = UNNotificationRequest(
            identifier: transaction.id.uuidString,
            content: content,
            trigger: nil
        )

        UNUserNotificationCenter.current().add(request)
    }

    func saveTransactions() {
        if let encoded = try? JSONEncoder().encode(transactions) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }

    func loadTransactions() {
        if let data = UserDefaults.standard.data(forKey: saveKey),
           let decoded = try? JSONDecoder().decode([Transaction].self, from: data) {
            transactions = decoded
        }
    }
}
