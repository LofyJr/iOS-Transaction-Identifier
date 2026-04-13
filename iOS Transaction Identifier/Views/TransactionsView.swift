//
//  TransactionsView.swift
//  iOS Transaction Identifier
//
//  Created by Juliano Lofy Junior on 13/04/26.
//

import SwiftUI

struct TransactionsView: View {
    @State private var transactionManager = TransactionManager.shared

    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [Color.blue.opacity(0.2), Color.purple.opacity(0.1)], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()

                VStack(spacing: 20) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Meus Registros")
                            .font(.system(size: 32, weight: .bold, design: .rounded))
                        Text("Importações automáticas via iOS")
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .padding(.top)

                    if transactionManager.transactions.isEmpty {
                        Spacer()
                        VStack(spacing: 15) {
                            Image(systemName: "tray.and.arrow.down")
                                .font(.system(size: 60))
                                .foregroundStyle(.blue.gradient)
                            Text("Nenhuma transação ainda")
                                .font(.headline)
                            Text("Configure a automação no app Atalhos para começar a importar seus pagamentos automaticamente.")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 40)
                        }
                        Spacer()
                    } else {
                        ScrollView {
                            LazyVStack(spacing: 16) {
                                ForEach(transactionManager.transactions) { transaction in
                                    TransactionRow(transaction: transaction)
                                }
                            }
                            .padding()
                        }
                    }
                }
            }
            .navigationTitle("Minhas Finanças")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                transactionManager.requestNotificationPermission()
            }
        }
    }
}
