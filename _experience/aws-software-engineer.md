---
title: "Software Engineer, Amazon Web Services"
collection: experience
type: "Experience"
permalink: "/experience/aws-software-engineer/"
date: 2026-06-01
finished: 2026-09-01
venue: "Amazon Web Services (AWS)"
location: "Bellevue, WA"
portfolio_category: "Industry"
role: "Software Engineer"
summary: "Built agent orchestration and A2UI integrations for AWS data-center teams; owned 36 packages and shipped 188 change requests."
---

Built core agent orchestration and A2UI integrations for AWS data-center teams to query live schedule/risk data via an internal AI assistant. Owned 36 packages; authored 225 CRs (188 shipped) across TS, Python, and AWS CDK. Estimated business savings $400 billion after global rollout.
<br>
<br>
<ul>
<li><b>A2UI Integration (React, TS, Zod):</b> Spearheaded agent-to-UI contract and widget spec adopted by partner team. Developed production POC with 21 component adapters and strict runtime contract with a fail-closed validator.</li>
<li><b>Schedule Analysis Engine (Python, Bedrock, MCP):</b> Built critical-path engine over Primavera P6 XER exports as a remote MCP server on Bedrock. Added HTTP transport, presigned URLs, hierarchical auth, and DynamoDB lock; fixed a 30s timeout via AWS ADOT runner.</li>
<li><b>Data-Lake Query Service (Fargate, Athena, Redshift):</b> Built read-only MCP service over live build data with policy router (Athena for serverless scaling; Redshift dormant via a reversible flag).</li>
<li><b>Assistant Connector (TS, Lambda, DynamoDB):</b> Managed integration across 3 transport generations (Custom→ACP→HTTP streaming) with atomic lock, 3s ack path, and fail-closed harness. Extracted standalone ACP package (73 unit tests, 17/17 smoke tests) fixing stateless prompts via bounded transcripts.</li>
<li><b>Incident Analysis:</b> Launched incident post-mortem MCP service. Resolved platform-wide SigV4 signing defect blocking all registered services, fixed an OTel bug in shared services, and improved upstream system instructions.</li>
<li><b>Toolkit &amp; Analytics:</b> Built agent toolkit adopted by BI org. Integrated usage metrics into company AI adoption dashboard with batched uploads and cost-center attribution.</li>
<li><b>Practice:</b> Convened architecture reviews with senior/principal engineers; wrote 9-doc, ~135-page handoff package (22 diagrams, 13 deep-dives) to ensure long-term system survival.</li>
</ul>
<br>
Tech: TS, Python, AWS (CDK, Lambda, Fargate, DynamoDB, Athena, Redshift), Bedrock AgentCore, MCP, ACP, SigV4, OpenTelemetry/ADOT, React, Zod, Streamlit, Mermaid.
