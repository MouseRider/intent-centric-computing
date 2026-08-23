# Prior-Art Landscape

> **Status: `RESEARCH`**

## Overview

Several projects explore facets of intent-centric computing — agent-operated interfaces, malleable software, generative UI, personal AI operating systems. None yet combine the full synthesis: intent-first interaction, user ownership, universal operation, persistent context, generated interfaces, safe self-modification, and cross-device composition. This document maps the territory fairly, acknowledges what each project contributes, and identifies the space that remains unoccupied.

## Prior Art Map

### Omarchy

**URL:** https://omarchy.org/  
**Core contribution:** Agent-modifiable Linux with first-class AI integration.

Omarchy is a Linux distribution (built on Arch/Hyprland) designed so that AI agents can modify the operating system itself — configuration, theming, window management, system behavior. DHH's accompanying essay "The Malleable Computer" articulates the vision: AI compresses the complexity of system modification so that non-experts gain practical control over their computing environment.

**What it addresses:** Level 2 of the conceptual ladder — agent-modifiable computing. It demonstrates that an AI can safely alter a running system's configuration and that users benefit from this.

**Where it stops short:** Omarchy preserves the traditional ontology of applications, windows, files, and processes. The user still thinks in terms of "open this app, configure that setting." Intent remains implicit rather than being the primary abstraction. There is no persistent model of user goals, commitments, or context that spans sessions and devices.

### Ink & Switch — Malleable Software

**URL:** https://www.inkandswitch.com/essay/malleable-software/  
**Core contribution:** A philosophy and research program for software that users can reshape at point of use.

Ink & Switch argues that software should not be a fixed artifact delivered by developers to passive consumers. Users should be able to modify, compose, and extend their tools without becoming full-time programmers. Their research explores local-first data, CRDTs, and end-user modification.

**What it addresses:** The malleability dimension — the principle that computing should bend to the user rather than the reverse.

**Where it stops short:** The work is primarily philosophical and prototype-level. It does not propose a unified interaction model (intent-first), does not address persistent context or cross-device composition, and does not incorporate AI agents as a mechanism for enabling malleability at scale.

### Brain / Natural AI

**URL:** https://brain.ai/  
**Core contribution:** Intent-over-applications interaction; generative interfaces.

Brain Technologies builds a commercial product where users express intentions ("book a flight to Tokyo next Tuesday") and the system fulfills them without requiring the user to navigate individual applications. Interfaces are generated per-request rather than pre-built.

**What it addresses:** Intent-first interaction and generative UI. It demonstrates commercially that users can operate above the application layer.

**Where it stops short:** Brain is a centralized, proprietary service. The user does not own or control the system. There is no self-modification capability, no persistent context model that the user can inspect, no cross-device composition, and no open architecture that others can build upon.

### Open Interpreter / 01

**URL:** https://01.openinterpreter.com/getting-started/introduction  
**Core contribution:** Open conversational computing across software and hardware.

Open Interpreter enables AI to execute code on the user's machine via natural language. The 01 project extends this to a hardware device — a portable conversational computer that can operate across applications and services.

**What it addresses:** Agent-operated computing (Level 1) with open-source principles. It proves that conversational interaction can drive general-purpose computation.

**Where it stops short:** The system operates existing software rather than transcending it. There is no persistent intention model, no malleability of the system itself, no generated interfaces, and no architectural distinction between "using apps" and "expressing intent." It is a powerful agent layer atop conventional computing.

### OpenDAN

**URL:** https://github.com/fiatrete/OpenDAN-Personal-AI-OS  
**Core contribution:** Personal AI OS with access to files, services, IoT, and multi-agent coordination.

OpenDAN proposes a personal AI operating system where multiple AI agents collaborate to manage a user's digital life — files, communications, smart home devices, online services.

**What it addresses:** Multi-agent personal computing, the idea that AI should have broad access to a user's digital environment rather than being siloed in individual apps.

**Where it stops short:** OpenDAN retains the concept of "AI managing apps and services on your behalf" rather than replacing the app abstraction entirely. It does not propose intent as the primary abstraction, does not generate interfaces dynamically, and its architecture is agent-centric (agents as actors) rather than intent-centric (intentions as the primary objects).

### Generative UI (Google et al.)

**URL:** No single canonical URL — this is an emerging concept across multiple companies.  
**Core contribution:** Interfaces generated per-request rather than pre-built.

Google, Vercel, and others have demonstrated systems where UI components are generated dynamically in response to user queries. Rather than navigating to a pre-built page, the user receives a bespoke interface tailored to their current need.

**What it addresses:** The generated-interface dimension — proving that static, pre-built UI is not the only option.

**Where it stops short:** Generative UI as currently practiced is a feature within existing systems (chatbots, search engines), not a new computing paradigm. It lacks persistent context, user ownership, self-modification, and the intent-as-primary-abstraction framing. The generated interfaces are ephemeral and disconnected.

## Historical Lineage

The ideas underpinning intent-centric computing have deep roots:

- **Alan Kay & Adele Goldberg — Personal Dynamic Media (1977):** The Dynabook vision imagined computing as a personal, creative medium that users shape to their needs. The computer serves the user's intentions rather than imposing fixed workflows.

- **J.C.R. Licklider — Man-Computer Symbiosis (1960):** Licklider envisioned humans and computers as collaborators in real-time thinking. The computer handles the procedural burden so humans can focus on goals and judgment — a direct ancestor of intent-first interaction.

- **Smalltalk — Inspectable, Alterable Environments:** Smalltalk demonstrated that a computing environment could be fully transparent and modifiable by its user. Every object could be inspected, every behavior altered. This is the purest historical precedent for safe self-modification.

- **Apple Knowledge Navigator Concept (1987):** A video prototype showing a conversational agent that understands context, manages commitments, and operates across information sources. Remarkably prescient; the technology was decades away.

## Synthesis: What Remains Distinctive

The unique contribution of intent-centric computing is the combination of all dimensions simultaneously:

1. **Intent-first interaction** — the user's desired state is the primary input, not commands or navigation
2. **User ownership and malleability** — the user controls and can reshape the system
3. **Universal operation** — works across all digital capabilities, not siloed
4. **Persistent context** — continuous understanding of environment, history, commitments
5. **Generated interfaces** — UI composed dynamically from intent and context
6. **Safe self-modification** — the system can alter its own behavior within policy bounds
7. **Cross-device composition** — seamless operation across hardware boundaries

No existing project combines all seven. Each addresses one to three dimensions. The architectural challenge — and the research opportunity — is achieving all simultaneously in a coherent, user-owned system.

## Comparison Table

| Project | Intent-first | Malleable | Persistent context | Self-modifying | Cross-device | User-owned | Open source |
|---|---|---|---|---|---|---|---|
| Omarchy | No | Yes | No | Yes | No | Yes | Yes |
| Ink & Switch | No | Yes | Partial | No | Partial | Yes | Partial |
| Brain / Natural AI | Yes | No | Partial | No | Partial | No | No |
| Open Interpreter / 01 | Partial | No | No | No | Partial | Yes | Yes |
| OpenDAN | Partial | Partial | Partial | No | Yes | Yes | Yes |
| Generative UI | Partial | No | No | No | No | No | No |
| **This project (target)** | **Yes** | **Yes** | **Yes** | **Yes** | **Yes** | **Yes** | **Yes** |
