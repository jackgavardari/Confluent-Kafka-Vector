CREATE TABLE binance_vector (
    coin_id INT,
    coin_name STRING,
    price_usd DECIMAL(10, 2),
    market_cap_usd DECIMAL(15, 2),
    volume_24h_usd DECIMAL(15, 2),
    circulating_supply DECIMAL(20, 2),
    change_24h_percent DECIMAL(5, 2),
    vector ARRAY<DOUBLE>
);
