import NIOCore
import Foundation

/// Сервис для работы с песочницей.
public protocol SandboxService {
    /// Регистрирует счёт в песочнице.
    ///
    ///  - returns: Идентификатор зарегистрированного счёта.
    func openSandboxAccount() throws -> EventLoopFuture<String>
    
    /// Закрывает счёт в песочнице.
    ///
    ///  - parameters:
    ///      - accountId: Идентификатор счёта песочницы.
    func closeSandboxAccount(accountId id: String) throws -> EventLoopFuture<Void>
    
    /// Пополняет счёт в песочнице.
    ///
    ///  - parameters:
    ///      - accountId: Идентификатор счёта песочницы.
    ///      - amount: Сумма пополнения счёта в рублях.
    ///
    ///  - returns: Текущий баланс счёта `MoneyValue`.
    func sandboxPayIn(accountId id: String, amount: MoneyValue) throws -> EventLoopFuture<MoneyValue>
    
    /// Получает доступный остаток для вывода средств в песочнице.
    ///
    ///  - parameter accountId: Идентификатор счёта песочницы.
    ///
    ///  - returns: Доступный остаток для вывода средств `WithdrawLimits`.
    func getSandboxWithdrawLimits(accountId id: String) throws -> EventLoopFuture<WithdrawLimits>
    
#if compiler(>=5.5) && canImport(_Concurrency)
    /// Регистрирует счёт в песочнице.
    ///
    ///  - returns: Идентификатор зарегистрированного счёта.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func openSandboxAccount() async throws -> String
    
    /// Закрывает счёт в песочнице.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func closeSandboxAccount(accountId id: String) async throws -> Void
    
    /// Пополняет счёт в песочнице.
    ///
    ///  - parameters:
    ///      - accountId: Идентификатор счёта песочницы.
    ///      - amount: Сумма пополнения счёта в рублях.
    ///
    ///  - returns: Текущий баланс счёта `MoneyValue`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func sandboxPayIn(accountId id: String, amount: MoneyValue) async throws -> MoneyValue
    
    /// Получает доступный остаток для вывода средств в песочнице.
    ///
    ///  - parameter accountId: Идентификатор счёта песочницы.
    ///
    ///  - returns: Доступный остаток для вывода средств `WithdrawLimits`.
    @available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
    func getSandboxWithdrawLimits(accountId id: String) async throws -> WithdrawLimits
#endif
}

internal struct GrpcSandboxService: SandboxService {
    let client: SandboxServiceClient
    
    init(_ client: SandboxServiceClient) {
        self.client = client
    }
    
    func openSandboxAccount() throws -> EventLoopFuture<String> {
        self.client
            .openSandboxAccount(Requests.SandboxServiceRequests.openSandboxAccountRequest)
            .response
            .map { $0.accountID }
    }
    
    func closeSandboxAccount(accountId id: String) throws -> EventLoopFuture<Void> {
        self.client
            .closeSandboxAccount(
                Requests.SandboxServiceRequests.closeSandboxAccountRequest.with(accountId: id)
            )
            .response
            .map { _ in  }
    }
    
    func sandboxPayIn(accountId id: String, amount: MoneyValue) throws -> EventLoopFuture<MoneyValue> {
        self.client
            .sandboxPayIn(
                try Requests.SandboxServiceRequests.sandboxPayInRequest.with(accountId: id, amount: amount)
            )
            .response
            .map { $0.balance.toModel() }
    }
    
    func getSandboxWithdrawLimits(accountId id: String) throws -> EventLoopFuture<WithdrawLimits> {
        self.client
            .getSandboxWithdrawLimits(
                Requests.SandboxServiceRequests.withdrawLimitsRequest.with(accountId: id)
            )
            .response
            .map { $0.toModel() }
    }
    
#if compiler(>=5.5) && canImport(_Concurrency)
    func openSandboxAccount() async throws -> String {
        try await self.client
            .openSandboxAccount(Requests.SandboxServiceRequests.openSandboxAccountRequest)
            .accountID
    }
    
    func closeSandboxAccount(accountId id: String) async throws {
        _ = try await self.client
            .closeSandboxAccount(
                Requests.SandboxServiceRequests.closeSandboxAccountRequest.with(accountId: id)
            )
    }
    
    func sandboxPayIn(accountId id: String, amount: MoneyValue) async throws -> MoneyValue {
        try await self.client
            .sandboxPayIn(
                try Requests.SandboxServiceRequests.sandboxPayInRequest.with(accountId: id, amount: amount)
            )
            .balance
            .toModel()
    }
    
    func getSandboxWithdrawLimits(accountId id: String) async throws -> WithdrawLimits {
        try await self.client
            .getSandboxWithdrawLimits(
                Requests.SandboxServiceRequests.withdrawLimitsRequest.with(accountId: id)
            )
            .toModel()
    }
#endif
}
