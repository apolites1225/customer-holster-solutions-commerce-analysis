# Notes for Interviews

This document contains additional context, design decisions, and talking points to support discussion of the project in interviews.  
It is not intended to be client-facing documentation.

---

## Data Quality Challenges Identified

- **NULL product attribution**
  - Nearly half of total revenue is associated with rows where `product_title` is NULL.
  - These rows were retained to preserve revenue accuracy rather than dropped or imputed.
  - This surfaced a real business risk: revenue dependency on products that are not fully attributable in reporting.

- **Discount export structure**
  - The discounts-by-order export contained monthly summary rows with zero values and no associated order or product.
  - These rows were preserved in the cleaned table but explicitly excluded from analytical queries where inappropriate.

- **Returns handling**
  - Returns appeared as negative values in net sales rather than as separate return records.
  - These were preserved to maintain financial integrity and allow accurate net revenue calculations.

- **Text encoding issue**
  - One CSV initially failed to load due to a UTF-8 BOM encoding issue.
  - The file was normalized before ingestion to allow successful COPY execution.

---

## Design Decisions & Rationale

- **Revenue concentration over averages**
  - Rather than relying on averages alone, cumulative revenue windows were used to evaluate concentration risk (Pareto-style analysis).
  - This allowed clearer insight into dependency on specific products vs. customers.

- **Separating product vs. customer concentration**
  - Product concentration and customer concentration were analyzed independently.
  - This revealed that product dependency is significantly higher risk than customer dependency.

- **NULLs treated as signal, not noise**
  - NULL product titles were intentionally kept and highlighted.
  - Treating them as “bad data to delete” would have hidden a meaningful reporting gap.

- **CTEs and window functions**
  - Queries were structured using CTEs for readability and auditability.
  - Window functions were favored over subqueries to support cumulative and ranking logic cleanly.

---

## Key Analytical Takeaways (How to Explain Results)

- **Revenue is product-concentrated**
  - ~50% of total revenue comes from unattributed (NULL) product titles.
  - The top 3 named products account for nearly all remaining revenue.

- **Customer revenue is distributed**
  - ~107 customers are required to reach 50% of total revenue.
  - ~226 customers are required to reach 80% of total revenue.
  - This indicates low customer concentration risk.

- **Discounts drive revenue erosion**
  - Discounted orders show a ~16% reduction from gross to net sales.
  - Returns were negligible, indicating pricing strategy—not fulfillment—is the primary margin lever.

- **Traffic sources are highly concentrated**
  - Direct and Google search traffic account for ~90% of all sessions.
  - Social and paid channels contribute marginal volume.

---

## Tradeoffs Made

- Did not normalize product attribution upstream due to scope constraints.
- Focused on revenue-level analysis rather than conversion funnels due to missing order-to-session linkage.
- Prioritized interpretability over over-engineering (pure SQL, no BI layer).

---

## If I Had More Time

- Normalize product attribution to eliminate NULL product titles.
- Add conversion rate analysis by traffic source.
- Segment customers using full RFM scoring instead of spend-only metrics.
- Build a lightweight dashboard layer for executive consumption.

---

## How to Position This Project Verbally

If asked to summarize:

> “This project focused on identifying where revenue risk actually lives. While customer revenue is broadly distributed, product revenue is highly concentrated—especially in unattributed product records. That insight changes where the business should prioritize cleanup and strategy.”

If asked about challenges:

> “The most interesting challenge was realizing that the biggest issue wasn’t missing data—it was what the missing data represented. Keeping NULL product rows exposed a real reporting and dependency risk.”

---

## Skills Demonstrated

- SQL (CTEs, window functions, aggregations)
- Data cleaning & validation
- Business-first analytics
- Revenue modeling
- Analytical communication
- Real-world data debugging
