CREATE TABLE binance_vector (
    coin_id INT,
    coin_name STRING,
    price_usd DOUBLE,
    market_cap_usd DOUBLE,
    volume_24h_usd DOUBLE,
    circulating_supply DOUBLE,
    change_24h_percent DOUBLE,
    content STRING,
    vector ARRAY<FLOAT>,
    evaluation_result DOUBLE
);
