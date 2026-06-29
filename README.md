# Endurance WhatsApp CRM - High Footfall Clinical Automation

## 🎯 Project Vision
An "Endurance Product" designed for dental and dermatology clinics to automate patient lifecycle management (scheduling, triage, follow-ups, and reviews) while maintaining extreme cost-efficiency, high reliability, and strict DPDP (India) compliance.

The core philosophy is to move away from "thin AI wrappers" and build a **Deterministic Task-Engine** that uses AI as a reasoning layer, not as the final executioner.

---

## 🏗️ Technical Architecture (Sovereign Stack)

### 1. Infrastructure Layer
- **PaaS:** Dokploy / Coolify (Self-hosted on VPS)
- **Server Location:** India (Mumbai/Bangalore) for DPDP compliance.
- **OS:** Ubuntu / Debian (Docker-based)
- **Cost Target:** ₹500 - ₹1000 / month.

### 2. The Intelligence & Logic Stack
- **Orchestrator:** n8n (Self-hosted, Low-Code)
- **LLM:** Gemini 1.5 Flash (via Google AI Studio / Vertex AI)
- **Memory/State:** PostgreSQL + pgvector
- **Lakehouse:** MinIO (Raw Chat Logs) + DuckDB (Analytics/Training)
- **Communication:** WhatsApp Cloud API (Direct Meta Integration)

### 3. Integration Layer
- **Calendars:** Google Calendar API
- **CRM Sync:** Custom Python agents (Integrating with Practo, HealthPlix, Liferay, etc.)
- **Dashboard:** AppSheet / Looker Studio (Human-in-the-Loop monitoring)

---

## 🚀 Core Features & Requirements

### A. WhatsApp Optimization
- **Free-Form Window:** Use QR-Hooks and "Nudge" messages to trigger patient responses, opening the 24-hour free-form window.
- **Deterministic Booking:** AI extracts intent $\rightarrow$ Code validates slot $\rightarrow$ Code books appointment. (No Hallucinations).

### B. Zero-Friction Onboarding
- **AI-Led Profiling:** New clinics onboard via a WhatsApp chat with the AI ( Collecting hours, pricing, and specialties).
- **One-Click Auth:** Google OAuth for immediate Calendar and Email access.

### C. Review & ROI Engine
- **Sentiment Trigger:** AI detects peak satisfaction markers.
- **Personalized Suggestions:** Generates unique, specific review drafts based on the patient's success story to increase Google SEO engagement.
- **Metric Tracking:** Track "Empty Slots Filled" and "No-Show Reduction" to prove hard ROI to clinic owners.

### D. The Kaizen Loop (Data Moat)
- **Day 1 Logging:** Every interaction stored in the MinIO Lakehouse.
- **Human-Corrected Dataset:** Filter chats where staff corrected the AI to create a "Golden Dataset."
- **Continuous Tuning:** Use this dataset to fine-tune a private clinical model on Vertex AI, creating a proprietary data moat.

---

## 🛡️ Compliance & Security (DPDP India)
- **Data Residency:** All PII (Personally Identifiable Information) stored on Indian servers.
- **Encryption:** AES-256 at rest (pgcrypto) and TLS 1.3 in transit.
- **Consent:** Mandatory Opt-in flow at the start of every patient interaction.
- **Data Isolation:** Multi-tenant Firestore/Postgres schema (`clinic_id` sharding).

---

## 💰 Cost Micro-Details (Est. Monthly)
| Item | Cost (INR) | Note |
| :--- | :--- | :--- |
| VPS (4vCPU, 8GB RAM) | ₹600 - ₹800 | Hetzner/DigitalOcean India |
| Domain/SSL | ₹50 | Amortized |
| AI Inference | ₹0 - ₹100 | Gemini 1.5 Flash Free Tier |
| **Total** | **₹650 - ₹950** | **Target: < ₹1000** |

---

## 🔄 Execution Roadmap (Loop Engineering)

1.  **Loop 1: The Revenue Generator** $\rightarrow$ Deterministic Booking $\rightarrow$ WhatsApp to Google Calendar.
2.  **Loop 2: The Staff Savior** $\rightarrow$ Triage $\rightarrow$ Patient Profiling $\rightarrow$ HITL Dashboard.
3.  **Loop 3: The Growth Engine** $\rightarrow$ Sentiment Review $\rightarrow$ Automated Follow-ups $\rightarrow$ ROI Reporting.
4.  **Loop 4: The Tech Moat** $\rightarrow$ Data Lakehouse $\rightarrow$ Human-Correction Filtering $\rightarrow$ Custom LLM Tuning.
