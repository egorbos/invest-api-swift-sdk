import GRPC
import Foundation
import SwiftProtobuf

internal struct Requests {
    struct UsersServiceRequests {
        static let getAccountsRequest = Tinkoff_Public_Invest_Api_Contract_V1_GetAccountsRequest()
        static let getMarginAttributesRequest = Tinkoff_Public_Invest_Api_Contract_V1_GetMarginAttributesRequest()
        static let getUserTariffRequest = Tinkoff_Public_Invest_Api_Contract_V1_GetUserTariffRequest()
        static let getInfoRequest = Tinkoff_Public_Invest_Api_Contract_V1_GetInfoRequest()
    }
    
    struct SandboxServiceRequests {
        static let openSandboxAccountRequest = Tinkoff_Public_Invest_Api_Contract_V1_OpenSandboxAccountRequest()
        static let closeSandboxAccountRequest = Tinkoff_Public_Invest_Api_Contract_V1_CloseSandboxAccountRequest()
        static let sandboxPayInRequest = Tinkoff_Public_Invest_Api_Contract_V1_SandboxPayInRequest()
        static let withdrawLimitsRequest = Tinkoff_Public_Invest_Api_Contract_V1_WithdrawLimitsRequest()
    }
    
    struct MarketDataServiceRequests {
        static let getCandlesRequest = Tinkoff_Public_Invest_Api_Contract_V1_GetCandlesRequest()
        static let getLastPricesRequest = Tinkoff_Public_Invest_Api_Contract_V1_GetLastPricesRequest()
        static let getOrderBookRequest = Tinkoff_Public_Invest_Api_Contract_V1_GetOrderBookRequest()
        static let getTradingStatusRequest = Tinkoff_Public_Invest_Api_Contract_V1_GetTradingStatusRequest()
        static let getLastTradesRequest = Tinkoff_Public_Invest_Api_Contract_V1_GetLastTradesRequest()
        static let getClosePricesRequest = Tinkoff_Public_Invest_Api_Contract_V1_GetClosePricesRequest()
    }
    
    struct OperationsServiceRequests {
        static let getOperationsRequest = Tinkoff_Public_Invest_Api_Contract_V1_OperationsRequest()
        static let getPortfolioRequest = Tinkoff_Public_Invest_Api_Contract_V1_PortfolioRequest()
        static let getPositionsRequest = Tinkoff_Public_Invest_Api_Contract_V1_PositionsRequest()
        static let getWithdrawLimitsRequest = Tinkoff_Public_Invest_Api_Contract_V1_WithdrawLimitsRequest()
        static let brokerReportRequest = Tinkoff_Public_Invest_Api_Contract_V1_BrokerReportRequest()
        static let divForeignIssuerReportRequest = Tinkoff_Public_Invest_Api_Contract_V1_GetDividendsForeignIssuerRequest()
        static let getOperationsByCursorRequest = Tinkoff_Public_Invest_Api_Contract_V1_GetOperationsByCursorRequest()
    }
    
    struct OrdersServiceRequests {
        static let postOrderRequest = Tinkoff_Public_Invest_Api_Contract_V1_PostOrderRequest()
        static let cancelOrderRequest = Tinkoff_Public_Invest_Api_Contract_V1_CancelOrderRequest()
        static let getOrderStateRequest = Tinkoff_Public_Invest_Api_Contract_V1_GetOrderStateRequest()
        static let getOrdersRequest = Tinkoff_Public_Invest_Api_Contract_V1_GetOrdersRequest()
        static let replaceOrderRequest = Tinkoff_Public_Invest_Api_Contract_V1_ReplaceOrderRequest()
    }
    
    struct StopOrdersServiceRequests {
        static let postStopOrderRequest = Tinkoff_Public_Invest_Api_Contract_V1_PostStopOrderRequest()
        static let getStopOrdersRequest = Tinkoff_Public_Invest_Api_Contract_V1_GetStopOrdersRequest()
        static let cancelStopOrderRequest = Tinkoff_Public_Invest_Api_Contract_V1_CancelStopOrderRequest()
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetMarginAttributesRequest {
    func with(accountId: String) -> Self {
        var request = self
        request.accountID = accountId
        return request
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_CloseSandboxAccountRequest {
    func with(accountId: String) -> Self {
        var request = self
        request.accountID = accountId
        return request
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_SandboxPayInRequest {
    func with(accountId: String, amount: MoneyValue) throws -> Self {
        var request = self
        request.accountID = accountId
        request.amount = try amount.forRequest()
        return request
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_WithdrawLimitsRequest {
    func with(accountId: String) -> Self {
        var request = self
        request.accountID = accountId
        return request
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetCandlesRequest {
    func with(figi: String, from: Date, to: Date, interval: CandleInterval) throws -> Self {
        var request = self
        request.figi = figi
        request.from = SwiftProtobuf.Google_Protobuf_Timestamp(date: from)
        request.to = SwiftProtobuf.Google_Protobuf_Timestamp(date: to)
        request.interval = try Tinkoff_Public_Invest_Api_Contract_V1_CandleInterval(rawValue: interval.rawValue)
            ?? { throw InvestApiError.valueOutOfRange }()
        return request
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetLastPricesRequest {
    func with(figi: [String]) -> Self {
        var request = self
        request.figi = figi
        return request
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetOrderBookRequest {
    func with(figi: String, depth: Int32) -> Self {
        var request = self
        request.figi = figi
        request.depth = depth
        return request
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetTradingStatusRequest {
    func with(figi: String) -> Self {
        var request = self
        request.figi = figi
        return request
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetLastTradesRequest {
    func with(figi: String, from: Date, to: Date) -> Self {
        var request = self
        request.figi = figi
        request.from = SwiftProtobuf.Google_Protobuf_Timestamp(date: from)
        request.to = SwiftProtobuf.Google_Protobuf_Timestamp(date: to)
        return request
    }
}

fileprivate extension Tinkoff_Public_Invest_Api_Contract_V1_InstrumentClosePriceRequest {
    init(figi: String) {
        self.instrumentID = figi
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetClosePricesRequest {
    func with(figi: [String]) -> Self {
        var request = self
        request.instruments = figi.map {
            Tinkoff_Public_Invest_Api_Contract_V1_InstrumentClosePriceRequest(figi: $0)
        }
        return request
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_OperationsRequest {
    func with(accountId id: String, from: Date, to: Date, state: OperationState, figi: String) throws -> Self {
        var request = self
        request.accountID = id
        request.from = SwiftProtobuf.Google_Protobuf_Timestamp(date: from)
        request.to = SwiftProtobuf.Google_Protobuf_Timestamp(date: to)
        request.state = try Tinkoff_Public_Invest_Api_Contract_V1_OperationState(rawValue: state.rawValue)
            ?? { throw InvestApiError.valueOutOfRange }()
        request.figi = figi
        return request
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_PortfolioRequest {
    func with(accountId id: String, currency: CurrencyType) throws -> Self {
        var request = self
        request.accountID = id
        request.currency = try CurrencyRequest(rawValue: currency.rawValue)
            ?? { throw InvestApiError.valueOutOfRange }()
        return request
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_PositionsRequest {
    func with(accountId id: String) -> Self {
        var request = self
        request.accountID = id
        return request
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_BrokerReportRequest {
    func generate(accountId id: String, from: Date, to: Date) -> Self {
        var request = self
        request.generateBrokerReportRequest.accountID = id
        request.generateBrokerReportRequest.from = SwiftProtobuf.Google_Protobuf_Timestamp(date: from)
        request.generateBrokerReportRequest.to = SwiftProtobuf.Google_Protobuf_Timestamp(date: to)
        return request
    }
    
    func get(taskId id: String, page: Int32) -> Self {
        var request = self
        request.getBrokerReportRequest.taskID = id
        request.getBrokerReportRequest.page = page
        return request
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetDividendsForeignIssuerRequest {
    func generate(accountId id: String, from: Date, to: Date) -> Self {
        var request = self
        request.generateDivForeignIssuerReport.accountID = id
        request.generateDivForeignIssuerReport.from = SwiftProtobuf.Google_Protobuf_Timestamp(date: from)
        request.generateDivForeignIssuerReport.to = SwiftProtobuf.Google_Protobuf_Timestamp(date: to)
        return request
    }
    
    func get(taskId id: String, page: Int32) -> Self {
        var request = self
        request.getDivForeignIssuerReport.taskID = id
        request.getDivForeignIssuerReport.page = page
        return request
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetOperationsByCursorRequest {
    func with(
        accountId id: String, instrumentId: String, from: Date, to: Date, cursor: String,
        limit: Int32, types: [OperationType], state: OperationState, withCommissions: Bool,
        withTrades: Bool, withOvernights: Bool
    ) throws -> Self {
        var request = self
        request.accountID = id
        request.instrumentID = instrumentId
        request.from = SwiftProtobuf.Google_Protobuf_Timestamp(date: from)
        request.to = SwiftProtobuf.Google_Protobuf_Timestamp(date: to)
        request.cursor = cursor
        request.limit = limit
        request.operationTypes = try types.map {
            try Tinkoff_Public_Invest_Api_Contract_V1_OperationType(rawValue: $0.rawValue)
                ?? { throw InvestApiError.valueOutOfRange }()
        }
        request.state = try Tinkoff_Public_Invest_Api_Contract_V1_OperationState(rawValue: state.rawValue)
            ?? { throw InvestApiError.valueOutOfRange }()
        request.withoutCommissions = !withCommissions
        request.withoutTrades = !withTrades
        request.withoutOvernights = !withOvernights
        return request
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_PostOrderRequest {
    func with(
        accountId: String, instrumentId: String, orderRequestId: String?,
        type: OrderType, direction: OrderDirection, price: Quotation, quantity: Int64
    ) throws -> Self {
        var request = self
        request.accountID = accountId
        request.instrumentID = instrumentId
        if let orderRequestId = orderRequestId { request.orderID = orderRequestId }
        request.orderType = try Tinkoff_Public_Invest_Api_Contract_V1_OrderType(rawValue: type.rawValue)
            ?? { throw InvestApiError.valueOutOfRange }()
        request.direction = try Tinkoff_Public_Invest_Api_Contract_V1_OrderDirection(rawValue: direction.rawValue)
            ?? { throw InvestApiError.valueOutOfRange }()
        request.price = try price.forRequest()
        request.quantity = quantity
        return request
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_CancelOrderRequest {
    func with(accountId: String, orderId: String) -> Self {
        var request = self
        request.accountID = accountId
        request.orderID = orderId
        return request
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetOrderStateRequest {
    func with(accountId: String, orderId: String) -> Self {
        var request = self
        request.accountID = accountId
        request.orderID = orderId
        return request
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetOrdersRequest {
    func with(accountId: String) -> Self {
        var request = self
        request.accountID = accountId
        return request
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_ReplaceOrderRequest {
    func with(
        accountId: String, orderId: String, orderRequestId: String?,
        price: Quotation, priceType: PriceType, quantity: Int64
    ) throws -> Self {
        var request = self
        request.accountID = accountId
        request.orderID = orderId
        if let orderRequestId = orderRequestId { request.idempotencyKey = orderRequestId }
        request.price = try price.forRequest()
        request.priceType = try Tinkoff_Public_Invest_Api_Contract_V1_PriceType(rawValue: priceType.rawValue)
            ?? { throw InvestApiError.valueOutOfRange }()
        request.quantity = quantity
        return request
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_PostStopOrderRequest {
    func with(
        accountId: String, instrumentId: String, quantity: Int64, price: Quotation,
        stopPrice: Quotation, direction: OrderDirection, stopOrderType: StopOrderType,
        expirationType: StopOrderExpirationType, expireDate: Date
    ) throws -> Self {
        var request = self
        request.accountID = accountId
        request.instrumentID = instrumentId
        request.quantity = quantity
        request.price = try price.forRequest()
        request.stopPrice = try stopPrice.forRequest()
        request.direction = try Tinkoff_Public_Invest_Api_Contract_V1_StopOrderDirection(rawValue: direction.rawValue)
            ?? { throw InvestApiError.valueOutOfRange }()
        request.stopOrderType = try Tinkoff_Public_Invest_Api_Contract_V1_StopOrderType(rawValue: stopOrderType.rawValue)
            ?? { throw InvestApiError.valueOutOfRange }()
        request.expirationType = try Tinkoff_Public_Invest_Api_Contract_V1_StopOrderExpirationType(rawValue: expirationType.rawValue)
            ?? { throw InvestApiError.valueOutOfRange }()
        request.expireDate = SwiftProtobuf.Google_Protobuf_Timestamp(date: expireDate)
        return request
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_GetStopOrdersRequest {
    func with(accountId: String) -> Self {
        var request = self
        request.accountID = accountId
        return request
    }
}

internal extension Tinkoff_Public_Invest_Api_Contract_V1_CancelStopOrderRequest {
    func with(accountId: String, stopOrderId: String) -> Self {
        var request = self
        request.accountID = accountId
        request.stopOrderID = stopOrderId
        return request
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
