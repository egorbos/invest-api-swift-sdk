/// Тип валюты.
public enum CurrencyType: String, Codable {
    /// Валюта не определена.
    case unspecified
    
    /// Российский рубль.
    case russianRuble = "rub"
    
    /// Доллар США.
    case usDollar = "usd"
    
    /// Евро.
    case euro = "eur"
    
    /// Китайский юань.
    case chineseYuan = "cny"
    
    /// Гонконгский доллар.
    case hkDollar = "hkd"
    
    /// Швейцарский франк.
    case swissFrank = "chf"
    
    /// Фунт стерлингов.
    case poundSterling = "gbp"
    
    /// Японская иена.
    case japaneseYen = "jpy"
    
    /// Турецкая лира.
    case turkishLira = "try"
    
    /// Казахстанский тенге.
    case kazakhstaniTenge = "kzt"
    
    /// Белорусский рубль.
    case belarusianRuble = "byn"
    
    /// Армянский драм.
    case armenianDram = "amd"
    
    /// Узбекский сум.
    case uzbekSum = "uzs"
    
    /// Киргизский сом.
    case kyrgyzstaniSom = "kgs"
    
    /// Таджикский сомони.
    case tajikSomoni = "tjs"
    
    /// Норвежская крона.
    case norwegianKrone = "nok"
    
    /// Шведская крона.
    case swedishKrona = "sek"
}

internal extension CurrencyType {
    func forPortfolioRequest() -> Int {
        switch self {
        case .russianRuble: 0
        case .usDollar: 1
        case .euro: 2
        default: 0
        }
    }
}
