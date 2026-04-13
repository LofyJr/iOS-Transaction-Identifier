//
//  ImportSMSPaymentIntent.swift
//  iOS Transaction Identifier
//
//  Created by Juliano Lofy Junior on 13/04/26.
//

import AppIntents
import Foundation

struct ImportSMSPaymentIntent: AppIntent {
    static var title: LocalizedStringResource = "Importar SMS"
    static var description = IntentDescription("Analisa e registra uma despesa a partir do conteúdo de um SMS.")

    @Parameter(title: "Conteúdo do SMS")
    var content: String

    static var parameterSummary: some ParameterSummary {
        Summary("Processar SMS: \(\.$content)")
    }

    @MainActor
    func perform() async throws -> some IntentResult & ReturnsValue<String> & ProvidesDialog {
        TransactionManager.shared.processSMS(content: content)
        return .result(value: "SMS processado e despesa registrada.", dialog: "SMS Importado")
    }
}
