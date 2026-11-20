-- Se ejecuta solo la primera vez que arranca PostgreSQL
CREATE DATABASE portafolio;
\connect portafolio

-- Proyecto 1: datos recibidos por webhook
CREATE TABLE IF NOT EXISTS contactos (
  id          SERIAL PRIMARY KEY,
  nombre      VARCHAR(120) NOT NULL,
  email       VARCHAR(160) NOT NULL,
  mensaje     TEXT,
  creado_en   TIMESTAMPTZ DEFAULT NOW()
);

-- Proyecto 2: facturas extraídas con IA
CREATE TABLE IF NOT EXISTS facturas (
  id               SERIAL PRIMARY KEY,
  archivo          VARCHAR(255),
  numero_factura   VARCHAR(60),
  fecha_emision    DATE,
  proveedor        VARCHAR(200),
  ruc_proveedor    VARCHAR(20),
  cliente          VARCHAR(200),
  subtotal         NUMERIC(12,2),
  iva              NUMERIC(12,2),
  total            NUMERIC(12,2),
  moneda           VARCHAR(10) DEFAULT 'USD',
  procesado_en     TIMESTAMPTZ DEFAULT NOW()
);
