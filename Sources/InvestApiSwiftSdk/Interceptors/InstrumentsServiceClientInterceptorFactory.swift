import GRPC
import Foundation

public protocol InstrumentsServiceClientInterceptorFactory:
    Tinkoff_Public_Invest_Api_Contract_V1_InstrumentsServiceClientInterceptorFactoryProtocol {}

internal struct InstrumentsServiceInterceptorFactory: InstrumentsServiceClientInterceptorFactory {
    func makeTradingSchedulesInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_TradingSchedulesRequest, Tinkoff_Public_Invest_Api_Contract_V1_TradingSchedulesResponse>] {
        return []
    }

    func makeBondByInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_InstrumentRequest, Tinkoff_Public_Invest_Api_Contract_V1_BondResponse>] {
        return []
    }

    func makeBondsInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_InstrumentsRequest, Tinkoff_Public_Invest_Api_Contract_V1_BondsResponse>] {
        return []
    }

    func makeGetBondCouponsInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_GetBondCouponsRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetBondCouponsResponse>] {
        return []
    }

    func makeCurrencyByInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_InstrumentRequest, Tinkoff_Public_Invest_Api_Contract_V1_CurrencyResponse>] {
        return []
    }

    func makeCurrenciesInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_InstrumentsRequest, Tinkoff_Public_Invest_Api_Contract_V1_CurrenciesResponse>] {
        return []
    }

    func makeEtfByInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_InstrumentRequest, Tinkoff_Public_Invest_Api_Contract_V1_EtfResponse>] {
        return []
    }

    func makeEtfsInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_InstrumentsRequest, Tinkoff_Public_Invest_Api_Contract_V1_EtfsResponse>] {
        return []
    }

    func makeFutureByInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_InstrumentRequest, Tinkoff_Public_Invest_Api_Contract_V1_FutureResponse>] {
        return []
    }

    func makeFuturesInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_InstrumentsRequest, Tinkoff_Public_Invest_Api_Contract_V1_FuturesResponse>] {
        return []
    }

    func makeOptionByInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_InstrumentRequest, Tinkoff_Public_Invest_Api_Contract_V1_OptionResponse>] {
        return []
    }

    func makeOptionsInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_InstrumentsRequest, Tinkoff_Public_Invest_Api_Contract_V1_OptionsResponse>] {
        return []
    }

    func makeShareByInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_InstrumentRequest, Tinkoff_Public_Invest_Api_Contract_V1_ShareResponse>] {
        return []
    }

    func makeSharesInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_InstrumentsRequest, Tinkoff_Public_Invest_Api_Contract_V1_SharesResponse>] {
        return []
    }

    func makeGetAccruedInterestsInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_GetAccruedInterestsRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetAccruedInterestsResponse>] {
        return []
    }

    func makeGetFuturesMarginInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_GetFuturesMarginRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetFuturesMarginResponse>] {
        return []
    }

    func makeGetInstrumentByInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_InstrumentRequest, Tinkoff_Public_Invest_Api_Contract_V1_InstrumentResponse>] {
        return []
    }

    func makeGetDividendsInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_GetDividendsRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetDividendsResponse>] {
        return []
    }

    func makeGetAssetByInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_AssetRequest, Tinkoff_Public_Invest_Api_Contract_V1_AssetResponse>] {
        return []
    }

    func makeGetAssetsInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_AssetsRequest, Tinkoff_Public_Invest_Api_Contract_V1_AssetsResponse>] {
        return []
    }

    func makeGetFavoritesInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_GetFavoritesRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetFavoritesResponse>] {
        return []
    }

    func makeEditFavoritesInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_EditFavoritesRequest, Tinkoff_Public_Invest_Api_Contract_V1_EditFavoritesResponse>] {
        return []
    }

    func makeGetCountriesInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_GetCountriesRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetCountriesResponse>] {
        return []
    }

    func makeFindInstrumentInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_FindInstrumentRequest, Tinkoff_Public_Invest_Api_Contract_V1_FindInstrumentResponse>] {
        return []
    }

    func makeGetBrandsInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_GetBrandsRequest, Tinkoff_Public_Invest_Api_Contract_V1_GetBrandsResponse>] {
        return []
    }

    func makeGetBrandByInterceptors() -> [ClientInterceptor<Tinkoff_Public_Invest_Api_Contract_V1_GetBrandRequest, Tinkoff_Public_Invest_Api_Contract_V1_Brand>] {
        return []
    }
}
