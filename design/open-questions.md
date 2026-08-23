# Open Questions

**Status: RESEARCH**

These questions are unresolved and require further investigation, prototyping, or deliberation. They are organized by category but many span multiple concerns.

---

## Architecture

- **Formal schema for core primitives.** What are the concrete data structures and lifecycle state machines for intentions, commitments, situations, authority grants, outcomes, and adaptations? What operations are valid at each lifecycle stage?

- **Specification compilation.** How should the personal specification compile into runtime policy, generated interfaces, workflows, and declarative configuration? Is this a single compilation pass or an ongoing interpretive process?

- **Minimal bootstrapping.** What is the minimal post-installation scaffolding before the system has learned enough about the user to develop personal form? What does the system do usefully on day one versus day thirty?

---

## Evaluation

- **Experiential success metrics.** How to evaluate whether the system genuinely improves the user's experience without reducing human goals to brittle proxy metrics that can be gamed or over-optimized?

- **Goodhart resistance.** How to distinguish genuine improvement from Goodhart effects (optimizing the measure rather than the thing measured) or self-confirming beliefs (interpreting ambiguous evidence as validating current behavior)?

---

## Safety and Privacy

- **Retention policy design.** What retention policies preserve sufficient evidence for accountability and learning without becoming surveillance infrastructure? How does retention vary by data sensitivity, user preference, and legal context?

- **Hardware trust modeling.** How should hardware discovery, trust establishment, privacy context, and physical-safety authority be modeled? A microphone in a bedroom has different privacy implications than one in a home office.

- **Authority creep prevention.** How to prevent quiet expansion of system authority over time through incremental precedent, user habituation, or optimization pressure? What structural mechanisms (not just policies) enforce boundaries?

---

## Interaction

- **Cold-start experience.** What should the initial user experience be before the system knows anything about the user? How does the system provide value immediately while honestly communicating its current limitations?

- **Inspectability without overwhelm.** How to make the system's beliefs, inferences, confidence levels, and authority boundaries inspectable without requiring the user to become a system administrator? What is the right layering of detail?

---

## Technical

- **Perception substrate scalability.** Can the perception substrate handle real-time event volumes on consumer hardware (thousands of file events/second, continuous network monitoring, multiple input sources) without unacceptable resource consumption?

- **Capability granularity.** What is the right granularity for the capability broker's typed operations? Too coarse and authorization is meaningless; too fine and the overhead dominates. How does granularity adapt over time?

- **Graceful degradation.** How should model failures — hallucination, refusal, capability gaps, latency spikes, service outages — degrade gracefully? What falls back to cached behavior, what pauses, what escalates to the user?

---

## Community and Ecosystem

- **Extension ecosystem trust.** How to build an extension ecosystem that preserves the system's safety and trust properties? What combination of sandboxing, capability restrictions, reputation systems, and review processes is necessary?

- **Governance capture resistance.** How to prevent well-resourced actors (corporations, governments, organized groups) from capturing the project's direction through funding, contribution volume, or community influence? What structural governance mechanisms preserve the project's values?
