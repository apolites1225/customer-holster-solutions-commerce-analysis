# Ecommerce Revenue & Customer Concentration Analysis

## Overview
This case study analyzes ecommerce sales, customer behavior, discounts, and traffic sources to identify revenue risk, pricing impact, and concentration patterns within a direct-to-consumer business.

The goal was to answer core business questions using raw CSV exports and SQL, while validating data quality and surfacing actionable insights for decision-makers.

---

## Business Questions
1. How is overall sales performance trending year-over-year?
2. Which product variants drive the most revenue versus unit volume?
3. How much revenue is lost to discounts and returns?
4. Who are the most valuable customers by spend and frequency?
5. Which traffic sources generate the most sessions?
6. How concentrated is revenue across products and customers?

---

## Approach
I ingested raw ecommerce CSV exports into PostgreSQL, created cleaned analytical tables, and validated row counts and null behavior before analysis.

Key techniques included:
- Currency normalization and type casting
- Validation checks between raw and cleaned tables
- Window functions for cumulative and YoY analysis
- CTE-based queries to isolate business logic

NULL values were treated as analytical signals rather than silently removed.

---

## Key Findings

### 1. Sales Trend (YoY)
- Total 2025 orders declined **16.1% year-over-year**
- Average order value declined **15.9%**
- Mid-year months showed recovery, but early-year declines drove overall underperformance

**Insight:** Volume pressure, not fulfillment issues, drove the YoY decline.

---

### 2. Product Revenue vs. Volume
- Custom IWB and OWB holsters dominate both revenue and unit volume
- Revenue leadership does not always align with unit sales, indicating pricing differentiation across variants

**Insight:** A small number of custom products drive most sales activity.

---

### 3. Discounts & Returns
- Among discounted orders, **discounts reduced gross sales by ~16.2%**
- Returns were effectively zero and not a material driver of revenue loss
- No single order exhibited extreme discounting

**Insight:** Margin pressure is driven by pricing strategy, not returns or operational issues.

---

### 4. Customer Value & Concentration
- The top customer accounted for ~6.5% of total revenue
- **107 customers generated 50% of revenue**
- **226 customers generated 80% of revenue**
- No extreme customer dependency was observed

**Insight:** Revenue risk is not concentrated in a small set of customers.

---

### 5. Traffic Sources
- Direct traffic and Google search account for ~90% of sessions
- Social, paid, and email channels contribute marginal volume

**Insight:** Organic and brand-driven traffic dominate acquisition.

---

### 6. Revenue Concentration Risk
- Nearly **50% of revenue is tied to unattributed (NULL) product titles**
- The top 3 named products account for nearly all remaining revenue
- Product concentration risk exceeds customer concentration risk

**Insight:** Product attribution gaps represent a material reporting and decision-making risk.

---

## Business Implications
- Product attribution issues should be resolved upstream to reduce reporting risk
- Discounting strategy should be reviewed due to its direct margin impact
- Growth efforts should prioritize search and direct channels
- Revenue stability is more sensitive to product performance than customer churn

---

## What I Would Do Next (Fturue Analysis)
- Fix product attribution at the source system
- Implement full RFM segmentation for lifecycle targeting
- Analyze conversion rates by traffic source
- Build an executive dashboard for ongoing monitoring

---

## Tools Used
- PostgreSQL
- SQL (CTEs, window functions)
- CSV ingestion
- Windows environment
- CSV exports from Shopify

---

## Key Recommendations

1. Resolve NULL product attribution issues, as they represent ~X% of total revenue and obscure true product performance.
2. Review discount strategy, as discounts account for $X in revenue erosion with limited evidence of volume lift.
3. Focus growth efforts on top-performing variants while diversifying the product mix to reduce revenue concentration risk.
