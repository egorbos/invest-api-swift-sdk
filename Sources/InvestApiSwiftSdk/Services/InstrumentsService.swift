import NIOCore
import Foundation

/// Сервис получения справочной информации о ценных бумагах
public protocol InstrumentsService {
    /// Получает расписания работы торговых площадок.
    ///
    /// - Parameters:
    ///
    /// - Returns:
    func TradingSchedules() throws -> Void
    
    - TradingSchedulesRequest
    Запрос расписания торгов.

    Field    Type    Description
    exchange    string    Наименование биржи или расчетного календаря.
    Если не передаётся, возвращается информация по всем доступным торговым площадкам.
    from    google.protobuf.Timestamp    Начало периода по часовому поясу UTC.
    to    google.protobuf.Timestamp    Окончание периода по часовому поясу UTC.
    
    - TradingSchedulesResponse
    Список торговых площадок.

    Field    Type    Description
    exchanges    Массив объектов TradingSchedule    Список торговых площадок и режимов торгов.
    
    - TradingSchedule
    Данные по торговой площадке.

    Field    Type    Description
    exchange    string    Наименование торговой площадки.
    days    Массив объектов TradingDay    Массив с торговыми и неторговыми днями.
    
    - TradingDay
    Информация о времени торгов.

    Field    Type    Description
    date    google.protobuf.Timestamp    Дата.
    is_trading_day    bool    Признак торгового дня на бирже.
    start_time    google.protobuf.Timestamp    Время начала торгов по часовому поясу UTC.
    end_time    google.protobuf.Timestamp    Время окончания торгов по часовому поясу UTC.
    opening_auction_start_time    google.protobuf.Timestamp    Время начала аукциона открытия в часовом поясе UTC.
    closing_auction_end_time    google.protobuf.Timestamp    Время окончания аукциона закрытия в часовом поясе UTC.
    evening_opening_auction_start_time    google.protobuf.Timestamp    Время начала аукциона открытия вечерней сессии в часовом поясе UTC.
    evening_start_time    google.protobuf.Timestamp    Время начала вечерней сессии в часовом поясе UTC.
    evening_end_time    google.protobuf.Timestamp    Время окончания вечерней сессии в часовом поясе UTC.
    clearing_start_time    google.protobuf.Timestamp    Время начала основного клиринга в часовом поясе UTC.
    clearing_end_time    google.protobuf.Timestamp    Время окончания основного клиринга в часовом поясе UTC.
    premarket_start_time    google.protobuf.Timestamp    Время начала премаркета в часовом поясе UTC.
    premarket_end_time    google.protobuf.Timestamp    Время окончания премаркета в часовом поясе UTC.
    closing_auction_start_time    google.protobuf.Timestamp    Время начала аукциона закрытия в часовом поясе UTC.
    opening_auction_end_time    google.protobuf.Timestamp    Время окончания аукциона открытия в часовом поясе UTC.
    
    
    
    /// Получает облигацию по её идентификатору.
    ///
    /// - Parameters:
    ///
    /// - Returns:
    func BondBy() throws -> Void
    
    - InstrumentRequest
    Запрос получения инструмента по идентификатору.

    Field    Type    Description
    id_type    InstrumentIdType    Тип идентификатора инструмента. Возможные значения: figi, ticker. Подробнее об идентификации инструментов: Идентификация инструментов
    class_code    string    Идентификатор class_code. Обязателен при id_type = ticker.
    id    string    Идентификатор запрашиваемого инструмента.
    
    - InstrumentIdType
    Тип идентификатора инструмента. Подробнее об идентификации инструментов: Идентификация инструментов

    Name    Number    Description
    INSTRUMENT_ID_UNSPECIFIED    0    Значение не определено.
    INSTRUMENT_ID_TYPE_FIGI    1    Figi.
    INSTRUMENT_ID_TYPE_TICKER    2    Ticker.
    INSTRUMENT_ID_TYPE_UID    3    Уникальный идентификатор.
    INSTRUMENT_ID_TYPE_POSITION_UID    4    Идентификатор позиции.
    
    - BondResponse
    Информация об облигации.

    Field    Type    Description
    instrument    Bond    Информация об облигации.
    
    - Bond
    Объект передачи информации об облигации.

    Field    Type    Description
    figi    string    Figi-идентификатор инструмента.
    ticker    string    Тикер инструмента.
    class_code    string    Класс-код (секция торгов).
    isin    string    Isin-идентификатор инструмента.
    lot    int32    Лотность инструмента. Возможно совершение операций только на количества ценной бумаги, кратные параметру lot. Подробнее: лот
    currency    string    Валюта расчётов.
    klong    Quotation    Коэффициент ставки риска длинной позиции по клиенту. 2 – клиент со стандартным уровнем риска (КСУР). 1 – клиент с повышенным уровнем риска (КПУР)
    kshort    Quotation    Коэффициент ставки риска короткой позиции по клиенту. 2 – клиент со стандартным уровнем риска (КСУР). 1 – клиент с повышенным уровнем риска (КПУР)
    dlong    Quotation    Ставка риска начальной маржи для КСУР лонг. Подробнее: ставка риска в лонг
    dshort    Quotation    Ставка риска начальной маржи для КСУР шорт. Подробнее: ставка риска в шорт
    dlong_min    Quotation    Ставка риска начальной маржи для КПУР лонг. Подробнее: ставка риска в лонг
    dshort_min    Quotation    Ставка риска начальной маржи для КПУР шорт. Подробнее: ставка риска в шорт
    short_enabled_flag    bool    Признак доступности для операций в шорт.
    name    string    Название инструмента.
    exchange    string    Tорговая площадка (секция биржи).
    coupon_quantity_per_year    int32    Количество выплат по купонам в год.
    maturity_date    google.protobuf.Timestamp    Дата погашения облигации в часовом поясе UTC.
    nominal    MoneyValue    Номинал облигации.
    initial_nominal    MoneyValue    Первоначальный номинал облигации.
    state_reg_date    google.protobuf.Timestamp    Дата выпуска облигации в часовом поясе UTC.
    placement_date    google.protobuf.Timestamp    Дата размещения в часовом поясе UTC.
    placement_price    MoneyValue    Цена размещения.
    aci_value    MoneyValue    Значение НКД (накопленного купонного дохода) на дату.
    country_of_risk    string    Код страны риска, т.е. страны, в которой компания ведёт основной бизнес.
    country_of_risk_name    string    Наименование страны риска, т.е. страны, в которой компания ведёт основной бизнес.
    sector    string    Сектор экономики.
    issue_kind    string    Форма выпуска. Возможные значения:
    documentary — документарная;
    non_documentary — бездокументарная.
    issue_size    int64    Размер выпуска.
    issue_size_plan    int64    Плановый размер выпуска.
    trading_status    SecurityTradingStatus    Текущий режим торгов инструмента.
    otc_flag    bool    Признак внебиржевой ценной бумаги.
    buy_available_flag    bool    Признак доступности для покупки.
    sell_available_flag    bool    Признак доступности для продажи.
    floating_coupon_flag    bool    Признак облигации с плавающим купоном.
    perpetual_flag    bool    Признак бессрочной облигации.
    amortization_flag    bool    Признак облигации с амортизацией долга.
    min_price_increment    Quotation    Шаг цены.
    api_trade_available_flag    bool    Параметр указывает на возможность торговать инструментом через API.
    uid    string    Уникальный идентификатор инструмента.
    real_exchange    RealExchange    Реальная площадка исполнения расчётов. (биржа)
    position_uid    string    Уникальный идентификатор позиции инструмента.
    for_iis_flag    bool    Признак доступности для ИИС.
    for_qual_investor_flag    bool    Флаг отображающий доступность торговли инструментом только для квалифицированных инвесторов.
    weekend_flag    bool    Флаг отображающий доступность торговли инструментом по выходным
    blocked_tca_flag    bool    Флаг заблокированного ТКС
    subordinated_flag    bool    Признак субординированной облигации.
    liquidity_flag    bool    Флаг достаточной ликвидности
    first_1min_candle_date    google.protobuf.Timestamp    Дата первой минутной свечи.
    first_1day_candle_date    google.protobuf.Timestamp    Дата первой дневной свечи.
    risk_level    RiskLevel    Уровень риска.
    
    
    
    /// Получает список облигаций.
    ///
    /// - Parameters:
    ///
    /// - Returns:
    func Bonds() throws -> Void
    
    - InstrumentsRequest
    Запрос получения инструментов.

    Field    Type    Description
    instrument_status    InstrumentStatus    Статус запрашиваемых инструментов. Возможные значения: InstrumentStatus
    
    - InstrumentStatus
    Статус запрашиваемых инструментов.

    Name    Number    Description
    INSTRUMENT_STATUS_UNSPECIFIED    0    Значение не определено.
    INSTRUMENT_STATUS_BASE    1    Базовый список инструментов (по умолчанию). Инструменты доступные для торговли через TINKOFF INVEST API. Cейчас списки бумаг, доступных из api и других интерфейсах совпадают (за исключением внебиржевых бумаг), но в будущем возможны ситуации, когда списки инструментов будут отличаться
    INSTRUMENT_STATUS_ALL    2    Список всех инструментов.
    
    - BondsResponse
    Список облигаций.

    Field    Type    Description
    instruments    Массив объектов Bond    Массив облигаций.
    
    
    
    
    /// Получает график выплат купонов по облигации.
    ///
    /// - Parameters:
    ///
    /// - Returns:
    func GetBondCoupons() throws -> Void
    
    - GetBondCouponsRequest
    Запрос купонов по облигации.

    Field    Type    Description
    figi    string    Figi-идентификатор инструмента.
    from    google.protobuf.Timestamp    Начало запрашиваемого периода в часовом поясе UTC. Фильтрация по coupon_date (дата выплаты купона)
    to    google.protobuf.Timestamp    Окончание запрашиваемого периода в часовом поясе UTC. Фильтрация по coupon_date (дата выплаты купона)
    
    - GetBondCouponsResponse
    Купоны по облигации.

    Field    Type    Description
    events    Массив объектов Coupon
    
    - Coupon
    Объект передачи информации о купоне облигации.

    Field    Type    Description
    figi    string    Figi-идентификатор инструмента.
    coupon_date    google.protobuf.Timestamp    Дата выплаты купона.
    coupon_number    int64    Номер купона.
    fix_date    google.protobuf.Timestamp    (Опционально) Дата фиксации реестра для выплаты купона.
    pay_one_bond    MoneyValue    Выплата на одну облигацию.
    coupon_type    CouponType    Тип купона.
    coupon_start_date    google.protobuf.Timestamp    Начало купонного периода.
    coupon_end_date    google.protobuf.Timestamp    Окончание купонного периода.
    coupon_period    int32    Купонный период в днях.
    
    
    
    /// Получает валюту по её идентификатору.
    ///
    /// - Parameters:
    ///
    /// - Returns:
    func CurrencyBy() throws -> Void
    
    - InstrumentRequest
    Запрос получения инструмента по идентификатору.

    Field    Type    Description
    id_type    InstrumentIdType    Тип идентификатора инструмента. Возможные значения: figi, ticker. Подробнее об идентификации инструментов: Идентификация инструментов
    class_code    string    Идентификатор class_code. Обязателен при id_type = ticker.
    id    string    Идентификатор запрашиваемого инструмента.
    
    - CurrencyResponse
    Данные по валюте.

    Field    Type    Description
    instrument    Currency    Информация о валюте.
    
    - Currency
    Объект передачи информации о валюте.

    Field    Type    Description
    figi    string    Figi-идентификатор инструмента.
    ticker    string    Тикер инструмента.
    class_code    string    Класс-код (секция торгов).
    isin    string    Isin-идентификатор инструмента.
    lot    int32    Лотность инструмента. Возможно совершение операций только на количества ценной бумаги, кратные параметру lot. Подробнее: лот
    currency    string    Валюта расчётов.
    klong    Quotation    Коэффициент ставки риска длинной позиции по клиенту. 2 – клиент со стандартным уровнем риска (КСУР). 1 – клиент с повышенным уровнем риска (КПУР)
    kshort    Quotation    Коэффициент ставки риска короткой позиции по клиенту. 2 – клиент со стандартным уровнем риска (КСУР). 1 – клиент с повышенным уровнем риска (КПУР)
    dlong    Quotation    Ставка риска начальной маржи для КСУР лонг.Подробнее: ставка риска в лонг
    dshort    Quotation    Ставка риска начальной маржи для КСУР шорт. Подробнее: ставка риска в шорт
    dlong_min    Quotation    Ставка риска начальной маржи для КПУР лонг. Подробнее: ставка риска в лонг
    dshort_min    Quotation    Ставка риска начальной маржи для КПУР шорт. Подробнее: ставка риска в шорт
    short_enabled_flag    bool    Признак доступности для операций в шорт.
    name    string    Название инструмента.
    exchange    string    Tорговая площадка (секция биржи)
    nominal    MoneyValue    Номинал.
    country_of_risk    string    Код страны риска, т.е. страны, в которой компания ведёт основной бизнес.
    country_of_risk_name    string    Наименование страны риска, т.е. страны, в которой компания ведёт основной бизнес.
    trading_status    SecurityTradingStatus    Текущий режим торгов инструмента.
    otc_flag    bool    Признак внебиржевой ценной бумаги.
    buy_available_flag    bool    Признак доступности для покупки.
    sell_available_flag    bool    Признак доступности для продажи.
    iso_currency_name    string    Строковый ISO-код валюты.
    min_price_increment    Quotation    Шаг цены.
    api_trade_available_flag    bool    Параметр указывает на возможность торговать инструментом через API.
    uid    string    Уникальный идентификатор инструмента.
    real_exchange    RealExchange    Реальная площадка исполнения расчётов (биржа).
    position_uid    string    Уникальный идентификатор позиции инструмента.
    for_iis_flag    bool    Признак доступности для ИИС.
    for_qual_investor_flag    bool    Флаг отображающий доступность торговли инструментом только для квалифицированных инвесторов.
    weekend_flag    bool    Флаг отображающий доступность торговли инструментом по выходным.
    blocked_tca_flag    bool    Флаг заблокированного ТКС.
    first_1min_candle_date    google.protobuf.Timestamp    Дата первой минутной свечи.
    first_1day_candle_date    google.protobuf.Timestamp    Дата первой дневной свечи.
    
    
    
    /// Получает список валют.
    ///
    /// - Parameters:
    ///
    /// - Returns:
    func Currencies() throws -> Void
    
    - InstrumentsRequest
    Запрос получения инструментов.

    Field    Type    Description
    instrument_status    InstrumentStatus    Статус запрашиваемых инструментов. Возможные значения: InstrumentStatus
    
    - CurrenciesResponse
    Данные по валютам.

    Field    Type    Description
    instruments    Массив объектов Currency    Массив валют.
    
    
    
    /// Получает инвестиционный фонд по его идентификатору.
    ///
    /// - Parameters:
    ///
    /// - Returns:
    func EtfBy() throws -> Void
    
    - InstrumentRequest
    Запрос получения инструмента по идентификатору.

    Field    Type    Description
    id_type    InstrumentIdType    Тип идентификатора инструмента. Возможные значения: figi, ticker. Подробнее об идентификации инструментов: Идентификация инструментов
    class_code    string    Идентификатор class_code. Обязателен при id_type = ticker.
    id    string    Идентификатор запрашиваемого инструмента.
    
    - EtfResponse
    Данные по фонду.

    Field    Type    Description
    instrument    Etf    Информация о фонде.
    
    - Etf
    Объект передачи информации об инвестиционном фонде.

    Field    Type    Description
    figi    string    Figi-идентификатор инструмента.
    ticker    string    Тикер инструмента.
    class_code    string    Класс-код (секция торгов).
    isin    string    Isin-идентификатор инструмента.
    lot    int32    Лотность инструмента. Возможно совершение операций только на количества ценной бумаги, кратные параметру lot. Подробнее: лот
    currency    string    Валюта расчётов.
    klong    Quotation    Коэффициент ставки риска длинной позиции по клиенту. 2 – клиент со стандартным уровнем риска (КСУР). 1 – клиент с повышенным уровнем риска (КПУР)
    kshort    Quotation    Коэффициент ставки риска короткой позиции по клиенту. 2 – клиент со стандартным уровнем риска (КСУР). 1 – клиент с повышенным уровнем риска (КПУР)
    dlong    Quotation    Ставка риска начальной маржи для КСУР лонг.Подробнее: ставка риска в лонг
    dshort    Quotation    Ставка риска начальной маржи для КСУР шорт. Подробнее: ставка риска в шорт
    dlong_min    Quotation    Ставка риска начальной маржи для КПУР лонг. Подробнее: ставка риска в лонг
    dshort_min    Quotation    Ставка риска начальной маржи для КПУР шорт. Подробнее: ставка риска в шорт
    short_enabled_flag    bool    Признак доступности для операций в шорт.
    name    string    Название инструмента.
    exchange    string    Tорговая площадка (секция биржи).
    fixed_commission    Quotation    Размер фиксированной комиссии фонда.
    focus_type    string    Возможные значения:
    equity — акции;
    fixed_income — облигации;
    mixed_allocation — смешанный;
    money_market — денежный рынок;
    real_estate — недвижимость;
    commodity — товары;
    specialty — специальный;
    private_equity — private equity;
    alternative_investment — альтернативные инвестиции.
    released_date    google.protobuf.Timestamp    Дата выпуска в часовом поясе UTC.
    num_shares    Quotation    Количество акций фонда в обращении.
    country_of_risk    string    Код страны риска, т.е. страны, в которой компания ведёт основной бизнес.
    country_of_risk_name    string    Наименование страны риска, т.е. страны, в которой компания ведёт основной бизнес.
    sector    string    Сектор экономики.
    rebalancing_freq    string    Частота ребалансировки.
    trading_status    SecurityTradingStatus    Текущий режим торгов инструмента.
    otc_flag    bool    Признак внебиржевой ценной бумаги.
    buy_available_flag    bool    Признак доступности для покупки.
    sell_available_flag    bool    Признак доступности для продажи.
    min_price_increment    Quotation    Шаг цены.
    api_trade_available_flag    bool    Параметр указывает на возможность торговать инструментом через API.
    uid    string    Уникальный идентификатор инструмента.
    real_exchange    RealExchange    Реальная площадка исполнения расчётов (биржа).
    position_uid    string    Уникальный идентификатор позиции инструмента.
    for_iis_flag    bool    Признак доступности для ИИС.
    for_qual_investor_flag    bool    Флаг отображающий доступность торговли инструментом только для квалифицированных инвесторов.
    weekend_flag    bool    Флаг отображающий доступность торговли инструментом по выходным.
    blocked_tca_flag    bool    Флаг заблокированного ТКС.
    liquidity_flag    bool    Флаг достаточной ликвидности
    first_1min_candle_date    google.protobuf.Timestamp    Дата первой минутной свечи.
    first_1day_candle_date    google.protobuf.Timestamp    Дата первой дневной свечи.
    
    
    
    /// Получает список инвестиционных фондов.
    ///
    /// - Parameters:
    ///
    /// - Returns:
    func Etfs() throws -> Void
    
    - InstrumentsRequest
    Запрос получения инструментов.

    Field    Type    Description
    instrument_status    InstrumentStatus    Статус запрашиваемых инструментов. Возможные значения: InstrumentStatus
    
    - EtfsResponse
    Данные по фондам.

    Field    Type    Description
    instruments    Массив объектов Etf    Массив фондов.
    
    
    
    /// Получает фьючерс по его идентификатору.
    ///
    /// - Parameters:
    ///
    /// - Returns:
    func FutureBy() throws -> Void
    
    - InstrumentRequest
    Запрос получения инструмента по идентификатору.

    Field    Type    Description
    id_type    InstrumentIdType    Тип идентификатора инструмента. Возможные значения: figi, ticker. Подробнее об идентификации инструментов: Идентификация инструментов
    class_code    string    Идентификатор class_code. Обязателен при id_type = ticker.
    id    string    Идентификатор запрашиваемого инструмента.
    
    - FutureResponse
    Данные по фьючерсу.

    Field    Type    Description
    instrument    Future    Информация о фьючерсу.
    
    - Future
    Объект передачи информации о фьючерсе.

    Field    Type    Description
    figi    string    Figi-идентификатор инструмента.
    ticker    string    Тикер инструмента.
    class_code    string    Класс-код (секция торгов).
    lot    int32    Лотность инструмента. Возможно совершение операций только на количества ценной бумаги, кратные параметру lot. Подробнее: лот
    currency    string    Валюта расчётов.
    klong    Quotation    Коэффициент ставки риска длинной позиции по клиенту. 2 – клиент со стандартным уровнем риска (КСУР). 1 – клиент с повышенным уровнем риска (КПУР)
    kshort    Quotation    Коэффициент ставки риска короткой позиции по клиенту. 2 – клиент со стандартным уровнем риска (КСУР). 1 – клиент с повышенным уровнем риска (КПУР)
    dlong    Quotation    Ставка риска начальной маржи для КСУР лонг.Подробнее: ставка риска в лонг
    dshort    Quotation    Ставка риска начальной маржи для КСУР шорт. Подробнее: ставка риска в шорт
    dlong_min    Quotation    Ставка риска начальной маржи для КПУР лонг. Подробнее: ставка риска в лонг
    dshort_min    Quotation    Ставка риска начальной маржи для КПУР шорт. Подробнее: ставка риска в шорт
    short_enabled_flag    bool    Признак доступности для операций шорт.
    name    string    Название инструмента.
    exchange    string    Tорговая площадка (секция биржи).
    first_trade_date    google.protobuf.Timestamp    Дата начала обращения контракта в часовом поясе UTC.
    last_trade_date    google.protobuf.Timestamp    Дата в часовом поясе UTC, до которой возможно проведение операций с фьючерсом.
    futures_type    string    Тип фьючерса. Возможные значения:
    physical_delivery — физические поставки;
    cash_settlement — денежный эквивалент.
    asset_type    string    Тип актива. Возможные значения:
    commodity — товар;
    currency — валюта;
    security — ценная бумага;
    index — индекс.
    basic_asset    string    Основной актив.
    basic_asset_size    Quotation    Размер основного актива.
    country_of_risk    string    Код страны риска, т.е. страны, в которой компания ведёт основной бизнес.
    country_of_risk_name    string    Наименование страны риска, т.е. страны, в которой компания ведёт основной бизнес.
    sector    string    Сектор экономики.
    expiration_date    google.protobuf.Timestamp    Дата истечения срока в часов поясе UTC.
    trading_status    SecurityTradingStatus    Текущий режим торгов инструмента.
    otc_flag    bool    Признак внебиржевой ценной бумаги.
    buy_available_flag    bool    Признак доступности для покупки.
    sell_available_flag    bool    Признак доступности для продажи.
    min_price_increment    Quotation    Шаг цены.
    api_trade_available_flag    bool    Параметр указывает на возможность торговать инструментом через API.
    uid    string    Уникальный идентификатор инструмента.
    real_exchange    RealExchange    Реальная площадка исполнения расчётов (биржа).
    position_uid    string    Уникальный идентификатор позиции инструмента.
    basic_asset_position_uid    string    Уникальный идентификатор позиции основного инструмента.
    for_iis_flag    bool    Признак доступности для ИИС.
    for_qual_investor_flag    bool    Флаг отображающий доступность торговли инструментом только для квалифицированных инвесторов.
    weekend_flag    bool    Флаг отображающий доступность торговли инструментом по выходным.
    blocked_tca_flag    bool    Флаг заблокированного ТКС.
    first_1min_candle_date    google.protobuf.Timestamp    Дата первой минутной свечи.
    first_1day_candle_date    google.protobuf.Timestamp    Дата первой дневной свечи.
    
    
    
    /// Получает список фьючерсов.
    ///
    /// - Parameters:
    ///
    /// - Returns:
    func Futures() throws -> Void
    
    - InstrumentsRequest
    Запрос получения инструментов.

    Field    Type    Description
    instrument_status    InstrumentStatus    Статус запрашиваемых инструментов. Возможные значения: InstrumentStatus
    
    - FuturesResponse
    Данные по фьючерсам.

    Field    Type    Description
    instruments    Массив объектов Future    Массив фьючерсов.
    
    - Future
    Объект передачи информации о фьючерсе.

    Field    Type    Description
    figi    string    Figi-идентификатор инструмента.
    ticker    string    Тикер инструмента.
    class_code    string    Класс-код (секция торгов).
    lot    int32    Лотность инструмента. Возможно совершение операций только на количества ценной бумаги, кратные параметру lot. Подробнее: лот
    currency    string    Валюта расчётов.
    klong    Quotation    Коэффициент ставки риска длинной позиции по клиенту. 2 – клиент со стандартным уровнем риска (КСУР). 1 – клиент с повышенным уровнем риска (КПУР)
    kshort    Quotation    Коэффициент ставки риска короткой позиции по клиенту. 2 – клиент со стандартным уровнем риска (КСУР). 1 – клиент с повышенным уровнем риска (КПУР)
    dlong    Quotation    Ставка риска начальной маржи для КСУР лонг.Подробнее: ставка риска в лонг
    dshort    Quotation    Ставка риска начальной маржи для КСУР шорт. Подробнее: ставка риска в шорт
    dlong_min    Quotation    Ставка риска начальной маржи для КПУР лонг. Подробнее: ставка риска в лонг
    dshort_min    Quotation    Ставка риска начальной маржи для КПУР шорт. Подробнее: ставка риска в шорт
    short_enabled_flag    bool    Признак доступности для операций шорт.
    name    string    Название инструмента.
    exchange    string    Tорговая площадка (секция биржи).
    first_trade_date    google.protobuf.Timestamp    Дата начала обращения контракта в часовом поясе UTC.
    last_trade_date    google.protobuf.Timestamp    Дата в часовом поясе UTC, до которой возможно проведение операций с фьючерсом.
    futures_type    string    Тип фьючерса. Возможные значения:
    physical_delivery — физические поставки;
    cash_settlement — денежный эквивалент.
    asset_type    string    Тип актива. Возможные значения:
    commodity — товар;
    currency — валюта;
    security — ценная бумага;
    index — индекс.
    basic_asset    string    Основной актив.
    basic_asset_size    Quotation    Размер основного актива.
    country_of_risk    string    Код страны риска, т.е. страны, в которой компания ведёт основной бизнес.
    country_of_risk_name    string    Наименование страны риска, т.е. страны, в которой компания ведёт основной бизнес.
    sector    string    Сектор экономики.
    expiration_date    google.protobuf.Timestamp    Дата истечения срока в часов поясе UTC.
    trading_status    SecurityTradingStatus    Текущий режим торгов инструмента.
    otc_flag    bool    Признак внебиржевой ценной бумаги.
    buy_available_flag    bool    Признак доступности для покупки.
    sell_available_flag    bool    Признак доступности для продажи.
    min_price_increment    Quotation    Шаг цены.
    api_trade_available_flag    bool    Параметр указывает на возможность торговать инструментом через API.
    uid    string    Уникальный идентификатор инструмента.
    real_exchange    RealExchange    Реальная площадка исполнения расчётов (биржа).
    position_uid    string    Уникальный идентификатор позиции инструмента.
    basic_asset_position_uid    string    Уникальный идентификатор позиции основного инструмента.
    for_iis_flag    bool    Признак доступности для ИИС.
    for_qual_investor_flag    bool    Флаг отображающий доступность торговли инструментом только для квалифицированных инвесторов.
    weekend_flag    bool    Флаг отображающий доступность торговли инструментом по выходным.
    blocked_tca_flag    bool    Флаг заблокированного ТКС.
    first_1min_candle_date    google.protobuf.Timestamp    Дата первой минутной свечи.
    first_1day_candle_date    google.protobuf.Timestamp    Дата первой дневной свечи.
    
    
    
    /// Получает опцион по его идентификатору.
    ///
    /// - Parameters:
    ///
    /// - Returns:
    func OptionBy() throws -> Void
    
    - InstrumentRequest
    Запрос получения инструмента по идентификатору.

    Field    Type    Description
    id_type    InstrumentIdType    Тип идентификатора инструмента. Возможные значения: figi, ticker. Подробнее об идентификации инструментов: Идентификация инструментов
    class_code    string    Идентификатор class_code. Обязателен при id_type = ticker.
    id    string    Идентификатор запрашиваемого инструмента.
    
    - OptionResponse
    Данные по опциону.

    Field    Type    Description
    instrument    Option    Информация по опциону.
    
    - Option
    Опцион.

    Field    Type    Description
    uid    string    Уникальный идентификатор инструмента.
    position_uid    string    Уникальный идентификатор позиции.
    ticker    string    Тикер инструмента.
    class_code    string    Класс-код.
    basic_asset_position_uid    string    Уникальный идентификатор позиции основного инструмента.
    trading_status    SecurityTradingStatus    Текущий режим торгов инструмента.
    real_exchange    RealExchange    Реальная площадка исполнения расчётов (биржа). Допустимые значения: [REAL_EXCHANGE_MOEX, REAL_EXCHANGE_RTS]
    direction    OptionDirection    Направление опциона.
    payment_type    OptionPaymentType    Тип расчетов по опциону.
    style    OptionStyle    Стиль опциона.
    settlement_type    OptionSettlementType    Способ исполнения опциона.
    name    string    Название инструмента.
    currency    string    Валюта.
    settlement_currency    string    Валюта, в которой оценивается контракт.
    asset_type    string    Тип актива.
    basic_asset    string    Основной актив.
    exchange    string    Tорговая площадка (секция биржи).
    country_of_risk    string    Код страны рисков.
    country_of_risk_name    string    Наименование страны рисков.
    sector    string    Сектор экономики.
    lot    int32    Количество бумаг в лоте.
    basic_asset_size    Quotation    Размер основного актива.
    klong    Quotation    Коэффициент ставки риска длинной позиции по клиенту. 2 – клиент со стандартным уровнем риска (КСУР). 1 – клиент с повышенным уровнем риска (КПУР)
    kshort    Quotation    Коэффициент ставки риска короткой позиции по клиенту. 2 – клиент со стандартным уровнем риска (КСУР). 1 – клиент с повышенным уровнем риска (КПУР)
    dlong    Quotation    Ставка риска начальной маржи для КСУР лонг. Подробнее: ставка риска в лонг
    dshort    Quotation    Ставка риска начальной маржи для КСУР шорт. Подробнее: ставка риска в шорт
    dlong_min    Quotation    Ставка риска начальной маржи для КПУР лонг. Подробнее: ставка риска в лонг
    dshort_min    Quotation    Ставка риска начальной маржи для КПУР шорт. Подробнее: ставка риска в шорт
    min_price_increment    Quotation    Минимальный шаг цены.
    strike_price    MoneyValue    Цена страйка.
    expiration_date    google.protobuf.Timestamp    Дата истечения срока в формате UTC.
    first_trade_date    google.protobuf.Timestamp    Дата начала обращения контракта в формате UTC.
    last_trade_date    google.protobuf.Timestamp    Дата исполнения в формате UTC.
    first_1min_candle_date    google.protobuf.Timestamp    Дата первой минутной свечи в формате UTC.
    first_1day_candle_date    google.protobuf.Timestamp    Дата первой дневной свечи в формате UTC.
    short_enabled_flag    bool    Признак доступности для операций шорт.
    for_iis_flag    bool    Возможность покупки/продажи на ИИС.
    otc_flag    bool    Признак внебиржевой ценной бумаги.
    buy_available_flag    bool    Признак доступности для покупки.
    sell_available_flag    bool    Признак доступности для продажи.
    for_qual_investor_flag    bool    Флаг отображающий доступность торговли инструментом только для квалифицированных инвесторов.
    weekend_flag    bool    Флаг отображающий доступность торговли инструментом по выходным.
    blocked_tca_flag    bool    Флаг заблокированного ТКС.
    api_trade_available_flag    bool    Параметр указывает на возможность торговать инструментом через API.
    
    
    
    /// Получает список опционов.
    ///
    /// - Parameters:
    ///
    /// - Returns:
    func OptionsBy() throws -> Void
    
    - FilterOptionsRequest
    Параметры фильтрации опционов

    Field    Type    Description
    basic_asset_uid    string    Идентификатор базового актива опциона. Обязательный параметр.
    basic_asset_position_uid    string    Идентификатор позиции базового актива опциона
    
    - OptionsResponse
    Данные по опционам.

    Field    Type    Description
    instruments    Массив объектов Option    Массив данных по опциону.

    
    
    /// Получает акцию по его идентификатору.
    ///
    /// - Parameters:
    ///
    /// - Returns:
    func ShareBy() throws -> Void
    
    - InstrumentRequest
    Запрос получения инструмента по идентификатору.

    Field    Type    Description
    id_type    InstrumentIdType    Тип идентификатора инструмента. Возможные значения: figi, ticker. Подробнее об идентификации инструментов: Идентификация инструментов
    class_code    string    Идентификатор class_code. Обязателен при id_type = ticker.
    id    string    Идентификатор запрашиваемого инструмента.
    
    - ShareResponse
    Данные по акции.

    Field    Type    Description
    instrument    Share    Информация об акции.
    
    - Share
    Объект передачи информации об акции.

    Field    Type    Description
    figi    string    Figi-идентификатор инструмента.
    ticker    string    Тикер инструмента.
    class_code    string    Класс-код (секция торгов).
    isin    string    Isin-идентификатор инструмента.
    lot    int32    Лотность инструмента. Возможно совершение операций только на количества ценной бумаги, кратные параметру lot. Подробнее: лот
    currency    string    Валюта расчётов.
    klong    Quotation    Коэффициент ставки риска длинной позиции по клиенту. 2 – клиент со стандартным уровнем риска (КСУР). 1 – клиент с повышенным уровнем риска (КПУР)
    kshort    Quotation    Коэффициент ставки риска короткой позиции по клиенту. 2 – клиент со стандартным уровнем риска (КСУР). 1 – клиент с повышенным уровнем риска (КПУР)
    dlong    Quotation    Ставка риска начальной маржи для КСУР лонг.Подробнее: ставка риска в лонг
    dshort    Quotation    Ставка риска начальной маржи для КСУР шорт. Подробнее: ставка риска в шорт
    dlong_min    Quotation    Ставка риска начальной маржи для КПУР лонг. Подробнее: ставка риска в лонг
    dshort_min    Quotation    Ставка риска начальной маржи для КПУР шорт. Подробнее: ставка риска в шорт
    short_enabled_flag    bool    Признак доступности для операций в шорт.
    name    string    Название инструмента.
    exchange    string    Tорговая площадка (секция биржи).
    ipo_date    google.protobuf.Timestamp    Дата IPO акции в часовом поясе UTC.
    issue_size    int64    Размер выпуска.
    country_of_risk    string    Код страны риска, т.е. страны, в которой компания ведёт основной бизнес.
    country_of_risk_name    string    Наименование страны риска, т.е. страны, в которой компания ведёт основной бизнес.
    sector    string    Сектор экономики.
    issue_size_plan    int64    Плановый размер выпуска.
    nominal    MoneyValue    Номинал.
    trading_status    SecurityTradingStatus    Текущий режим торгов инструмента.
    otc_flag    bool    Признак внебиржевой ценной бумаги.
    buy_available_flag    bool    Признак доступности для покупки.
    sell_available_flag    bool    Признак доступности для продажи.
    div_yield_flag    bool    Признак наличия дивидендной доходности.
    share_type    ShareType    Тип акции. Возможные значения: ShareType
    min_price_increment    Quotation    Шаг цены.
    api_trade_available_flag    bool    Параметр указывает на возможность торговать инструментом через API.
    uid    string    Уникальный идентификатор инструмента.
    real_exchange    RealExchange    Реальная площадка исполнения расчётов (биржа).
    position_uid    string    Уникальный идентификатор позиции инструмента.
    for_iis_flag    bool    Признак доступности для ИИС.
    for_qual_investor_flag    bool    Флаг отображающий доступность торговли инструментом только для квалифицированных инвесторов.
    weekend_flag    bool    Флаг отображающий доступность торговли инструментом по выходным
    blocked_tca_flag    bool    Флаг заблокированного ТКС
    liquidity_flag    bool    Флаг достаточной ликвидности
    first_1min_candle_date    google.protobuf.Timestamp    Дата первой минутной свечи.
    first_1day_candle_date    google.protobuf.Timestamp    Дата первой дневной свечи.
    
    
    
    /// Получает список акций.
    ///
    /// - Parameters:
    ///
    /// - Returns:
    func Shares() throws -> Void
    
    - InstrumentsRequest
    Запрос получения инструментов.

    Field    Type    Description
    instrument_status    InstrumentStatus    Статус запрашиваемых инструментов. Возможные значения: InstrumentStatus
    
    - SharesResponse
    Данные по акциям.

    Field    Type    Description
    instruments    Массив объектов Share    Массив акций.
    
    - Share
    Объект передачи информации об акции.

    Field    Type    Description
    figi    string    Figi-идентификатор инструмента.
    ticker    string    Тикер инструмента.
    class_code    string    Класс-код (секция торгов).
    isin    string    Isin-идентификатор инструмента.
    lot    int32    Лотность инструмента. Возможно совершение операций только на количества ценной бумаги, кратные параметру lot. Подробнее: лот
    currency    string    Валюта расчётов.
    klong    Quotation    Коэффициент ставки риска длинной позиции по клиенту. 2 – клиент со стандартным уровнем риска (КСУР). 1 – клиент с повышенным уровнем риска (КПУР)
    kshort    Quotation    Коэффициент ставки риска короткой позиции по клиенту. 2 – клиент со стандартным уровнем риска (КСУР). 1 – клиент с повышенным уровнем риска (КПУР)
    dlong    Quotation    Ставка риска начальной маржи для КСУР лонг.Подробнее: ставка риска в лонг
    dshort    Quotation    Ставка риска начальной маржи для КСУР шорт. Подробнее: ставка риска в шорт
    dlong_min    Quotation    Ставка риска начальной маржи для КПУР лонг. Подробнее: ставка риска в лонг
    dshort_min    Quotation    Ставка риска начальной маржи для КПУР шорт. Подробнее: ставка риска в шорт
    short_enabled_flag    bool    Признак доступности для операций в шорт.
    name    string    Название инструмента.
    exchange    string    Tорговая площадка (секция биржи).
    ipo_date    google.protobuf.Timestamp    Дата IPO акции в часовом поясе UTC.
    issue_size    int64    Размер выпуска.
    country_of_risk    string    Код страны риска, т.е. страны, в которой компания ведёт основной бизнес.
    country_of_risk_name    string    Наименование страны риска, т.е. страны, в которой компания ведёт основной бизнес.
    sector    string    Сектор экономики.
    issue_size_plan    int64    Плановый размер выпуска.
    nominal    MoneyValue    Номинал.
    trading_status    SecurityTradingStatus    Текущий режим торгов инструмента.
    otc_flag    bool    Признак внебиржевой ценной бумаги.
    buy_available_flag    bool    Признак доступности для покупки.
    sell_available_flag    bool    Признак доступности для продажи.
    div_yield_flag    bool    Признак наличия дивидендной доходности.
    share_type    ShareType    Тип акции. Возможные значения: ShareType
    min_price_increment    Quotation    Шаг цены.
    api_trade_available_flag    bool    Параметр указывает на возможность торговать инструментом через API.
    uid    string    Уникальный идентификатор инструмента.
    real_exchange    RealExchange    Реальная площадка исполнения расчётов (биржа).
    position_uid    string    Уникальный идентификатор позиции инструмента.
    for_iis_flag    bool    Признак доступности для ИИС.
    for_qual_investor_flag    bool    Флаг отображающий доступность торговли инструментом только для квалифицированных инвесторов.
    weekend_flag    bool    Флаг отображающий доступность торговли инструментом по выходным
    blocked_tca_flag    bool    Флаг заблокированного ТКС
    liquidity_flag    bool    Флаг достаточной ликвидности
    first_1min_candle_date    google.protobuf.Timestamp    Дата первой минутной свечи.
    first_1day_candle_date    google.protobuf.Timestamp    Дата первой дневной свечи.
    
    
    
    /// Получает накопленный купонный доход по облигации.
    ///
    /// - Parameters:
    ///
    /// - Returns:
    func GetAccruedInterests() throws -> Void
    
    - GetAccruedInterestsRequest
    Запрос НКД по облигации

    Field    Type    Description
    figi    string    Figi-идентификатор инструмента.
    from    google.protobuf.Timestamp    Начало запрашиваемого периода в часовом поясе UTC.
    to    google.protobuf.Timestamp    Окончание запрашиваемого периода в часовом поясе UTC.
    
    - GetAccruedInterestsResponse
    НКД облигации

    Field    Type    Description
    accrued_interests    Массив объектов AccruedInterest    Массив операций начисления купонов.
    
    - AccruedInterest
    Операция начисления купонов.

    Field    Type    Description
    date    google.protobuf.Timestamp    Дата и время выплаты в часовом поясе UTC.
    value    Quotation    Величина выплаты.
    value_percent    Quotation    Величина выплаты в процентах от номинала.
    nominal    Quotation    Номинал облигации.
    
    
    
    /// Получает размер гарантийного обеспечения по фьючерсам.
    ///
    /// - Parameters:
    ///
    /// - Returns:
    func GetFuturesMargin() throws -> Void
    
    - GetFuturesMarginRequest
    Запрос информации о фьючерсе

    Field    Type    Description
    figi    string    Идентификатор инструмента.

    - GetFuturesMarginResponse
    Данные по фьючерсу

    Field    Type    Description
    initial_margin_on_buy    MoneyValue    Гарантийное обеспечение при покупке.
    initial_margin_on_sell    MoneyValue    Гарантийное обеспечение при продаже.
    min_price_increment    Quotation    Шаг цены.
    min_price_increment_amount    Quotation    Стоимость шага цены.
    
    
    
    /// Получает основную информацию об инструменте.
    ///
    /// - Parameters:
    ///
    /// - Returns:
    func GetInstrumentBy() throws -> Void
    
    - InstrumentRequest
    Запрос получения инструмента по идентификатору.

    Field    Type    Description
    id_type    InstrumentIdType    Тип идентификатора инструмента. Возможные значения: figi, ticker. Подробнее об идентификации инструментов: Идентификация инструментов
    class_code    string    Идентификатор class_code. Обязателен при id_type = ticker.
    id    string    Идентификатор запрашиваемого инструмента.
    
    - InstrumentResponse
    Данные по инструменту.

    Field    Type    Description
    instrument    Instrument    Основная информация об инструменте.

    - Instrument
    Объект передачи основной информации об инструменте.

    Field    Type    Description
    figi    string    Figi-идентификатор инструмента.
    ticker    string    Тикер инструмента.
    class_code    string    Класс-код инструмента.
    isin    string    Isin-идентификатор инструмента.
    lot    int32    Лотность инструмента. Возможно совершение операций только на количества ценной бумаги, кратные параметру lot. Подробнее: лот
    currency    string    Валюта расчётов.
    klong    Quotation    Коэффициент ставки риска длинной позиции по клиенту. 2 – клиент со стандартным уровнем риска (КСУР). 1 – клиент с повышенным уровнем риска (КПУР)
    kshort    Quotation    Коэффициент ставки риска короткой позиции по клиенту. 2 – клиент со стандартным уровнем риска (КСУР). 1 – клиент с повышенным уровнем риска (КПУР)
    dlong    Quotation    ССтавка риска начальной маржи для КСУР лонг.Подробнее: ставка риска в лонг
    dshort    Quotation    Ставка риска начальной маржи для КСУР шорт. Подробнее: ставка риска в шорт
    dlong_min    Quotation    Ставка риска начальной маржи для КПУР лонг. Подробнее: ставка риска в лонг
    dshort_min    Quotation    Ставка риска начальной маржи для КПУР шорт. Подробнее: ставка риска в шорт
    short_enabled_flag    bool    Признак доступности для операций в шорт.
    name    string    Название инструмента.
    exchange    string    Tорговая площадка (секция биржи).
    country_of_risk    string    Код страны риска, т.е. страны, в которой компания ведёт основной бизнес.
    country_of_risk_name    string    Наименование страны риска, т.е. страны, в которой компания ведёт основной бизнес.
    instrument_type    string    Тип инструмента.
    trading_status    SecurityTradingStatus    Текущий режим торгов инструмента.
    otc_flag    bool    Признак внебиржевой ценной бумаги.
    buy_available_flag    bool    Признак доступности для покупки.
    sell_available_flag    bool    Признак доступности для продажи.
    min_price_increment    Quotation    Шаг цены.
    api_trade_available_flag    bool    Параметр указывает на возможность торговать инструментом через API.
    uid    string    Уникальный идентификатор инструмента.
    real_exchange    RealExchange    Реальная площадка исполнения расчётов (биржа).
    position_uid    string    Уникальный идентификатор позиции инструмента.
    for_iis_flag    bool    Признак доступности для ИИС.
    for_qual_investor_flag    bool    Флаг отображающий доступность торговли инструментом только для квалифицированных инвесторов.
    weekend_flag    bool    Флаг отображающий доступность торговли инструментом по выходным
    blocked_tca_flag    bool    Флаг заблокированного ТКС
    instrument_kind    InstrumentType    Тип инструмента.
    first_1min_candle_date    google.protobuf.Timestamp    Дата первой минутной свечи.
    first_1day_candle_date    google.protobuf.Timestamp    Дата первой дневной свечи.
    
    
    
    /// Получает события выплаты дивидендов по инструменту.
    ///
    /// - Parameters:
    ///
    /// - Returns:
    func GetDividends() throws -> Void
    
    - GetDividendsRequest
    Запрос дивидендов.

    Field    Type    Description
    figi    string    Figi-идентификатор инструмента.
    from    google.protobuf.Timestamp    Начало запрашиваемого периода в часовом поясе UTC. Фильтрация происходит по параметру record_date (дата фиксации реестра).
    to    google.protobuf.Timestamp    Окончание запрашиваемого периода в часовом поясе UTC. Фильтрация происходит по параметру record_date (дата фиксации реестра).
    
    - GetDividendsResponse
    Дивиденды.

    Field    Type    Description
    dividends    Массив объектов Dividend
    
    - Dividend
    Информация о выплате.

    Field    Type    Description
    dividend_net    MoneyValue    Величина дивиденда на 1 ценную бумагу (включая валюту).
    payment_date    google.protobuf.Timestamp    Дата фактических выплат в часовом поясе UTC.
    declared_date    google.protobuf.Timestamp    Дата объявления дивидендов в часовом поясе UTC.
    last_buy_date    google.protobuf.Timestamp    Последний день (включительно) покупки для получения выплаты в часовом поясе UTC.
    dividend_type    string    Тип выплаты. Возможные значения: Regular Cash – регулярные выплаты, Cancelled – выплата отменена, Daily Accrual – ежедневное начисление, Return of Capital – возврат капитала, прочие типы выплат.
    record_date    google.protobuf.Timestamp    Дата фиксации реестра в часовом поясе UTC.
    regularity    string    Регулярность выплаты. Возможные значения: Annual – ежегодная, Semi-Anl – каждые полгода, прочие типы выплат.
    close_price    MoneyValue    Цена закрытия инструмента на момент ex_dividend_date.
    yield_value    Quotation    Величина доходности.
    created_at    google.protobuf.Timestamp    Дата и время создания записи в часовом поясе UTC.
    
    
    
    /// Получает актив по его идентификатору.
    ///
    /// - Parameters:
    ///
    /// - Returns:
    func GetAssetBy() throws -> Void
    
    - AssetRequest
    Запрос актива по идентификатору.

    Field    Type    Description
    id    string    uid-идентификатор актива.

    - AssetResponse
    Данные по активу.

    Field    Type    Description
    asset    AssetFull    Актив.
    
    - AssetFull
    Field    Type    Description
    uid    string    Уникальный идентификатор актива.
    type    AssetType    Тип актива.
    name    string    Наименование актива.
    name_brief    string    Короткое наименование актива.
    description    string    Описание актива.
    deleted_at    google.protobuf.Timestamp    Дата и время удаления актива.
    required_tests    Массив объектов string    Тестирование клиентов.
    currency    AssetCurrency    Валюта. Обязательно и заполняется только для type = "ASSET_TYPE_CURRENCY".
    security    AssetSecurity    Ценная бумага. Обязательно и заполняется только для type = "ASSET_TYPE_SECURITY".
    gos_reg_code    string    Номер государственной регистрации.
    cfi    string    Код CFI.
    code_nsd    string    Код НРД инструмента.
    status    string    Статус актива.
    brand    Brand    Бренд.
    updated_at    google.protobuf.Timestamp    Дата и время последнего обновления записи.
    br_code    string    Код типа ц.б. по классификации Банка России.
    br_code_name    string    Наименование кода типа ц.б. по классификации Банка России.
    instruments    Массив объектов AssetInstrument    Массив идентификаторов инструментов.
    
    
    
    /// Получает список активов. Метод работает для всех инструментов, за исключением срочных - опционов и фьючерсов.
    ///
    /// - Parameters:
    ///
    /// - Returns:
    func GetAssets() throws -> Void
    
    - AssetsRequest
    Запрос списка активов.

    Field    Type    Description
    instrument_type    InstrumentType
    
    - AssetsResponse
    Список активов.

    Field    Type    Description
    assets    Массив объектов Asset    Активы.
    
    - Asset
    Информация об активе.

    Field    Type    Description
    uid    string    Уникальный идентификатор актива.
    type    AssetType    Тип актива.
    name    string    Наименование актива.
    instruments    Массив объектов AssetInstrument    Массив идентификаторов инструментов.
    
    - AssetInstrument
    Идентификаторы инструмента.

    Field    Type    Description
    uid    string    uid идентификатор инструмента.
    figi    string    figi идентификатор инструмента.
    instrument_type    string    Тип инструмента.
    ticker    string    Тикер инструмента.
    class_code    string    Класс-код (секция торгов).
    links    Массив объектов InstrumentLink    Массив связанных инструментов.
    instrument_kind    InstrumentType    Тип инструмента.
    position_uid    string    id позиции.
    
    - InstrumentLink
    Связь с другим инструментом.

    Field    Type    Description
    type    string    Тип связи.
    instrument_uid    string    uid идентификатор связанного инструмента.

    
    
    /// Получает список избранных инструментов.
    ///
    /// - Parameters:
    ///
    /// - Returns:
    func GetFavorites() throws -> Void
    
    - GetFavoritesRequest
    Запрос списка избранных инструментов, входные параметры не требуются.

    - GetFavoritesResponse
    В ответ передаётся список избранных инструментов в качестве массива.

    Field    Type    Description
    favorite_instruments    Массив объектов FavoriteInstrument    Массив инструментов
    
    - FavoriteInstrument
    Массив избранных инструментов.

    Field    Type    Description
    figi    string    Figi-идентификатор инструмента.
    ticker    string    Тикер инструмента.
    class_code    string    Класс-код инструмента.
    isin    string    Isin-идентификатор инструмента.
    instrument_type    string    Тип инструмента.
    otc_flag    bool    Признак внебиржевой ценной бумаги.
    api_trade_available_flag    bool    Параметр указывает на возможность торговать инструментом через API.
    instrument_kind    InstrumentType    Тип инструмента.
    
    
    
    /// Редактирует список избранных инструментов.
    ///
    /// - Parameters:
    ///
    /// - Returns:
    func EditFavorites() throws -> Void
    
    - EditFavoritesRequest
    Запрос редактирования списка избранных инструментов.

    Field    Type    Description
    instruments    Массив объектов EditFavoritesRequestInstrument    Массив инструментов.
    action_type    EditFavoritesActionType    Тип действия со списком.

    - EditFavoritesRequestInstrument
    Массив инструментов для редактирования списка избранных инструментов.

    Field    Type    Description
    figi    string    Figi-идентификатор инструмента.

    - EditFavoritesActionType
    Тип действия со списком избранных инструментов.

    Name    Number    Description
    EDIT_FAVORITES_ACTION_TYPE_UNSPECIFIED    0    Тип не определён.
    EDIT_FAVORITES_ACTION_TYPE_ADD    1    Добавить в список.
    EDIT_FAVORITES_ACTION_TYPE_DEL    2    Удалить из списка.
    
    - EditFavoritesResponse
    Результат редактирования списка избранных инструментов.

    Field    Type    Description
    favorite_instruments    Массив объектов FavoriteInstrument    Массив инструментов
    
    - FavoriteInstrument
    Массив избранных инструментов.

    Field    Type    Description
    figi    string    Figi-идентификатор инструмента.
    ticker    string    Тикер инструмента.
    class_code    string    Класс-код инструмента.
    isin    string    Isin-идентификатор инструмента.
    instrument_type    string    Тип инструмента.
    otc_flag    bool    Признак внебиржевой ценной бумаги.
    api_trade_available_flag    bool    Параметр указывает на возможность торговать инструментом через API.
    instrument_kind    InstrumentType    Тип инструмента.
    
    
    
    /// Получает список стран.
    ///
    /// - Parameters:
    ///
    /// - Returns:
    func GetCountries() throws -> Void
    
    - GetCountriesRequest
    Запрос справочника стран.

    GetCountriesResponse
    Справочник стран.

    Field    Type    Description
    countries    Массив объектов CountryResponse    Массив стран.
    
    - CountryResponse
    Данные о стране.

    Field    Type    Description
    alfa_two    string    Двухбуквенный код страны.
    alfa_three    string    Трёхбуквенный код страны.
    name    string    Наименование страны.
    name_brief    string    Краткое наименование страны.
    
    
    
    /// Поиск инструмента.
    ///
    /// - Parameters:
    ///
    /// - Returns:
    func FindInstrument() throws -> Void
    
    - FindInstrumentRequest
    Запрос на поиск инструментов.

    Field    Type    Description
    query    string    Строка поиска.
    instrument_kind    InstrumentType    Фильтр по типу инструмента.
    api_trade_available_flag    bool    Фильтр для отображения только торговых инструментов.
    
    - FindInstrumentResponse
    Результат поиска инструментов.

    Field    Type    Description
    instruments    Массив объектов InstrumentShort    Массив инструментов, удовлетворяющих условиям поиска.
    
    - InstrumentShort
    Краткая информация об инструменте.

    Field    Type    Description
    isin    string    Isin инструмента.
    figi    string    Figi инструмента.
    ticker    string    Ticker инструмента.
    class_code    string    ClassCode инструмента.
    instrument_type    string    Тип инструмента.
    name    string    Название инструмента.
    uid    string    Уникальный идентификатор инструмента.
    position_uid    string    Уникальный идентификатор позиции инструмента.
    instrument_kind    InstrumentType    Тип инструмента.
    api_trade_available_flag    bool    Параметр указывает на возможность торговать инструментом через API.
    for_iis_flag    bool    Признак доступности для ИИС.
    first_1min_candle_date    google.protobuf.Timestamp    Дата первой минутной свечи.
    first_1day_candle_date    google.protobuf.Timestamp    Дата первой дневной свечи.
    for_qual_investor_flag    bool    Флаг отображающий доступность торговли инструментом только для квалифицированных инвесторов.
    weekend_flag    bool    Флаг отображающий доступность торговли инструментом по выходным
    blocked_tca_flag    bool    Флаг заблокированного ТКС
    
    
    
    /// Получает список брендов.
    ///
    /// - Parameters:
    ///
    /// - Returns:
    func GetBrands() throws -> Void
    
    - GetBrandsRequest
    Запрос списка брендов.

    GetBrandRequest
    Запрос бренда.

    Field    Type    Description
    id    string    Uid-идентификатор бренда.
    
    - GetBrandsResponse
    Список брендов.

    Field    Type    Description
    brands    Массив объектов Brand    Массив брендов.
    
    - Brand
    Бренд.

    Field    Type    Description
    uid    string    uid идентификатор бренда.
    name    string    Наименование бренда.
    description    string    Описание.
    info    string    Информация о бренде.
    company    string    Компания.
    sector    string    Сектор.
    country_of_risk    string    Код страны риска.
    country_of_risk_name    string    Наименование страны риска.

    
    
    /// Получает бренд по его идентификатору.
    ///
    /// - Parameters:
    ///
    /// - Returns:
    func GetBrandBy() throws -> Void
    
    - GetBrandRequest
    Запрос бренда.

    Field    Type    Description
    id    string    Uid-идентификатор бренда.
    
    - Brand
}

internal struct GrpcInstrumentsService: InstrumentsService {
    let client: InstrumentsServiceClient
    
    init(_ client: InstrumentsServiceClient) {
        self.client = client
    }
}
