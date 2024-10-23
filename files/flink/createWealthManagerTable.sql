CREATE TABLE wealth_manager (
    client_id INT,
    investment_id INT,
    investment_amount DOUBLE,
    investmentType STRING,
    riskLevel STRING,
    investmentDuration STRING,
    expectedReturn DOUBLE,
    investmentDate STRING,
    content STRING,
    vector ARRAY<FLOAT>,
    evaluation_result DOUBLE
);
