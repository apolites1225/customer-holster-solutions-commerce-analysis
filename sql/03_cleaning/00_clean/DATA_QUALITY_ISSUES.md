# Data Quality Issues

This document summarizes known data quality issues encountered during ingestion
and cleaning. These issues reflect characteristics of the source exports rather
than errors introduced during processing.

## Summary Rows in Shopify Exports

Several Shopify reports include summary rows (monthly or total) that contain
aggregate values but no associated order, product, or customer identifiers.

Characteristics of these rows:
- NULL or blank dimension fields (e.g., order name, product title)
- Zero or aggregate metric values
- One row per reporting period or per export

These rows were retained in clean tables and excluded explicitly during
analysis when product-, order-, or customer-level granularity was required.

## Null Dimension Values

Some datasets include NULL values in dimension fields such as:
- referrer source
- referrer name
- product or order identifiers

These NULLs represent missing or unreported upstream data and were preserved
rather than imputed or removed.

## File Encoding Inconsistency

One CSV export required UTF-8 normalization prior to loading due to encoding
differences from the other files. This issue was resolved by converting the file
encoding before ingestion.

No data content was altered as part of this process.

## Numeric Formatting

Monetary fields were stored as text in the source exports and included currency
symbols. These symbols were removed during cleaning prior to casting values to
numeric types.

No additional assumptions or transformations were applied.
