# Cleaning Overview

This project follows a deliberate raw → clean data pipeline.

Raw tables preserve the source CSV data exactly as exported, with all fields
stored as text. No transformations, filtering, or business logic are applied
at the raw layer.

Clean tables apply minimal, consistent transformations to prepare the data
for analysis. The goal of cleaning is usability and correctness, not
interpretation.

## Cleaning Principles

The following principles were applied across all datasets:

- Raw tables are never modified after loading.
- Clean tables cast fields to appropriate data types:
  - Dates → DATE
  - Counts → INTEGER
  - Monetary values → NUMERIC
- Empty strings are converted to NULL using NULLIF.
- Currency symbols ($) are removed prior to numeric casting.
- No derived metrics or calculations are created during cleaning.
- Rows are not removed unless they are proven to be non-transactional
  summary rows.

## Handling of Summary and Null Rows

Several Shopify exports include summary rows (monthly or total) with no
associated order, product, or customer identifiers. These rows were retained
in clean tables and excluded explicitly during analysis when necessary.

Null values in dimension fields (e.g., referrer source) reflect missing
upstream data and were preserved rather than imputed.

## Validation

Each clean table includes validation queries to confirm:

- Row count parity between raw and clean tables
- Successful type casting
- Basic sanity checks (e.g., non-negative counts)

All business rules, filtering, and analysis logic are deferred to the
analysis layer.
