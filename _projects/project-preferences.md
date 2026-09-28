---
title: "Project Preferences"
collection: projects
type: "Project"
permalink: "/projects/project-preferences/"
date: 2025-02-15
portfolio_category: "Tools"
tags: ["Python", "OR-Tools", "pandas", "Optimization", "Education", "Algorithms"]
featured: false
summary: "Automates CSE 403 project-team assignment from student project rankings and teammate preferences using OR-Tools."
codeurl: "https://github.com/shreyanmitra/ProjectPreferences"
---

Project Preferences assigns students to CSE 403 project teams using preference data such as project rankings and teammate requests.<br>
<br>
The Python CLI parses preference CSVs with pandas, then solves team assignments via OR-Tools (with a greedy fallback), emitting styled reports or CSV output for course staff.
