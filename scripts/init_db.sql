-- 1. Dimension Client (avec gestion SCD Type 2)
CREATE TABLE IF NOT EXISTS dim_customer (
    customer_key VARCHAR(100) PRIMARY KEY,
    customer_id VARCHAR(50) NOT NULL,
    msisdn VARCHAR(30),
    kyc_level VARCHAR(20),
    valid_from DATE,
    valid_to DATE,
    is_current BOOLEAN
);

-- 2. Dimension Agent
CREATE TABLE IF NOT EXISTS dim_agent (
    agent_key VARCHAR(100) PRIMARY KEY,
    agent_id VARCHAR(50) NOT NULL,
    agent_name VARCHAR(100),
    region VARCHAR(50),
    commission_tier VARCHAR(50)
);

-- 3. Dimension Opérateur
CREATE TABLE IF NOT EXISTS dim_operator (
    operator_key VARCHAR(100) PRIMARY KEY,
    operator_code VARCHAR(50),
    operator_name VARCHAR(100),
    transaction_limit_daily DOUBLE PRECISION
);

-- 4. Dimension Date
CREATE TABLE IF NOT EXISTS dim_date (
    full_date DATE PRIMARY KEY,
    year INT,
    month INT,
    day_of_week VARCHAR(20),
    is_weekend BOOLEAN
);

-- 5. Table de Faits : Transactions
CREATE TABLE IF NOT EXISTS fact_transaction (
    transaction_id VARCHAR(100) PRIMARY KEY,
    transaction_date DATE REFERENCES dim_date(full_date),
    customer_key VARCHAR(100) REFERENCES dim_customer(customer_key),
    agent_key VARCHAR(100) REFERENCES dim_agent(agent_key),
    operator_key VARCHAR(100) REFERENCES dim_operator(operator_key),
    transaction_type VARCHAR(50),
    amount DOUBLE PRECISION,
    transaction_status VARCHAR(50)
);