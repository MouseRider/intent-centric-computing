# System Architecture

**Status: DESIGN PROPOSAL**

> **Note: This architecture is PROPOSED, not implemented. It represents design intent based on analysis of requirements. No code exists for these components yet.**

---

## High-Level Architecture

```
┌─────────────────────────────────────────────────┐
│              User / Interfaces                    │
│ (multimodal intent, trusted generated UI, apps)  │
└──────────────────────┬──────────────────────────┘
                       │
┌──────────────────────▼──────────────────────────┐
│            AI Runtime (unprivileged)              │
│  reasoning, models, memory, world model, UI gen  │
└──────────────────────┬──────────────────────────┘
                       │ typed requests
┌──────────────────────▼──────────────────────────┐
│      Capability Broker (small, privileged, Rust)  │
│  validation, authorization, execution,            │
│  verification, audit, rollback                    │
└──────────────────────┬──────────────────────────┘
                       │
┌──────────────────────▼──────────────────────────┐
│     Linux APIs / Services / Kernel / Devices      │
└─────────────────────────────────────────────────┘

┌─────────────────────────────────────────────────┐
│         Extension Sandbox (isolated)              │
│  generated/downloaded integrations (WASM/containers) │
└─────────────────────────────────────────────────┘
```

---

## Trust Domains

The architecture separates concerns into four trust domains with distinct privilege levels and communication boundaries:

**Unprivileged AI session** — Contains all reasoning, model invocations, memory management, world-model maintenance, and UI generation. This domain has no direct access to system resources. It can only affect the outside world by issuing typed requests to the capability broker. A compromised or misbehaving AI session cannot damage the system beyond its own state.

**Privileged capability broker** — A small, auditable, formally verifiable component written in Rust. It receives typed requests from the AI session, validates them against current authorization policies, executes permitted operations, verifies outcomes, maintains an audit log, and provides rollback capabilities. Its attack surface is minimized by design: it does only what is explicitly requested through a well-defined protocol, never interprets natural language, and never makes judgment calls about intent.

**Linux substrate** — The kernel, device drivers, system services, and hardware that provide actual capabilities. The capability broker mediates all access; no other component communicates directly with this layer.

**Extension sandbox** — Third-party and system-generated integrations run in isolation (WASM modules, containers, or other sandboxing mechanisms). Extensions cannot access the AI session's memory, the user's data, or system resources except through explicitly granted, revocable capabilities. A malicious extension is contained to its sandbox.

---

## Two-Protocol Design

The system uses two complementary protocols for different purposes:

**MCP (Model Context Protocol, developed by Anthropic)** serves ecosystem integration. It provides a standardized interface for connecting to external tools, services, and data sources. MCP is used for: prototyping new integrations, connecting to third-party services, exposing capabilities to other MCP-compatible systems, and any interaction where ecosystem compatibility matters more than performance or control.

**Native Unix-socket protocol** serves the internal control plane. It provides capabilities that MCP does not support well: mutual authentication between components, persistent event subscriptions with backpressure, bidirectional streaming, request cancellation and deadlines, idempotency keys for safe retries, multi-operation transactions, and coordinated rollback. This protocol connects the AI runtime to the capability broker and handles all privileged operations.

The two protocols coexist: MCP for breadth and compatibility, the native protocol for depth and control. An integration may start as an MCP connection during prototyping and migrate to the native protocol when tighter integration is needed.

---

## Perception Substrate

The perception substrate is a deterministic processing layer between raw operating system events and the AI runtime's reasoning. It handles event volumes that would overwhelm language model context windows and reduces them to meaningful, actionable situations.

Processing techniques include:

- **Deduplication** — collapsing identical or near-identical events within time windows
- **Debouncing** — suppressing rapid event bursts until stability is reached
- **Windowed counters** — tracking event rates and detecting anomalies
- **State machines** — modeling expected system states and detecting unexpected transitions
- **Threshold detection** — triggering attention when metrics cross defined boundaries
- **Temporal joins** — correlating events across different sources within time windows
- **Statistical baselines** — learning normal patterns and detecting deviations

The perception substrate is entirely deterministic and rule-based. It does not use machine learning or language models. Its behavior is predictable, inspectable, and debuggable. Rules may be generated or suggested by the AI runtime but are executed mechanically once deployed.

The broader execution layer follows the same bias without pretending all semantic work is deterministic. Intent is compiled into typed, inspectable workflows whose ordinary nodes execute mechanically. Model-backed nodes are permitted only at explicit fuzzy boundaries, with constrained inputs and outputs, recorded model identity, confidence or uncertainty where meaningful, and policy-controlled escalation.

Accepted runs can become versioned **precedents** and workflow families. Each record binds the interpreted intent to its plan, approvals, capabilities, environmental assumptions, outcome, provenance, and user corrections. Above them sits a durable intent specification: desired outcome, acceptable experience, invariants, authority envelope, and verification criteria. A reconciler compares that desired state with observed user, system, and ecosystem state, then chooses, composes, repairs, or replaces workflow variants until convergence is verified.

Early use is an acquisition phase with frequent synthesis. Repeated accepted runs should extract stable reusable subflows, transforms, policies, UI projections, and checks into a composable repertoire. As coverage grows, ordinary operation shifts toward deterministic execution and quiet maintenance: scheduled research and replay, plus event-driven reassessment when capabilities or evidence change. The reconciler may transparently substitute underlying applications, models, adapters, or services because user presentation and capability bindings are system-owned. Transparency of operation does not remove accountability: every substitution retains lineage, comparison evidence, auditability, and rollback. New authority, changed externally visible semantics, or failure to satisfy the intent contract requires review rather than silent promotion.

---

## Capability and Hardware Model

Hardware is represented semantically rather than as fixed device nodes. Each piece of hardware is described by:

- **What it enables** — capabilities provided (display, audio capture, storage, networking, computation)
- **Location** — physical and network topology
- **Availability** — current status, reliability history, power state
- **Quality** — resolution, bandwidth, latency, capacity
- **Connection method** — how to reach it, what protocols it speaks
- **Privacy context** — what data it can observe, who else has access
- **Trust status** — verified, unverified, compromised, unknown

Discovery does not imply permission. The system may detect a new device on the network without automatically gaining authority to use it. Permission flows from user delegation, not from technical capability.

Hardware composition means the system can reason about combining capabilities: "the user wants to present slides" might involve a laptop display, a projector, a wireless connection, and speaker output — assembled dynamically rather than configured statically.

Output selection also creates an input-binding context. Every active presentation endpoint advertises its associated controls and sensors—such as touch, stylus, keyboard, mouse, trackpad, remote, controller, microphone, camera, or paired companion device. The interaction broker binds valid endpoint inputs to the presented activity and fuses them with spatial modalities using event time, focus, device and user identity, locality, trust, and authority. Input availability follows the experience across devices; attachment or proximity alone never grants control, and simultaneous endpoints require explicit focus and conflict-resolution rules.

The target baseline is capable modern hardware with enough local compute, memory, storage, and connectivity for low-latency inference and rich composition. Degraded modes should be explicit rather than silently weakening privacy, quality, or safety. External sensing and actuation—including robots or drones—can be acquired just in time through the same capability model, with stricter safety policy and visible user control for physical-world effects.

Generated full-screen HTML may serve as a presentation/output surface when rendered through trusted components. It is not a privileged input channel into legacy applications, and generated HTML or JavaScript is never executed as authority-bearing code. Conventional applications should expose structured interfaces or accessibility semantics; pixel-only applications may contribute a one-way visual stream without thereby receiving control of the intent runtime.

If a tool has no suitable UI, a projection adapter may turn its complex output into an ephemeral, intention-specific declarative view. The adapter keeps source evidence and freshness metadata, marks inferred or reconstructed content, and emits only catalog components plus typed capability references. It may filter, replace, aggregate, or reorganize presentation elements without mutating or pretending to reproduce the source application. Trusted HTML/canvas rendering is the normal path; generated images are reserved for non-authoritative illustration because they are slower and harder to inspect, update, and make accessible.
