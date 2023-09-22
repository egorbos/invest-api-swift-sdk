import GRPC
import Foundation
import SwiftProtobuf

// MARK: - UsersServiceRequests

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetAccountsRequest {
    static func new() -> Self {
        .init()
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetMarginAttributesRequest {
    init(accountId: String) {
        self.accountID = accountId
    }

    static func new(accountId: String) -> Self {
        .init(accountId: accountId)
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetUserTariffRequest {
    static func new() -> Self {
        .init()
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetInfoRequest {
    static func new() -> Self {
        .init()
    }
}

// MARK: - SandboxServiceRequests

internal extension Tinkoff_Public_Invest_Api_Contract_V1_OpenSandboxAccountRequest {
    static func new() -> Self {
        .init()
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_CloseSandboxAccountRequest {
    init(accountId: String) {
        self.accountID = accountId
    }

    static func new(accountId: String) -> Self {
        .init(accountId: accountId)
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_SandboxPayInRequest {
    init(accountId: String, amount: MoneyValue) throws {
        self.accountID = accountId
        self.amount = try amount.forRequest()
    }

    static func new(accountId: String, amount: MoneyValue) throws -> Self {
        try .init(accountId: accountId, amount: amount)
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_WithdrawLimitsRequest {
    init(accountId: String) {
        self.accountID = accountId
    }

    static func new(accountId: String) -> Self {
        .init(accountId: accountId)
    }
}

// MARK: - MarketDataServiceRequests

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetCandlesRequest {
    init(figi: String, from: Date, to: Date, interval: CandleInterval) throws {
        self.figi = figi
        self.from = SwiftProtobuf.Google_Protobuf_Timestamp(date: from)
        self.to = SwiftProtobuf.Google_Protobuf_Timestamp(date: to)
        self.interval = try .new(rawValue: interval.rawValue)
    }

    static func new(figi: String, from: Date, to: Date, interval: CandleInterval) throws -> Self {
        try .init(figi: figi, from: from, to: to, interval: interval)
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetLastPricesRequest {
    init(figis: [String]) {
        self.figi = figis
    }

    static func new(figis: [String]) -> Self {
        .init(figis: figis)
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetOrderBookRequest {
    init(figi: String, depth: Int32) {
        self.figi = figi
        self.depth = depth
    }

    static func new(figi: String, depth: Int32) -> Self {
        .init(figi: figi, depth: depth)
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetTradingStatusRequest {
    init(figi: String) {
        self.figi = figi
    }

    static func new(figi: String) -> Self {
        .init(figi: figi)
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetLastTradesRequest {
    init(figi: String, from: Date, to: Date) {
        self.figi = figi
        self.from = SwiftProtobuf.Google_Protobuf_Timestamp(date: from)
        self.to = SwiftProtobuf.Google_Protobuf_Timestamp(date: to)
    }

    static func new(figi: String, from: Date, to: Date) -> Self {
        .init(figi: figi, from: from, to: to)
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetClosePricesRequest {
    init(figis: [String]) {
        self.instruments = figis.map {
            .new(figi: $0)
        }
    }

    static func new(figis: [String]) -> Self {
        .init(figis: figis)
    }
}

fileprivate extension Tinkoff_Public_Invest_Api_Contract_V1_InstrumentClosePriceRequest {
    init(figi: String) {
        self.instrumentID = figi
    }

    static func new(figi: String) -> Self {
        .init(figi: figi)
    }
}

// MARK: - OperationsServiceRequests

internal extension Tinkoff_Public_Invest_Api_Contract_V1_OperationsRequest {
    init(accountId: String, from: Date, to: Date, state: OperationState, figi: String) throws {
        self.accountID = accountId
        self.from = SwiftProtobuf.Google_Protobuf_Timestamp(date: from)
        self.to = SwiftProtobuf.Google_Protobuf_Timestamp(date: to)
        self.state = try .new(rawValue: state.rawValue)
        self.figi = figi
    }

    static func new(accountId: String, from: Date, to: Date, state: OperationState, figi: String) throws -> Self {
        try .init(accountId: accountId, from: from, to: to, state: state, figi: figi)
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_PortfolioRequest {
    init(accountId: String, currency: CurrencyType) throws {
        self.accountID = accountId
        self.currency = try .new(rawValue: currency.rawValue)
    }

    static func new(accountId: String, currency: CurrencyType) throws -> Self {
        try .init(accountId: accountId, currency: currency)
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_PositionsRequest {
    init(accountId: String) {
        self.accountID = accountId
    }

    static func new(accountId: String) -> Self {
        .init(accountId: accountId)
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_BrokerReportRequest {
    init(accountId: String, from: Date, to: Date) {
        self.generateBrokerReportRequest = Tinkoff_Public_Invest_Api_Contract_V1_GenerateBrokerReportRequest()
        self.generateBrokerReportRequest.accountID = accountId
        self.generateBrokerReportRequest.from = SwiftProtobuf.Google_Protobuf_Timestamp(date: from)
        self.generateBrokerReportRequest.to = SwiftProtobuf.Google_Protobuf_Timestamp(date: to)
    }

    static func generate(accountId: String, from: Date, to: Date) -> Self {
        .init(accountId: accountId, from: from, to: to)
    }

    init(taskId: String, page: Int32) {
        self.getBrokerReportRequest = Tinkoff_Public_Invest_Api_Contract_V1_GetBrokerReportRequest()
        self.getBrokerReportRequest.taskID = taskId
        self.getBrokerReportRequest.page = page
    }
    
    static func get(taskId: String, page: Int32) -> Self {
        .init(taskId: taskId, page: page)
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetDividendsForeignIssuerRequest {
    init(accountId: String, from: Date, to: Date) {
        self.generateDivForeignIssuerReport = Tinkoff_Public_Invest_Api_Contract_V1_GenerateDividendsForeignIssuerReportRequest()
        self.generateDivForeignIssuerReport.accountID = accountId
        self.generateDivForeignIssuerReport.from = SwiftProtobuf.Google_Protobuf_Timestamp(date: from)
        self.generateDivForeignIssuerReport.to = SwiftProtobuf.Google_Protobuf_Timestamp(date: to)
    }

    static func generate(accountId: String, from: Date, to: Date) -> Self {
        .init(accountId: accountId, from: from, to: to)
    }

    init(taskId: String, page: Int32) {
        self.getDivForeignIssuerReport = Tinkoff_Public_Invest_Api_Contract_V1_GetDividendsForeignIssuerReportRequest()
        self.getDivForeignIssuerReport.taskID = taskId
        self.getDivForeignIssuerReport.page = page
    }
    
    static func get(taskId: String, page: Int32) -> Self {
        .init(taskId: taskId, page: page)
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetOperationsByCursorRequest {
    init(
        accountId: String, instrumentId: String, from: Date, to: Date,
        cursor: String, limit: Int32, types: [OperationType], state: OperationState,
        withCommissions: Bool, withTrades: Bool, withOvernights: Bool
    ) throws {
        self.accountID = accountId
        self.instrumentID = instrumentId
        self.from = SwiftProtobuf.Google_Protobuf_Timestamp(date: from)
        self.to = SwiftProtobuf.Google_Protobuf_Timestamp(date: to)
        self.cursor = cursor
        self.limit = limit
        self.operationTypes = try types.map { try .new(rawValue: $0.rawValue) }
        self.state = try .new(rawValue: state.rawValue)
        self.withoutCommissions = !withCommissions
        self.withoutTrades = !withTrades
        self.withoutOvernights = !withOvernights
    }

    static func new(
        accountId: String, instrumentId: String, from: Date, to: Date,
        cursor: String, limit: Int32, types: [OperationType], state: OperationState,
        withCommissions: Bool, withTrades: Bool, withOvernights: Bool
    ) throws -> Self {
        try .init(
            accountId: accountId, instrumentId: instrumentId, from: from, to: to,
            cursor: cursor, limit: limit, types: types, state: state,
            withCommissions: withCommissions, withTrades: withTrades, withOvernights: withOvernights
        )
    }
}

// MARK: - OperationsStreamServiceRequests

internal extension Tinkoff_Public_Invest_Api_Contract_V1_PortfolioStreamRequest {
    init(accounts: [String]) {
        self.accounts = accounts
    }

    static func new(accounts: [String]) -> Self {
        .init(accounts: accounts)
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_PositionsStreamRequest {
    init(accounts: [String]) {
        self.accounts = accounts
    }

    static func new(accounts: [String]) -> Self {
        .init(accounts: accounts)
    }
}

// MARK: - OrdersServiceRequests

internal extension Tinkoff_Public_Invest_Api_Contract_V1_PostOrderRequest {
    init(
        accountId: String, instrumentId: String, orderRequestId: String?,
        type: OrderType, direction: OrderDirection, price: Quotation, quantity: Int64
    ) throws {
        self.accountID = accountId
        self.instrumentID = instrumentId
        if let orderRequestId = orderRequestId { self.orderID = orderRequestId }
        self.orderType = try .new(rawValue: type.rawValue)
        self.direction = try .new(rawValue: direction.rawValue)
        self.price = try price.forRequest()
        self.quantity = quantity
    }

    static func new(
        accountId: String, instrumentId: String, orderRequestId: String?,
        type: OrderType, direction: OrderDirection, price: Quotation, quantity: Int64
    ) throws -> Self {
        try .init(
            accountId: accountId, instrumentId: instrumentId, orderRequestId: orderRequestId,
            type: type, direction: direction, price: price, quantity: quantity
        )
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_CancelOrderRequest {
    init(accountId: String, orderId: String) {
        self.accountID = accountId
        self.orderID = orderId
    }

    static func new(accountId: String, orderId: String) -> Self {
        .init(accountId: accountId, orderId: orderId)
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetOrderStateRequest {
    init(accountId: String, orderId: String) {
        self.accountID = accountId
        self.orderID = orderId
    }

    static func new(accountId: String, orderId: String) -> Self {
        .init(accountId: accountId, orderId: orderId)
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetOrdersRequest {
    init(accountId: String) {
        self.accountID = accountId
    }

    static func new(accountId: String) -> Self {
        .init(accountId: accountId)
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_ReplaceOrderRequest {
    init(
        accountId: String, orderId: String, orderRequestId: String?,
        price: Quotation, priceType: PriceType, quantity: Int64
    ) throws {
        self.accountID = accountId
        self.orderID = orderId
        if let orderRequestId = orderRequestId { self.idempotencyKey = orderRequestId }
        self.price = try price.forRequest()
        self.priceType = try .new(rawValue: priceType.rawValue)
        self.quantity = quantity
    }

    static func new(
        accountId: String, orderId: String, orderRequestId: String?,
        price: Quotation, priceType: PriceType, quantity: Int64
    ) throws -> Self {
        try .init(
            accountId: accountId, orderId: orderId, orderRequestId: orderRequestId,
            price: price, priceType: priceType, quantity: quantity
        )
    }
}

// MARK: - OrdersStreamServiceRequests

internal extension Tinkoff_Public_Invest_Api_Contract_V1_TradesStreamRequest {
    init(accounts: [String]) {
        self.accounts = accounts
    }

    static func new(accounts: [String]) -> Self {
        .init(accounts: accounts)
    }
}

// MARK: - StopOrdersServiceRequests

internal extension Tinkoff_Public_Invest_Api_Contract_V1_PostStopOrderRequest {
    init(
        accountId: String, instrumentId: String, quantity: Int64, price: Quotation,
        stopPrice: Quotation, direction: OrderDirection, stopOrderType: StopOrderType,
        expirationType: StopOrderExpirationType, expireDate: Date
    ) throws {
        self.accountID = accountId
        self.instrumentID = instrumentId
        self.quantity = quantity
        self.price = try price.forRequest()
        self.stopPrice = try stopPrice.forRequest()
        self.direction = try .new(rawValue: direction.rawValue)
        self.stopOrderType = try .new(rawValue: stopOrderType.rawValue)
        self.expirationType = try .new(rawValue: expirationType.rawValue)
        self.expireDate = SwiftProtobuf.Google_Protobuf_Timestamp(date: expireDate)
    }

    static func new(
        accountId: String, instrumentId: String, quantity: Int64, price: Quotation,
        stopPrice: Quotation, direction: OrderDirection, stopOrderType: StopOrderType,
        expirationType: StopOrderExpirationType, expireDate: Date
    ) throws -> Self {
        try .init(
            accountId: accountId, instrumentId: instrumentId, quantity: quantity, price: price,
            stopPrice: stopPrice, direction: direction, stopOrderType: stopOrderType,
            expirationType: expirationType, expireDate: expireDate
        )
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetStopOrdersRequest {
    init(accountId: String) {
        self.accountID = accountId
    }

    static func new(accountId: String) -> Self {
        .init(accountId: accountId)
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_CancelStopOrderRequest {
    init(accountId: String, stopOrderId: String) {
        self.accountID = accountId
        self.stopOrderID = stopOrderId
    }

    static func new(accountId: String, stopOrderId: String) -> Self {
        .init(accountId: accountId, stopOrderId: stopOrderId)
    }
}

// MARK: - InstrumentsServiceRequests

internal extension Tinkoff_Public_Invest_Api_Contract_V1_TradingSchedulesRequest {
    init(exchange: String, from: Date, to: Date) {
        self.exchange = exchange
        self.from = SwiftProtobuf.Google_Protobuf_Timestamp(date: from)
        self.to = SwiftProtobuf.Google_Protobuf_Timestamp(date: to)
    }

    static func new(exchange: String, from: Date, to: Date) -> Self {
        .init(exchange: exchange, from: from, to: to)
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_InstrumentRequest {
    init(idType: InstrumentIdType, classCode: String, id: String) throws {
        self.id = id
        self.classCode = classCode
        self.idType = try .new(rawValue: idType.rawValue)
    }

    static func new(idType: InstrumentIdType, classCode: String, id: String) throws -> Self {
        try .init(idType: idType, classCode: classCode, id: id)
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_InstrumentsRequest {
    init(instrumentStatus: InstrumentStatus) throws {
        self.instrumentStatus = try .new(rawValue: instrumentStatus.rawValue)
    }

    static func new(instrumentStatus: InstrumentStatus) throws -> Self {
        try .init(instrumentStatus: instrumentStatus)
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetBondCouponsRequest {
    init(figi: String, from: Date, to: Date) {
        self.figi = figi
        self.from = SwiftProtobuf.Google_Protobuf_Timestamp(date: from)
        self.to = SwiftProtobuf.Google_Protobuf_Timestamp(date: to)
    }

    static func new(figi: String, from: Date, to: Date) -> Self {
        .init(figi: figi, from: from, to: to)
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_FilterOptionsRequest {
    init(basicAssetUid: String, basicAssetPositionUid: String) {
        self.basicAssetUid = basicAssetUid
        self.basicAssetPositionUid = basicAssetPositionUid
    }

    static func new(basicAssetUid: String, basicAssetPositionUid: String) -> Self {
        .init(basicAssetUid: basicAssetUid, basicAssetPositionUid: basicAssetPositionUid)
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetAccruedInterestsRequest {
    init(figi: String, from: Date, to: Date) {
        self.figi = figi
        self.from = SwiftProtobuf.Google_Protobuf_Timestamp(date: from)
        self.to = SwiftProtobuf.Google_Protobuf_Timestamp(date: to)
    }

    static func new(figi: String, from: Date, to: Date) -> Self {
        .init(figi: figi, from: from, to: to)
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetFuturesMarginRequest {
    init(figi: String) {
        self.figi = figi
    }

    static func new(figi: String) -> Self {
        .init(figi: figi)
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetDividendsRequest {
    init(figi: String, from: Date, to: Date) {
        self.figi = figi
        self.from = SwiftProtobuf.Google_Protobuf_Timestamp(date: from)
        self.to = SwiftProtobuf.Google_Protobuf_Timestamp(date: to)
    }

    static func new(figi: String, from: Date, to: Date) -> Self {
        .init(figi: figi, from: from, to: to)
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_AssetRequest {
    init(uid: String) {
        self.id = uid
    }

    static func new(uid: String) -> Self {
        .init(uid: uid)
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_AssetsRequest {
    init(kind: InstrumentKind) throws {
        self.instrumentType = try .new(rawValue: kind.rawValue)
    }

    static func new(kind: InstrumentKind) throws -> Self {
        try .init(kind: kind)
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetFavoritesRequest {
    static func new() -> Self {
        .init()
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_EditFavoritesRequest {
    init(figis: [String], action: FavoriteActionType) throws {
        self.instruments = figis.map {
            Tinkoff_Public_Invest_Api_Contract_V1_EditFavoritesRequestInstrument(figi: $0)
        }
        self.actionType = try .new(rawValue: action.rawValue)
    }

    static func new(figis: [String], action: FavoriteActionType) throws -> Self {
        try .init(figis: figis, action: action)
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_EditFavoritesRequestInstrument {
    init(figi: String) {
        self.figi = figi
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetCountriesRequest {
    static func new() -> Self {
        .init()
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_FindInstrumentRequest {
    init(query: String, kind: InstrumentKind, apiTradeAvailableFlag: Bool) throws {
        self.query = query
        self.instrumentKind = try .new(rawValue: kind.rawValue)
        self.apiTradeAvailableFlag = apiTradeAvailableFlag
    }

    static func new(query: String, kind: InstrumentKind, apiTradeAvailableFlag: Bool) throws -> Self {
        try .init(query: query, kind: kind, apiTradeAvailableFlag: apiTradeAvailableFlag)
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetBrandRequest {
    init(uid: String) {
        self.id = uid
    }

    static func new(uid: String) -> Self {
        .init(uid: uid)
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetBrandsRequest {
    static func new() -> Self {
        .init()
    }
}
