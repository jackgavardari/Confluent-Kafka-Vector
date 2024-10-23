SELECT *, 
INITCAP(
	concat_ws(' ', 
		investmentType, 
		riskLevel, 
		investmentDuration, 
		expectedReturn, 
		investmentDate,
		', investment amount: ' || cast(investment_amount as string),
		', client id: ' || cast(client_id as string),	
		', investment id: ' || cast(investment_id as string))
) as content,
ml_predict('vector_encoding', content) as vector,
ml_evaluate('accuracy', actual_label, predicted_label) as evaluation_result
FROM `wealth-management`;
