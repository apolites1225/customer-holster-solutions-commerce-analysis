# Customer Holster Solutions — Ecommerce Revenue & Customer Analysis

## Executive Summary

This project analyzes ecommerce sales, customer behavior, discounts, and traffic sources for Customer Holster Solutions using exported Shopify data.

The analysis surfaced three material findings:

- **Revenue is highly concentrated at the product level**, with the top 5 product variants generating **over 98% of total net sales**, exposing the business to concentration risk.
- **Product attribution issues materially limit insight**, as **49.8% of total net revenue ($22.1K)** is tied to NULL (unattributed) product titles.
- **Discounting has a measurable but limited impact**, accounting for **$268 in revenue erosion**, with little evidence of corresponding volume lift.

While customer revenue is distributed across hundreds of buyers, product-level concentration and data quality represent the primary operational risks.

---

## Business Questions

- How is overall sales performance trending over time compared to the prior year?
- Which product variants drive the most revenue versus the most unit volume?
- How much revenue is lost to discounts and returns?
- Who are the most valuable customers by spend and order frequency?
- Which traffic sources generate the most sessions?
- How concentrated is revenue across products and customers?

---

## Data Sources

- Orders over time (monthly, with prior-year comparisons)
- Total sales by product variant
- Discounts by order
- Sales by customer
- Sessions by referrer

All data was provided as CSV exports and loaded into PostgreSQL for analysis.

---

## Tools & Skills Used

- **SQL (PostgreSQL)**
  - CTEs, window functions, ranking, cumulative distributions
- Data modeling & cleaning
- Exploratory & diagnostic analysis
- Business-focused insight generation

---

## Key Findings

- Nearly **half of total revenue (49.8%)** cannot be attributed to specific product titles, limiting product-level performance analysis and merchandising decisions.
- Revenue is **extremely concentrated** at the product level, while customer revenue is comparatively well distributed.
- Discount usage is modest in absolute dollars but lacks evidence of effectiveness in driving incremental volume.
- A small number of referrers account for the majority of site sessions, consistent with a Pareto-style traffic distribution.

---

## Key Business Recommendations

- Resolve product attribution gaps, as **49.8% of total net revenue ($22.1K)** is tied to unattributed product titles, obscuring true product performance.
- Review discount strategy, as discounts accounted for **$268 in revenue erosion** with limited evidence of incremental volume lift.
- Reduce product-level concentration risk, as the **top 5 product variants generate over 98% of total net sales**, making revenue vulnerable to disruptions in a narrow product set.

---

## Data Cleaning, Assumptions & Limitations

- The discounts-by-order export includes monthly zero-value summary rows with no associated order. These rows were retained for auditability but excluded from revenue calculations.
- High-revenue rows with NULL product titles were intentionally preserved to surface attribution issues rather than silently reallocating or removing revenue.
- Customer identity was based on cleaned customer names due to the absence of a stable customer ID across all exports.
- Analysis reflects available historical data only and does not include margin or cost-of-goods information.

---

## Project Structure & Reproducibility
The project is fully reproducible via the 00_run_all.sql script, which builds schema, cleans data, and executes analysis queries end-to-end.
```text
sql/
├── 01_schema/
├── 02_load/
├── 03_cleaning/
├── 04_analysis/

└── 00_run/00_run_all.sql


