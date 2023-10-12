import Foundation

/// Сообщение об обновлении портфеля.
public struct PortfolioStreamPayload: StreamData {
    public typealias StreamDataType = Portfolio
    
    /// Время поступления сообщения.
    public let time: Date
    
    /// Тип полезной нагрузки = .data
    public let type: StreamPayloadType
    
    /// Полезная нагрузка сообщения.
    public let data: Portfolio
}

internal extension PortfolioStreamPayload {
    init(response: Tinkoff_Public_Invest_Api_Contract_V1_PortfolioStreamResponse) {
        self.time = Date()
        self.type = .data
        self.data = response.portfolio.toModel()
    }
}
