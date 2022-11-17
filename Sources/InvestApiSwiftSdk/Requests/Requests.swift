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
    func with(
        figi: String,
        from: Date,
        to: Date,
        interval: CandleInterval
    ) throws -> Self {
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
    func with(
        figi: String,
        from: Date,
        to: Date
    ) throws -> Self {
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
