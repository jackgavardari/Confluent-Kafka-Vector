select *, 
INITCAP(
	concat_ws(' ', 
		size, 
		ageGroup, 
		gender, 
		season, 
		fashionType, 
		brandName, 
		baseColor, 
		articleType)
) as content,
ml_evaluate('accuracy', actual_label, predicted_label) as evaluation_result
from `product-updates`;
