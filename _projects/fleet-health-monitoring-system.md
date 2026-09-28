---
title: "Fleet Health Monitoring System"
collection: projects
type: "Project"
permalink: "/projects/fleet-health-monitoring-system/"
date: 2024-10-15
portfolio_category: "Applications"
tags: ["Python", "FastAPI", "Flask", "MQTT", "Monitoring", "Edge computing"]
featured: false
summary: "An end-to-end MQTT + FastAPI + Flask reference system for monitoring remote edge collectors and fleet health."
codeurl: "https://github.com/shreyanmitra/FleetHealthMonitoringSystem"
---

Fleet Health Monitoring System is a working reference for watching many remote edge bridge devices and aggregating health status for operators.<br>
<br>
Each bridge publishes telemetry over MQTT; a FastAPI service ingests messages and exposes a REST API; a Flask dashboard polls device status. The layout covers bridge agents, central host, and UI as a starting point for production hardening.
