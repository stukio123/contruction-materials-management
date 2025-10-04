-- =========================
-- Building Materials ERP DDL
-- PostgreSQL
-- =========================

-- 1. Resource Categories (self-reference)
CREATE TABLE resource_categories (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    parent_id BIGINT,
    CONSTRAINT fk_category_parent FOREIGN KEY (parent_id) REFERENCES resource_categories(id),
    CONSTRAINT uq_category_name UNIQUE (name),
    CONSTRAINT chk_self_parent CHECK (id IS NULL OR id <> parent_id)
);

-- 2. Manufacturers
CREATE TABLE manufacturers (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    country VARCHAR(100),
    contact_info TEXT,
    CONSTRAINT uq_manufacturer_name UNIQUE (name)
);

-- 3. Resources (Materials / Equipment)
CREATE TABLE resources (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    category_id BIGINT NOT NULL,
    unit VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_resource_category FOREIGN KEY (category_id) REFERENCES resource_categories(id)
);

-- 4. Resource ↔ Manufacturers (Many-to-Many)
CREATE TABLE resource_manufacturers (
    resource_id BIGINT NOT NULL,
    manufacturer_id BIGINT NOT NULL,
    PRIMARY KEY (resource_id, manufacturer_id),
    CONSTRAINT fk_rm_resource FOREIGN KEY (resource_id) REFERENCES resources(id),
    CONSTRAINT fk_rm_manufacturer FOREIGN KEY (manufacturer_id) REFERENCES manufacturers(id)
);

-- 5. Resource Prices (Historical Pricing)
CREATE TABLE resource_prices (
    id BIGSERIAL PRIMARY KEY,
    resource_id BIGINT NOT NULL,
    manufacturer_id BIGINT,
    price DECIMAL(18,2) NOT NULL,
    valid_from DATE NOT NULL,
    valid_to DATE,
    currency VARCHAR(10) DEFAULT 'VND',
    CONSTRAINT fk_price_resource FOREIGN KEY (resource_id) REFERENCES resources(id),
    CONSTRAINT fk_price_manufacturer FOREIGN KEY (manufacturer_id) REFERENCES manufacturers(id)
);

-- 6. Projects
CREATE TABLE projects (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    start_date DATE,
    end_date DATE,
    status VARCHAR(50) DEFAULT 'planned'
);

-- 7. Contracts
CREATE TABLE contracts (
    id BIGSERIAL PRIMARY KEY,
    project_id BIGINT NOT NULL,
    contractor_name VARCHAR(255) NOT NULL,
    contract_value DECIMAL(18,2),
    start_date DATE,
    end_date DATE,
    CONSTRAINT fk_contract_project FOREIGN KEY (project_id) REFERENCES projects(id)
);

-- 8. Cost Estimates (Planned Costs per Project/Resource)
CREATE TABLE cost_estimates (
    id BIGSERIAL PRIMARY KEY,
    project_id BIGINT NOT NULL,
    resource_id BIGINT NOT NULL,
    quantity DECIMAL(18,2) NOT NULL,
    unit_price DECIMAL(18,2) NOT NULL,
    total_estimated DECIMAL(18,2) GENERATED ALWAYS AS (quantity * unit_price) STORED,
    CONSTRAINT fk_estimate_project FOREIGN KEY (project_id) REFERENCES projects(id),
    CONSTRAINT fk_estimate_resource FOREIGN KEY (resource_id) REFERENCES resources(id)
);

-- 9. Cost Actuals (Real Costs per Project/Resource)
CREATE TABLE cost_actuals (
    id BIGSERIAL PRIMARY KEY,
    project_id BIGINT NOT NULL,
    resource_id BIGINT NOT NULL,
    quantity DECIMAL(18,2) NOT NULL,
    unit_price DECIMAL(18,2) NOT NULL,
    total_actual DECIMAL(18,2) GENERATED ALWAYS AS (quantity * unit_price) STORED,
    incurred_date DATE DEFAULT CURRENT_DATE,
    CONSTRAINT fk_actual_project FOREIGN KEY (project_id) REFERENCES projects(id),
    CONSTRAINT fk_actual_resource FOREIGN KEY (resource_id) REFERENCES resources(id)
);

-- Indexes for optimization
CREATE INDEX idx_resources_category ON resources(category_id);
CREATE INDEX idx_prices_resource ON resource_prices(resource_id);
CREATE INDEX idx_estimates_project ON cost_estimates(project_id);
CREATE INDEX idx_actuals_project ON cost_actuals(project_id);

