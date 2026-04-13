//
//  PaymentShortcuts.swift
//  iOS Transaction Identifier
//
//  Created by Juliano Lofy Junior on 13/04/26.
//

import AppIntents
import Foundation

struct PaymentShortcuts: AppShortcutsProvider {
    static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: ImportWalletPaymentIntent(),
            phrases: [
                "Importar da \(.applicationName)",
                "Registrar pagamento na \(.applicationName)"
            ],
            shortTitle: "Importar Carteira",
            systemImageName: "creditcard.and.1.rectangle"
        )

        AppShortcut(
            intent: ImportSMSPaymentIntent(),
            phrases: [
                "Processar SMS na \(.applicationName)"
            ],
            shortTitle: "Importar SMS",
            systemImageName: "message"
        )
    }
}
