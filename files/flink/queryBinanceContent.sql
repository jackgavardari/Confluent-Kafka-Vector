SELECT *, 
INITCAP(
	concat_ws(' ', 
		coin_name, 
		price_usd, 
		market_cap_usd, 
		volume_24h_usd, 
		circulating_supply, 
		change_24h_percent)
) as content 
FROM `binance`;
