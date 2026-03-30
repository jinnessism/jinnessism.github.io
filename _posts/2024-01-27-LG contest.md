---
title: "3rd Data Science Contest, with LG Electronics"
date: 2024-01-27 18:00:00 +0900
tags: [project, data science, contest, optimization]
excerpt: "A project on demand forecasting and inventory optimisation for the LG Electronics data science contest."
---

This post archives our work in the 3rd Data Science Contest with LG Electronics. I participated with three teammates: Dayoon, Juhee, and Donghwan.

## Contest Task Summary

Given 130 weeks of historical component demand data, the contest involved two tasks: demand forecasting and inventory optimisation. For forecasting, the objective was to minimise Relative Mean Absolute Error (RMAE) between predictions and ground truth. For inventory optimisation, the objective was to minimise total cost under component-specific cost functions.

## Key Decisions

### Handling Sparse Demand
- While training the baseline RNN models, I found that irregular demand patterns severely degraded model performance. Through a literature review, I found that in electronic component forecasting it is useful to divide components into four categories based on demand sparsity and relative demand size.

### Revisiting the Demand Distribution Assumption
- In inventory management, we improved performance by revisiting the demand distribution assumption and strengthening cross-validation. We observed that inventory cost remained high despite low RMAE, which suggested that better forecasting accuracy alone was not enough. Initially, we assumed a normal distribution. However, from a component-demand perspective, demand is often triggered by failure events, which are discrete and sparse. This made the Poisson assumption more appropriate for sparse demand.
- To validate this, we compared normal and Poisson assumptions. The Poisson distribution performed best for sparse-demand groups, while the normal distribution also performed well for large-demand groups, consistent with the Central Limit Theorem. For simplicity, we adopted the Poisson assumption for sparse-demand groups.
- As an additional strategy to reduce inventory, we predicted cumulative demand up to each target week and ordered only the increment from the immediately previous week. We also compared candidate quantiles around the theoretical optimum (p = 0.785), including p = 0.75, 0.80, and 0.85, and found that p = 0.785 performed best in practice.

### Additional Details
- To estimate the distribution mean parameter, we used Meta Prophet. We also used the tsxv package to implement time-series cross-validation modules.

## Implications and Future Work
This project showed that demand-type-aware modelling can improve both forecast quality and inventory cost. In particular, choosing distributional assumptions by demand sparsity had a direct impact on downstream ordering decisions. The cumulative-demand strategy with incremental ordering was also practical for reducing overstock risk.

For future work, we plan to extend sparse-demand modelling to zero-inflated and over-dispersed count models, automate demand-group segmentation, and incorporate lead-time uncertainty and service-level constraints into optimisation. We also plan broader sensitivity analyses to assess policy robustness under varying cost conditions.

