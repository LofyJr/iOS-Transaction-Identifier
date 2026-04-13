//
//  TransactionRow.swift
//  iOS Transaction Identifier
//
//  Created by Juliano Lofy Junior on 13/04/26.
//

import SwiftUI

struct TransactionRow: View {
    let transaction: Transaction

    var body: some View {
        HStack(spacing: 15) {
            ZStack {
                Circle()
                    .fill(transaction.type == .wallet ? Color.orange.opacity(0.2) : Color.blue.opacity(0.2))
                    .frame(width: 48, height: 48)

                Image(systemName: transaction.type == .wallet ? "creditcard.fill" : "message.fill")
                    .foregroundStyle(transaction.type == .wallet ? .orange : .blue)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(transaction.merchant)
                    .font(.system(.headline, design: .rounded))
                Text(transaction.card)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Text(transaction.date, style: .date)
                    .font(.system(size: 10))
                    .foregroundStyle(.tertiary)
            }

            Spacer(minLength: .zero)

            VStack(alignment: .trailing, spacing: 4) {
                Text("R$ \(String(format: "%.2f", transaction.amount))")
                    .font(
                        .system(size: 10, weight: .bold, design: .rounded)
                    )
                    .foregroundStyle(.primary)

                Text(transaction.type.rawValue)
                    .font(.system(size: 10, weight: .medium))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 2)
                    .background(Capsule().fill(.ultraThinMaterial))
            }
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 20)
                .fill(.ultraThinMaterial)
                .shadow(color: .black.opacity(0.05), radius: 10, x: 0, y: 5)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(.white.opacity(0.2), lineWidth: 1)
        }
    }
}
