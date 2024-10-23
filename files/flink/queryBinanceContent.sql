SELECT *, 
INITCAP(
	concat_ws(' ', 
		coin_name, 
		', price: ' || cast(price_usd as string),
		', market cap: ' || cast(market_cap_usd as string),
		', volume 24h: ' || cast(volume_24h_usd as string),
		', circulating supply: ' || cast(circulating_supply as string),
		', change 24h: ' || cast(change_24h_percent as string))
) as content 
FROM `binance`;
