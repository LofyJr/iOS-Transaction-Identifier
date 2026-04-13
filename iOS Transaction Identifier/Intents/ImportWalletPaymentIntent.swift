//
//  ImportWalletPaymentIntent.swift
//  iOS Transaction Identifier
//
//  Created by Juliano Lofy Junior on 13/04/26.
//

import Foundation
import AppIntents

struct ImportWalletPaymentIntent: AppIntent {
    static var title: LocalizedStringResource = "Importar da Carteira Digital"
    static var description = IntentDescription("Registra automaticamente uma despesa vinda da Apple Wallet.")

    @Parameter(title: "Cartão")
    var card: String?

    @Parameter(title: "Comerciante")
    var merchant: String?

    @Parameter(title: "Valor")
    var amount: Double?

    static var parameterSummary: some ParameterSummary {
        Summary("Importar pagamento de \(\.$amount) em \(\.$merchant) usando \(\.$card)")
    }

    @MainActor
    func perform() async throws -> some IntentResult & ReturnsValue<String> & ProvidesDialog {
        let finalMerchant = merchant ?? "Desconhecido"
        let finalAmount = amount ?? 0.0
        let finalCard = card ?? "Cartão não identificado"
        
        TransactionManager.shared.addTransaction(
            merchant: finalMerchant,
            amount: finalAmount,
            card: finalCard,
            type: .wallet
        )
        
        return .result(value: "Pagamento de R$ \(finalAmount) em \(finalMerchant) registrado com sucesso!", dialog: "Pagamento registrado")
    }
}
