import Foundation

public class SandboxApiRequest<Result>: ApiRequest<SandboxApiClient, Result> {
    // MARK: Сервис для работы с песочницей.
    
    /// Экземпляр `SandboxApiRequest` для регистрации счёта в песочнице.
    public static var openSandboxAccount: SandboxApiRequest<String> {
        .init {
            $0.sandbox.openSandboxAccount()
        }
    }
    
    /// Экземпляр `SandboxApiRequest` для получения счетов в песочнице.
    public static var getSandboxAccounts: SandboxApiRequest<[Account]> {
        .init {
            try $0.sandbox.getSandboxAccounts()
        }
    }
    
    /// Возвращает экземпляр `SandboxApiRequest` для закрытия счёта в песочнице.
    ///
    ///  - Parameter accountId: Идентификатор счёта песочницы.
    ///
    ///  - Returns: Экземпляр `SandboxApiRequest`.
    public static func closeSandboxAccount(accountId id: String) -> SandboxApiRequest<Void> {
        .init {
            $0.sandbox.closeSandboxAccount(accountId: id)
        }
    }
    
    /// Возвращает экземпляр `SandboxApiRequest` для выставления заявки в песочнице.
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта песочницы.
    ///     - instrumentId: Идентификатор инструмента (figi инструмента или uid инструмента).
    ///     - orderRequestId: Идентификатор запроса выставления поручения для целей идемпотентности в формате uid (максимальная длина 36 символов).
    ///     - type: Тип заявки.
    ///     - direction: Направление операции.
    ///     - price: Цена за 1 инструмент (игнорируется для рыночных поручений).
    ///     - quantity: Количество лотов.
    ///
    ///  - Returns: Экземпляр `SandboxApiRequest`.
    public static func postSandboxOrder(
        accountId: String, instrumentId: String, orderRequestId: String?,
        type: OrderType, direction: OrderDirection, price: Quotation, quantity: Int64
    ) -> SandboxApiRequest<OrderInfo> {
        .init {
            try $0.sandbox.postSandboxOrder(
                accountId: accountId, instrumentId: instrumentId, orderRequestId: orderRequestId,
                type: type, direction: direction, price: price, quantity: quantity
            )
        }
    }
    
    /// Возвращает экземпляр `SandboxApiRequest` для изменения заявки выставленной в песочнице.
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта песочницы.
    ///     - orderId: Биржевой идентификатор заявки.
    ///     - orderRequestId: Новый идентификатор запроса выставления поручения для целей идемпотентности в формате uid (максимальная длина 36 символов).
    ///     - price: Цена за 1 инструмент.
    ///     - priceType: Тип цены.
    ///     - quantity: Количество лотов.
    ///
    ///  - Returns: Экземпляр `SandboxApiRequest`.
    public static func replaceSandboxOrder(
        accountId: String, orderId: String, orderRequestId: String?,
        price: Quotation, priceType: PriceType, quantity: Int64
    ) -> SandboxApiRequest<OrderInfo> {
        .init {
            try $0.sandbox.replaceSandboxOrder(
                accountId: accountId, orderId: orderId, orderRequestId: orderRequestId,
                price: price, priceType: priceType, quantity: quantity
            )
        }
    }
    
    /// Возвращает экземпляр `SandboxApiRequest` для получения списка активных заявок по счёту песочницы.
    ///
    /// - Parameter accountId: Идентификатор счёта песочницы.
    ///
    ///  - Returns: Экземпляр `SandboxApiRequest`.
    public static func getSandboxOrders(accountId: String) -> SandboxApiRequest<[OrderInfo]> {
        .init {
            try $0.sandbox.getSandboxOrders(accountId: accountId)
        }
    }
    
    /// Возвращает экземпляр `SandboxApiRequest` для отмены заявки выставленной в песочнице.
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта песочницы.
    ///     - orderId: Идентификатор заявки.
    ///
    ///  - Returns: Экземпляр `SandboxApiRequest`.
    public static func cancelSandboxOrder(accountId: String, orderId: String) -> SandboxApiRequest<Date> {
        .init {
            $0.sandbox.cancelSandboxOrder(accountId: accountId, orderId: orderId)
        }
    }
    
    /// Возвращает экземпляр `SandboxApiRequest` для получения статуса заявки в песочнице.
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта песочницы.
    ///     - orderId: Идентификатор заявки.
    ///
    ///  - Returns: Экземпляр `SandboxApiRequest`.
    public static func getSandboxOrderState(accountId: String, orderId: String) -> SandboxApiRequest<OrderInfo> {
        .init {
            try $0.sandbox.getSandboxOrderState(accountId: accountId, orderId: orderId)
        }
    }
    
    /// Возвращает экземпляр `SandboxApiRequest` для получения списка позиций в песочнице.
    ///
    /// - Parameter accountId: Идентификатор счёта песочницы.
    ///
    ///  - Returns: Экземпляр `SandboxApiRequest`.
    public static func getSandboxPositions(accountId: String) -> SandboxApiRequest<PositionsCollection> {
        .init {
            $0.sandbox.getSandboxPositions(accountId: accountId)
        }
    }
    
    /// Возвращает экземпляр `SandboxApiRequest` для получения списка операций по счёту песочницы.
    ///
    /// - Attention: https://tinkoff.github.io/investAPI/operations_problems/
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта песочницы.
    ///     - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///     - to: Окончание запрашиваемого периода в часовом поясе UTC.
    ///     - state: Статус запрашиваемых операций.
    ///     - figi: Figi идентификатор инструмента для фильтрации.
    ///
    ///  - Returns: Экземпляр `SandboxApiRequest`.
    public static func getSandboxOperations(accountId: String, from: Date, to: Date, state: OperationState, figi: String) -> SandboxApiRequest<[Operation]> {
        .init {
            try $0.sandbox.getSandboxOperations(accountId: accountId, from: from, to: to, state: state, figi: figi)
        }
    }
    
    /// Возвращает экземпляр `SandboxApiRequest` для получения списка операций по счёту песочницы с пагинацией.
    ///
    /// - Attention: https://tinkoff.github.io/investAPI/operations_problems/
    ///
    /// - Parameters:
    ///     - accountId: Идентификатор счёта песочницы.
    ///     - instrumentId: Идентификатор инструмента (figi инструмента или uid инструмента).
    ///     - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///     - to: Окончание запрашиваемого периода в часовом поясе UTC.
    ///     - cursor: Идентификатор элемента, с которого формируется начало списка.
    ///     - limit: Лимит количества операций. По умолчанию устанавливается значение 100, максимальное значение 1000.
    ///     - types: Типы операций.
    ///     - state: Статус запрашиваемых операций.
    ///     - withCommissions: Включить комиссии.
    ///     - withTrades: Включить массив сделок.
    ///     - withOvernights: Вкличить overnight операции.
    ///
    ///  - Returns: Экземпляр `SandboxApiRequest`.
    public static func getSandboxOperationsByCursor(
        accountId: String, instrumentId: String, from: Date, to: Date, cursor: String,
        limit: Int32, types: [OperationType], state: OperationState, withCommissions: Bool,
        withTrades: Bool, withOvernights: Bool
    ) -> SandboxApiRequest<OperationsByCursor> {
        .init {
            try $0.sandbox.getSandboxOperationsByCursor(
                accountId: accountId, instrumentId: instrumentId, from: from, to: to, cursor: cursor,
                limit: limit, types: types, state: state, withCommissions: withCommissions,
                withTrades: withTrades, withOvernights: withOvernights
            )
        }
    }
    
    /// Возвращает экземпляр `SandboxApiRequest` для получения портфеля по счёту песочницы.
    ///
    /// - Parameter accountId: Идентификатор счёта песочницы.
    ///
    ///  - Returns: Экземпляр `SandboxApiRequest`.
    public static func getSandboxPortfolio(accountId: String, currency: CurrencyType) -> SandboxApiRequest<Portfolio> {
        .init {
            try $0.sandbox.getSandboxPortfolio(accountId: accountId, currency: currency)
        }
    }
    
    /// Возвращает экземпляр `SandboxApiRequest` для пополнения счёта в песочнице.
    ///
    ///  - Parameters:
    ///      - accountId: Идентификатор счёта песочницы.
    ///      - amount: Сумма пополнения счёта в рублях.
    ///
    ///  - Returns: Экземпляр `SandboxApiRequest`.
    public static func sandboxPayIn(accountId id: String, amount: MoneyValue) -> SandboxApiRequest<MoneyValue> {
        .init {
            try $0.sandbox.sandboxPayIn(accountId: id, amount: amount)
        }
    }
    
    /// Возвращает экземпляр `SandboxApiRequest` для получения доступного остатка для вывода средств в песочнице.
    ///
    ///  - Parameter accountId: Идентификатор счёта песочницы.
    ///
    ///  - Returns: Экземпляр `SandboxApiRequest`.
    public static func getSandboxWithdrawLimits(accountId id: String) -> SandboxApiRequest<WithdrawLimits> {
        .init {
            $0.sandbox.getSandboxWithdrawLimits(accountId: id)
        }
    }
    
    // MARK: Сервис предоставления справочной информации о пользователе.

    /// Экземпляр `SandboxApiRequest` для получения счетов пользователя.
    public static var getAccounts: SandboxApiRequest<[Account]> {
        .init {
            try $0.user.getAccounts()
        }
    }
    
    /// Экземпляр `SandboxApiRequest` для получения лимитов запросов пользователя.
    public static var getUserTariff: SandboxApiRequest<UserTariff> {
        .init {
            try $0.user.getUserTariff()
        }
    }
    
    /// Экземпляр `SandboxApiRequest` для получения информации о статусе пользователя.
    public static var getInfo: SandboxApiRequest<UserInfo> {
        .init {
            try $0.user.getInfo()
        }
    }
    
    // MARK: Сервис получения биржевой информации.
    
    /// Возвращает экземпляр `SandboxApiRequest` для получения исторических свечей по инструменту.
    ///
    ///  - Parameters:
    ///      - figi: Figi идентификатор инструмента.
    ///      - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///      - to: Окончание запрашиваемого периода в часовом поясе UTC.
    ///      - interval: Интервал запрашиваемых свечей.
    ///
    ///  - Returns: Экземпляр `SandboxApiRequest`.
    public static func getCandles(figi: String, from: Date, to: Date, interval: CandleInterval) -> SandboxApiRequest<[HistoricalCandle]> {
        .init {
            try $0.marketData.getCandles(figi: figi, from: from, to: to, interval: interval)
        }
    }
    
    /// Возвращает экземпляр `SandboxApiRequest` для получения последних цен по инструментам.
    ///
    ///  - Parameter figis: Figi идентификаторы инструментов.
    ///
    ///  - Returns: Экземпляр `SandboxApiRequest`.
    public static func getLastPrices(figis: [String]) -> SandboxApiRequest<[LastPrice]> {
        .init {
            try $0.marketData.getLastPrices(figis: figis)
        }
    }
    
    /// Возвращает экземпляр `SandboxApiRequest` для получения стакана по инструменту.
    ///
    ///  - Parameters:
    ///      - figi: Figi идентификатор инструмента.
    ///      - depth: Глубина стакана.
    ///
    ///  - Returns: Экземпляр `SandboxApiRequest`.
    public static func getOrderBook(figi: String, depth: Int32) -> SandboxApiRequest<OrderBookInfo> {
        .init {
            try $0.marketData.getOrderBook(figi: figi, depth: depth)
        }
    }
    
    /// Возвращает экземпляр `SandboxApiRequest` для получения статуса торгов по инструментам.
    ///
    ///  - Parameter figi: Figi идентификатор инструмента.
    ///
    ///  - Returns: Экземпляр `SandboxApiRequest`.
    public static func getTradingStatus(figi: String) -> SandboxApiRequest<TradingStatusInfo> {
        .init {
            try $0.marketData.getTradingStatus(figi: figi)
        }
    }
    
    /// Возвращает экземпляр `SandboxApiRequest` для получения обезличенных сделок за последний час.
    ///
    ///  - Parameters:
    ///      - figi: Figi идентификатор инструмента.
    ///      - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///      - to: Окончание запрашиваемого периода в часовом поясе UTC.
    ///
    ///  - Returns: Экземпляр `SandboxApiRequest`.
    public static func getLastTrades(figi: String, from: Date, to: Date) -> SandboxApiRequest<[Trade]> {
        .init {
            $0.marketData.getLastTrades(figi: figi, from: from, to: to)
        }
    }
    
    /// Возвращает экземпляр `SandboxApiRequest` для получения цен закрытия торговой сессии по инструментам.
    ///
    ///  - Parameter figis: Figi идентификаторы инструментов.
    ///
    ///  - Returns: Экземпляр `SandboxApiRequest`.
    public static func getClosePrices(figis: [String]) -> SandboxApiRequest<[InstrumentClosePrice]> {
        .init {
            try $0.marketData.getClosePrices(figis: figis)
        }
    }
    
    // MARK: Сервис получения справочной информации о ценных бумагах.
    
    /// Возвращает экземпляр `SandboxApiRequest` для получения расписания работы торговых площадок.
    ///
    /// - Parameters:
    ///     - exchange: Наименование биржи или расчетного календаря.
    ///     - from: Начало периода по часовому поясу UTC.
    ///     - to: Окончание периода по часовому поясу UTC.
    ///
    ///  - Returns: Экземпляр `SandboxApiRequest`.
    public static func tradingSchedules(exchange: String, from: Date, to: Date) -> SandboxApiRequest<[TradingSchedule]> {
        .init {
            $0.instruments.tradingSchedules(exchange: exchange, from: from, to: to)
        }
    }

    /// Возвращает экземпляр `SandboxApiRequest` для получения облигации по её идентификатору.
    ///
    /// - Parameters:
    ///     - idType: Тип идентификатора инструмента (возможные значения: figi, ticker).
    ///     - classCode: Идентификатор class_code (обязателен при idType = .ticker).
    ///     - id: Идентификатор запрашиваемого инструмента.
    ///
    ///  - Returns: Экземпляр `SandboxApiRequest`.
    public static func bondBy(idType: InstrumentIdType, classCode: String, id: String) -> SandboxApiRequest<Bond> {
        .init {
            try $0.instruments.bondBy(idType: idType, classCode: classCode, id: id)
        }
    }

    /// Возвращает экземпляр `SandboxApiRequest` для получения списка облигаций.
    ///
    /// - Parameter instrumentStatus: Статус запрашиваемых инструментов.
    ///
    /// - Returns: Экземпляр `SandboxApiRequest`.
    public static func bonds(instrumentStatus: InstrumentStatus) -> SandboxApiRequest<[Bond]> {
        .init {
            try $0.instruments.bonds(instrumentStatus: instrumentStatus)
        }
    }

    /// Возвращает экземпляр `SandboxApiRequest` для получения графика выплат купонов по облигации.
    ///
    /// - Parameters:
    ///     - figi: Figi-идентификатор инструмента.
    ///     - from: Начало запрашиваемого периода в часовом поясе UTC. Фильтрация по couponDate (дата выплаты купона).
    ///     - to: Окончание запрашиваемого периода в часовом поясе UTC. Фильтрация по couponDate (дата выплаты купона).
    ///
    /// - Returns: Экземпляр `SandboxApiRequest`.
    public static func getBondCoupons(figi: String, from: Date, to: Date) -> SandboxApiRequest<[Coupon]> {
        .init {
            try $0.instruments.getBondCoupons(figi: figi, from: from, to: to)
        }
    }

    /// Возвращает экземпляр `SandboxApiRequest` для получения валюты по её идентификатору.
    ///
    /// - Parameters:
    ///     - idType: Тип идентификатора инструмента (возможные значения: figi, ticker).
    ///     - classCode: Идентификатор class_code (обязателен при idType = .ticker).
    ///     - id: Идентификатор запрашиваемого инструмента.
    ///
    /// - Returns: Экземпляр `SandboxApiRequest`.
    public static func currencyBy(idType: InstrumentIdType, classCode: String, id: String) -> SandboxApiRequest<Currency> {
        .init {
            try $0.instruments.currencyBy(idType: idType, classCode: classCode, id: id)
        }
    }

    /// Возвращает экземпляр `SandboxApiRequest` для получения списка валют.
    ///
    /// - Parameter instrumentStatus: Статус запрашиваемых инструментов.
    ///
    /// - Returns: Экземпляр `SandboxApiRequest`.
    public static func currencies(instrumentStatus: InstrumentStatus) -> SandboxApiRequest<[Currency]> {
        .init {
            try $0.instruments.currencies(instrumentStatus: instrumentStatus)
        }
    }

    /// Возвращает экземпляр `SandboxApiRequest` для получения инвестиционного фонда по его идентификатору.
    ///
    /// - Parameters:
    ///     - idType: Тип идентификатора инструмента (возможные значения: figi, ticker).
    ///     - classCode: Идентификатор class_code (обязателен при idType = .ticker).
    ///     - id: Идентификатор запрашиваемого инструмента.
    ///
    /// - Returns: Экземпляр `SandboxApiRequest`.
    public static func etfBy(idType: InstrumentIdType, classCode: String, id: String) -> SandboxApiRequest<Etf> {
        .init {
            try $0.instruments.etfBy(idType: idType, classCode: classCode, id: id)
        }
    }

    /// Возвращает экземпляр `SandboxApiRequest` для получения списка инвестиционных фондов.
    ///
    /// - Parameter instrumentStatus: Статус запрашиваемых инструментов.
    ///
    /// - Returns: Экземпляр `SandboxApiRequest`.
    public static func etfs(instrumentStatus: InstrumentStatus) -> SandboxApiRequest<[Etf]> {
        .init {
            try $0.instruments.etfs(instrumentStatus: instrumentStatus)
        }
    }

    /// Возвращает экземпляр `SandboxApiRequest` для получения фьючерсного контракта по его идентификатору.
    ///
    /// - Parameters:
    ///     - idType: Тип идентификатора инструмента (возможные значения: figi, ticker).
    ///     - classCode: Идентификатор class_code (обязателен при idType = .ticker).
    ///     - id: Идентификатор запрашиваемого инструмента.
    ///
    /// - Returns: Экземпляр `SandboxApiRequest`.
    public static func futureBy(idType: InstrumentIdType, classCode: String, id: String) -> SandboxApiRequest<Future> {
        .init {
            try $0.instruments.futureBy(idType: idType, classCode: classCode, id: id)
        }
    }

    /// Возвращает экземпляр `SandboxApiRequest` для получения списка фьючерсных контрактов.
    ///
    /// - Parameter instrumentStatus: Статус запрашиваемых инструментов.
    ///
    /// - Returns: Экземпляр `SandboxApiRequest`.
    public static func futures(instrumentStatus: InstrumentStatus) -> SandboxApiRequest<[Future]> {
        .init {
            try $0.instruments.futures(instrumentStatus: instrumentStatus)
        }
    }

    /// Возвращает экземпляр `SandboxApiRequest` для получения опционного контракта по его идентификатору.
    ///
    /// - Parameters:
    ///     - idType: Тип идентификатора инструмента (возможные значения: figi, ticker).
    ///     - classCode: Идентификатор class_code (обязателен при idType = .ticker).
    ///     - id: Идентификатор запрашиваемого инструмента.
    ///
    /// - Returns: Экземпляр `SandboxApiRequest`.
    public static func optionBy(idType: InstrumentIdType, classCode: String, id: String) -> SandboxApiRequest<Option> {
        .init {
            try $0.instruments.optionBy(idType: idType, classCode: classCode, id: id)
        }
    }
    
    /// Возвращает экземпляр `SandboxApiRequest` для получения списка опционных контрактов.
    ///
    /// - Parameter instrumentStatus: Статус запрашиваемых инструментов.
    ///
    /// - Returns: Экземпляр `SandboxApiRequest`.
    public static func options(instrumentStatus: InstrumentStatus) -> SandboxApiRequest<[Option]> {
        .init {
            try $0.instruments.options(instrumentStatus: instrumentStatus)
        }
    }
    
    /// Возвращает экземпляр `SandboxApiRequest` для получения списка опционных контрактов.
    ///
    /// - Parameters:
    ///     - basicAssetUid: Идентификатор базового актива опциона (обязательный параметр).
    ///     - basicAssetPositionUid: Идентификатор позиции базового актива опционного контракта.
    ///
    /// - Returns: Экземпляр `SandboxApiRequest`.
    public static func optionsBy(basicAssetUid: String, basicAssetPositionUid: String) -> SandboxApiRequest<[Option]> {
        .init {
            try $0.instruments.optionsBy(basicAssetUid: basicAssetUid, basicAssetPositionUid: basicAssetPositionUid)
        }
    }

    /// Возвращает экземпляр `SandboxApiRequest` для получения акции по её идентификатору.
    ///
    /// - Parameters:
    ///     - idType: Тип идентификатора инструмента (возможные значения: figi, ticker).
    ///     - classCode: Идентификатор class_code (обязателен при idType = .ticker).
    ///     - id: Идентификатор запрашиваемого инструмента.
    ///
    /// - Returns: Экземпляр `SandboxApiRequest`.
    public static func shareBy(idType: InstrumentIdType, classCode: String, id: String) -> SandboxApiRequest<Share> {
        .init {
            try $0.instruments.shareBy(idType: idType, classCode: classCode, id: id)
        }
    }
    
    /// Возвращает экземпляр `SandboxApiRequest` для получения списка акций.
    ///
    /// - Parameter instrumentStatus: Статус запрашиваемых инструментов.
    ///
    /// - Returns: Экземпляр `SandboxApiRequest`.
    public static func shares(instrumentStatus: InstrumentStatus) -> SandboxApiRequest<[Share]> {
        .init {
            try $0.instruments.shares(instrumentStatus: instrumentStatus)
        }
    }

    /// Возвращает экземпляр `SandboxApiRequest` для получения накопленного купонного дохода по облигации.
    ///
    /// - Parameters:
    ///     - figi: Figi-идентификатор инструмента.
    ///     - from: Начало запрашиваемого периода в часовом поясе UTC.
    ///     - to: Окончание запрашиваемого периода в часовом поясе UTC.
    ///
    /// - Returns: Экземпляр `SandboxApiRequest`.
    public static func getAccruedInterests(figi: String, from: Date, to: Date) -> SandboxApiRequest<[AccruedInterest]> {
        .init {
            $0.instruments.getAccruedInterests(figi: figi, from: from, to: to)
        }
    }

    /// Возвращает экземпляр `SandboxApiRequest` для получения размера гарантийного обеспечения по фьючерсному контракту.
    ///
    /// - Parameter figi: Figi-идентификатор инструмента.
    ///
    /// - Returns: Экземпляр `SandboxApiRequest`.
    public static func getFutureContractMargin(figi: String) -> SandboxApiRequest<FutureContractMargin> {
        .init {
            $0.instruments.getFutureContractMargin(figi: figi)
        }
    }

    /// Возвращает экземпляр `SandboxApiRequest` для получения основной информации об инструменте.
    ///
    /// - Parameters:
    ///     - idType: Тип идентификатора инструмента (возможные значения: figi, ticker).
    ///     - classCode: Идентификатор class_code (обязателен при idType = .ticker).
    ///     - id: Идентификатор запрашиваемого инструмента.
    ///
    /// - Returns: Экземпляр `SandboxApiRequest`.
    public static func getInstrumentBy(idType: InstrumentIdType, classCode: String, id: String) -> SandboxApiRequest<Instrument> {
        .init {
            try $0.instruments.getInstrumentBy(idType: idType, classCode: classCode, id: id)
        }
    }
    
    /// Возвращает экземпляр `SandboxApiRequest` для получения событий выплаты дивидендов по инструменту.
    ///
    /// - Parameters:
    ///     - figi: Figi-идентификатор инструмента.
    ///     - from: Начало запрашиваемого периода в часовом поясе UTC (фильтрация происходит по параметру recordDate - дата фиксации реестра).
    ///     - to: Окончание запрашиваемого периода в часовом поясе UTC (фильтрация происходит по параметру recordDate - дата фиксации реестра).
    ///
    /// - Returns: Экземпляр `SandboxApiRequest`.
    public static func getDividends(figi: String, from: Date, to: Date) -> SandboxApiRequest<[Dividend]> {
        .init {
            $0.instruments.getDividends(figi: figi, from: from, to: to)
        }
    }

    /// Возвращает экземпляр `SandboxApiRequest` для получения актива по его идентификатору.
    ///
    /// - Parameter uid: Uid идентификатор актива.
    ///
    /// - Returns: Экземпляр `SandboxApiRequest`.
    public static func getAssetBy(uid: String) -> SandboxApiRequest<AssetFull> {
        .init {
            try $0.instruments.getAssetBy(uid: uid)
        }
    }

    /// Возвращает экземпляр `SandboxApiRequest` для получения списка активов (работает для всех инструментов, за исключением срочных - опционов и фьючерсов).
    ///
    /// - Parameter kind: Вид запрашиваемых инструментов.
    ///
    /// - Returns: Экземпляр `SandboxApiRequest`.
    public static func getAssets(kind: InstrumentKind) -> SandboxApiRequest<[Asset]> {
        .init {
            try $0.instruments.getAssets(kind: kind)
        }
    }

    /// Экземпляр `SandboxApiRequest` для получения списка избранных инструментов.
    public static var getFavorites: SandboxApiRequest<[FavoriteInstrument]> {
        .init {
            try $0.instruments.getFavorites()
        }
    }

    /// Возвращает экземпляр `SandboxApiRequest` для редактирования списка избранных инструментов.
    ///
    /// - Parameters:
    ///     - figis: Список figi идентификаторов инструментов.
    ///     - action: Тип действия со списком.
    ///
    /// - Returns: Экземпляр `SandboxApiRequest`.
    public static func editFavorites(figis: [String], action: FavoriteActionType) -> SandboxApiRequest<[FavoriteInstrument]> {
        .init {
            try $0.instruments.editFavorites(figis: figis, action: action)
        }
    }

    /// Экземпляр `SandboxApiRequest` для получения списка стран.
    public static var getCountries: SandboxApiRequest<[Country]> {
        .init {
            try $0.instruments.getCountries()
        }
    }

    /// Возвращает экземпляр `SandboxApiRequest` для получения инструмента.
    ///
    /// - Parameters:
    ///     - query: Строка поиска.
    ///     - kind: Фильтр по виду инструмента.
    ///     - apiTradeAvailableFlag: Фильтр для отображения только торговых инструментов.
    ///
    /// - Returns: Экземпляр `SandboxApiRequest`.
    public static func findInstrument(query: String, kind: InstrumentKind, apiTradeAvailableFlag: Bool) -> SandboxApiRequest<[InstrumentShort]> {
        .init {
            try $0.instruments.findInstrument(query: query, kind: kind, apiTradeAvailableFlag: apiTradeAvailableFlag)
        }
    }
    
    /// Возвращает экземпляр `SandboxApiRequest` для получения бренда по его идентификатору.
    ///
    /// - Parameter uid: Uid идентификатор бренда.
    ///
    /// - Returns: Экземпляр `SandboxApiRequest`.
    public static func getBrandBy(uid: String) -> SandboxApiRequest<Brand> {
        .init {
            try $0.instruments.getBrandBy(uid: uid)
        }
    }

    /// Экземпляр `SandboxApiRequest` для получения списка брендов.
    public static var getBrands: SandboxApiRequest<[Brand]> {
        .init {
            try $0.instruments.getBrands()
        }
    }
}
