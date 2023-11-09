import Foundation

/// Сообщение об обновлении портфеля.
public protocol PortfolioStreamPayload: StreamData where StreamDataType == Portfolio {
    /// Время поступления сообщения.
    var time: Date { get }
    
    /// Тип полезной нагрузки = .data
    var type: StreamPayloadType { get }
    
    /// Полезная нагрузка сообщения.
    var data: Portfolio { get }
}

internal struct PortfolioStreamPayloadModel: PortfolioStreamPayload {
    let time: Date
    
    let type: StreamPayloadType
    
    let data: Portfolio
}

internal extension PortfolioStreamPayloadModel {
    init(response: Tinkoff_Public_Invest_Api_Contract_V1_PortfolioStreamResponse) {
        self.time = Date()
        self.type = .data
        self.data = response.portfolio.toModel()
    }
}
