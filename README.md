# 💳 iOS Transaction Identifier

[![Swift](https://img.shields.io/badge/Swift-5.9+-orange.svg?style=for-the-badge&logo=swift)](https://swift.org)
[![Platform](https://img.shields.io/badge/Platform-iOS%2017+-blue.svg?style=for-the-badge&logo=apple)](https://apple.com)
[![SwiftUI](https://img.shields.io/badge/UI-SwiftUI-blue.svg?style=for-the-badge&logo=swift)](https://developer.apple.com/xcode/swiftui/)

Uma ferramenta poderosa e elegante para automação de registros financeiros no iOS. O **iOS Transaction Identifier** integra-se profundamente ao ecossistema Apple através de **App Intents**, permitindo que transações recebidas via SMS ou notificações da Apple Wallet sejam processadas e salvas automaticamente via Siri e Atalhos.

---

## ✨ Destaques do Projeto

-   **🚀 Integração Nativa com Atalhos**: Utiliza o framework **App Intents** para permitir automações baseadas em gatilhos do sistema (chegada de SMS ou notificações de pagamento).
-   **🔍 Parsing Inteligente via Regex**: Algoritmo robusto para extrair automaticamente o valor (R$), o estabelecimento e os últimos dígitos do cartão diretamente do conteúdo de texto.
-   **🎨 Interface Premium**: UI moderna desenvolvida inteiramente em **SwiftUI**, utilizando gradientes dinâmicos, glassmorphism e tipografia arredondada para uma experiência de usuário excepcional.
-   **📱 Notificações de Resumo**: Sistema de feedback imediato via **UserNotifications**, confirmando o registro bem-sucedido de cada transação processada em segundo plano.
-   **Architecture Clean**: Implementação seguindo padrões modernos com o novo macro `@Observable`, garantindo reatividade eficiente e código limpo.

---

## 🛠️ Tecnologias e Frameworks

O projeto demonstra proficiência em APIs avançadas da Apple:

-   **App Intents**: Definição de entradas para Siri e App Atalhos, tornando o app parte integrante do workflow do usuário.
-   **SwiftUI (Modern APIs)**: Implementação de `NavigationStack`, `LinearGradient` e `LazyVStack` para alta performance.
-   **NSRegularExpression**: Tratamento complexo de Strings para extração de dados financeiros.
-   **UserDefaults + Codable**: Persistência de dados leve e eficiente.
-   **App Shortcuts Provider**: Facilitando a descoberta das funcionalidades do app dentro de todo o sistema iOS.

---

## ⚙️ Como funciona a Mágica?

O fluxo de automação é o coração deste projeto:

1.  **Gatilho**: O iOS detecta uma notificação de pagamento ou SMS de um banco.
2.  **Automação**: Um Atalho do iOS é disparado passando o texto da mensagem para o app.
3.  **Processamento**: O `ImportSMSPaymentIntent` ou `ImportWalletPaymentIntent` entra em ação, extraindo os dados cruciais.
4.  **Feedback**: O usuário recebe uma notificação local confirmando o registro: *"Pagamento Registrado: R$ 150,00 no Starbucks"*.

---

## 📲 Passo a Passo: Configurando a Automação

Para que o app registre suas transações automaticamente, você precisa configurar uma Automação Pessoal no app **Atalhos (Shortcuts)** do seu iPhone. Siga os passos abaixo:

### 1️⃣ Iniciar Nova Automação
Abra o app **Atalhos**, vá na aba **Automação** e toque no botão **+** no canto superior direito.
## [Passo 1]
<img width="585" height="1266" alt="IMG_1544" src="https://github.com/user-attachments/assets/ccdbee1f-edf7-4312-8361-f865fb21285f" />

### 2️⃣ Escolha o Gatilho "Carteira"
Role a lista de gatilhos até encontrar a opção **Carteira (Wallet)**. Esta opção dispara a automação sempre que você aproximar o iPhone de uma maquininha ou usar um cartão cadastrado.
## [Passo 2]
<img width="585" height="1266" alt="IMG_1545" src="https://github.com/user-attachments/assets/72046434-ad42-446c-a6da-fd2ed0a8db67" />

### 3️⃣ Configure as Opções do Cartão
Selecione as categorias de transação que deseja monitorar (ex: Compras, Viagem, Serviços). Certifique-se de marcar a opção **Executar Imediatamente** para que o registro ocorra sem intervenção manual.
## [Passo 3]
<img width="585" height="1266" alt="IMG_1546" src="https://github.com/user-attachments/assets/7ca72199-b7c7-4b3c-bb14-d7487123928b" />

### 4️⃣ Adicionar Ação
Na tela seguinte, toque em Criar Novo Atalho.
## [Passo 4]
<img width="585" height="1266" alt="IMG_1547" src="https://github.com/user-attachments/assets/d670be34-82d5-4522-9e3f-d61e41f86e1a" />

### 5️⃣ Selecione o App "PayTrack"
Procure na lista de aplicativos por **PayTrack** (ou seu próprio app). Selecione a intenção disparada pelo app para processar os dados da transação.
## [Passo 5]
<img width="585" height="1266" alt="IMG_1548" src="https://github.com/user-attachments/assets/f4051046-41ad-467c-98c5-f14763844025" />

### 6️⃣ Escolha a Ação Específica
Selecione entre **Importar da Carteira Digital** ou **Importar SMS**, dependendo do gatilho que você configurou no passo 2.
## [Passo 6]
<img width="585" height="1266" alt="IMG_1549" src="https://github.com/user-attachments/assets/7b85aa2c-9e1c-4e2e-869d-730a0e3419ea" />

### 7️⃣ Adicione e Configure os Parâmetros
A ação será adicionada ao fluxo. Agora você precisa conectar os dados recebidos pelo sistema aos campos do aplicativo. Toque nos campos azuis (**Valor**, **Comerciante**, **Cartão**) para mapeá-los.
## [Passo 7]
<img width="585" height="1266" alt="IMG_1550" src="https://github.com/user-attachments/assets/45545411-dbfa-4ddd-acb4-840ef14d6085" />

### 8️⃣ Mapeie o Valor
Ao tocar no campo **Valor**, selecione **Entrada do Atalho** e escolha a propriedade **Valor**. Isso garante que o montante exato da transação seja enviado ao app.
## [Passo 8]
<img width="585" height="1266" alt="IMG_1551" src="https://github.com/user-attachments/assets/07fd5bb7-cb56-4c70-9d4a-a20ac0e8accf" />

### 9️⃣ Mapeie o Comerciante
Repita o processo para o campo **Comerciante**, vinculando-o à propriedade correspondente da entrada da automação.
## [Passo 9]
<img width="585" height="1266" alt="IMG_1552" src="https://github.com/user-attachments/assets/0219b68f-2069-4917-bcca-98f5df5c62d4" />
<img width="585" height="1266" alt="IMG_1553" src="https://github.com/user-attachments/assets/3e2e66e3-3fc5-4aed-9c23-c8ecf47851a6" />
<img width="585" height="1266" alt="Captura de Tela 2026-04-13 à(s) 14 01 45" src="https://github.com/user-attachments/assets/376370b7-1097-4fd5-aa1e-8fc5a5d14dd0" />

### 🔟 Finalize e Salve
Após mapear todos os campos, sua automação está pronta! Toque no ícone de check (concluído) no canto superior direito. Agora, cada pagamento feito via Apple Wallet será registrado automaticamente no seu app.
## [Passo 10]
<img width="585" height="1266" alt="Captura de Tela 2026-04-13 à(s) 14 02 35" src="https://github.com/user-attachments/assets/2d6079a9-e6be-47fa-82a3-cf7f2f6289a0" />

### ✅ Em Prod!
Após qualquer compra realizada com os cartões cadastrados, será possível gerenciá-la diretamente no aplicativo.
<img width="585" height="1266" alt="IMG_1542" src="https://github.com/user-attachments/assets/6ab4a65f-5565-46a9-a916-1a3fbad4a71c" />
<img width="585" height="1266" alt="IMG_1543" src="https://github.com/user-attachments/assets/c0360791-74da-4dba-8dbd-1f46308b86ab" />

---

## 🏗️ Estrutura do Código

```text
├── App/                  # Ciclo de vida da aplicação
├── Intents/             # Integração com Siri & Atalhos (App Intents)
├── Models/              # Definições de dados (Transaction)
├── Services/            # Lógica de negócio e Parsing (TransactionManager)
├── Views/               # UI Components e Telas Principais
└── Resources/           # Assets e configuração local
```

---

## 🚀 Como Executar

1.  Clone o repositório.
2.  Abra o arquivo `.xcodeproj` no **Xcode 15.0+**.
3.  Execute no simulador ou em um dispositivo real com **iOS 17.0+**.
4.  No app Atalhos, você poderá ver e configurar os novos Intents: *"Importar Carteira"* e *"Processar SMS"*.

---

## 👨‍💻 Sobre o Desenvolvedor

Este projeto foi desenvolvido como uma demonstração técnica de integração sistêmica no iOS, focando em produtividade e experiência do usuário. 

-   **LinkedIn**: [https://www.linkedin.com/in/juliano-lofy-junior-5b8b13203/]

---

