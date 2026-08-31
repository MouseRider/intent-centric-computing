# Roadmap

**Status: VISION — all phases are provisional and subject to revision based on evidence, community input, and changing landscape.**

This roadmap describes the anticipated evolution of the Intent-Centric Computing project. It is not a commitment or a schedule. Phases may be reordered, merged, split, or abandoned as understanding deepens.

---

## Phase 0: Research and community building (current)

This is where the project currently lives. The focus is on establishing foundations and finding collaborators.

- Publish manifesto and design philosophy
- Map the landscape of related work (academic research, existing systems, adjacent projects)
- Identify potential collaborators across relevant disciplines (HCI, systems, PL theory, AI safety, accessibility)
- Refine principles through public discussion and constructive critique
- Produce an architecture specification document that translates principles into structure
- Develop shared vocabulary and precise definitions for core concepts

**Timeline:** Open-ended. This phase is complete when the community agrees the design is ready to specify formally. Rushing past research produces brittle architecture.

---

## Phase 1: Architecture specification

Translate research and design philosophy into a concrete technical architecture.

- Define core primitives: intentions, commitments, policies, events, operations — with formal semantics where possible
- Define precedents and versioned workflow families, including applicability, lineage, testing, promotion, rollback, and renewed-approval rules
- Specify how probabilistic intent resolution compiles into deterministic operations with explicit, bounded semantic nodes
- Specify the perception substrate: how the system observes and models the user's computational environment
- Design the attention architecture: how relevance is determined, how information is filtered and prioritized
- Design the capability broker and trust model: how the system gains, constrains, and delegates authority
- Produce a detailed architecture document with formal interfaces between components
- Validate the architecture against real-world scenarios: common workflows, edge cases, adversarial conditions, accessibility needs

**Timeline:** Dependent on community formation. Cannot begin meaningfully until Phase 0 produces sufficient shared understanding.

---

## Phase 2: Prototype

Build the minimum necessary to test core assumptions.

- Use the disposable Linux shell path in [research/poc-foundation-recommendation.md](research/poc-foundation-recommendation.md) to test a narrow vertical slice; preserve replaceable protocol and trust boundaries
- Demonstrate multimodal invocation with keyboard fallback and a trusted full-screen generated presentation surface
- Demonstrate an ephemeral semantic projection that converts one tool's overly complex output into a task-specific HTML/canvas view while preserving provenance, freshness, accessibility, and typed actions
- Compile the intent into a visible typed workflow, with deterministic nodes and at least one bounded semantic node
- Save an approved run as a versioned precedent, then replay it under a changed environment to exercise selection or re-planning
- Test frontier-to-local compilation by replacing one recurring model step with a typed rule, compact local model, or cached artifact
- Exercise just-in-time capability discovery in simulation before attempting external physical sensors or actuators
- Key validation questions:
  - Can intent resolution work at interaction speed (sub-second for simple intents)?
  - Can the perception substrate handle real event volumes without degrading user experience?
  - Is the trust model practical — does it provide safety without creating friction that drives users to bypass it?
- Success criteria defined explicitly before implementation begins
- Prototype is for learning, not for shipping — expect to discard and rebuild

**Timeline:** TBD. Begins only when Phase 1 produces a specification concrete enough to implement against.

---

## Phase 3: Community infrastructure

Build the social and organizational structures needed for sustained collaboration.

- Issue templates and contribution workflows tailored to the project's needs
- Discussion forums or spaces for longer-form conversation
- Contributor onboarding documentation and mentorship pathways
- Governance formalization based on actual community composition
- Partnership and integration exploration with adjacent projects
- Extension API design — how external developers can build on the platform

**Timeline:** Overlaps with other phases. Some elements begin during Phase 0; full formalization happens as community scale demands it.

---

## Non-goals for the foreseeable future

These are explicitly out of scope. This list exists to set expectations and prevent scope creep.

- **Production-ready releases.** The project will not ship production software until the design is validated through prototyping and community review.
- **Commercial partnerships.** Corporate involvement is welcome as contribution, not as direction-setting. No commercial partnerships that constrain the project's independence.
- **Branding or marketing campaigns.** The project grows through substance, not promotion.
- **Competition with existing projects.** A collaborative relationship with related work is preferred. The goal is to advance understanding, not to capture market share.

---

All phases are provisional. The only constant is the commitment to the foundational principles: user sovereignty, transparency, and honest uncertainty about what we do not yet know.
