# Known Data Issues

The following data issues were identified during ingestion and cleaning. These
issues originate from the source exports and were handled intentionally.

## Summary Rows Without Identifiers

Some Shopify exports include summary rows with aggregate values but no associated
order, product, or customer identifiers.

Examples include:
- Monthly zero-value rows in discount and order reports
- Total rows in product variant sales reports

These rows were retained in clean tables and filtered explicitly during analysis
when row-level granularity was required.

## Missing Dimension Values

Certain dimension fields contain NULL or blank values, including:
- Order names
- Product titles
- Referrer source or name

These values represent missing upstream data rather than processing errors.
They were preserved to avoid introducing assumptions during cleaning.

## File Encoding Differences

One CSV file required UTF-8 normalization prior to loading due to encoding
differences from the other exports.

The file was converted before ingestion to ensure compatibility with Postgres.
No data values were modified.

## Inconsistent Column Naming Across Exports

Column naming conventions varied across source files (e.g., similar metrics
using different labels in different reports).

Raw tables preserved original column names, and clean tables standardized
types rather than renaming fields.
