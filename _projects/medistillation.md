---
title: "Medistillation"
collection: projects
type: "Project"
permalink: "/projects/medistillation/"
date: 2024-12-15
portfolio_category: "AI & Tools"
tags: ["Python", "PyTorch", "Hugging Face", "Knowledge distillation", "Healthcare", "LLMs"]
featured: false
summary: "Comparative knowledge-distillation experiments transferring medical QA capability from large teacher models into compact students."
codeurl: "https://github.com/shreyanmitra/Medistillation"
---

Medistillation implements and compares multiple knowledge-distillation methods for medical question answering, focusing on transferring capability from large teachers (e.g. Meditron-scale) into compact students (e.g. Qwen2-1.5B).<br>
<br>
The PyTorch/Hugging Face codebase covers methods such as logit KD, adaptive KD, CoT distillation, FitNets, attention transfer, and RL-style variants, with evaluation across medical QA benchmarks and fidelity metrics.
