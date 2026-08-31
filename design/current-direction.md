# Current Design Direction

**Status: DESIGN PROPOSAL**

This note records the working synthesis from the latest design discussion. It narrows the project's direction without claiming that these choices are implemented or final.

## Interaction model

The environment should accept **multimodal and spatial intent**, not just text or a keyboard command. Depending on context, input may include speech, touch, gaze, gesture, pointer movement, physical position, nearby devices, and conventional controls. Accessibility is a first-class constraint: every important flow needs an inspectable, keyboard-operable alternative.

A full-screen HTML surface may be used as a portable **presentation and output canvas** for generated interfaces. It is not the primary mechanism for controlling legacy applications. Existing applications should expose structured APIs or accessibility semantics where possible; when only pixels are available, they may provide a **one-way visual stream** into the composed surface. Model-generated output must remain data interpreted by trusted renderers—never directly executed HTML, JavaScript, shell, QML, or native code.

When no suitable interface exists and engineering a durable one would delay the outcome, the system may construct an **ephemeral semantic projection** of a tool's output. A model can interpret complex structured output, logs, documents, screenshots, or streams and map the relevant parts into a constrained declarative view rendered by trusted HTML/canvas components. The projection may omit irrelevant items, replace raw elements with task-appropriate controls or explanations, and reorganize the result as the intention evolves. It is a disposable lens over evidence—not a claim that the underlying tool produced that interface.

Prefer structured components and deterministic canvas drawing over generated pictures: they are faster, accessible, inspectable, streamable, and independently updateable. Image generation is a last-resort illustrative aid, not a faithful or interactive representation. Every projected element should preserve source references and freshness; inferred or reconstructed content must be visibly distinguishable from source truth. Any action exposed by the projection maps to a typed capability and current underlying state rather than DOM manipulation, coordinates, or visual imitation.

## From fuzzy intent to dependable execution

Natural-language interpretation is probabilistic, but routine execution should not remain so. The system should compile an intention into a visible, typed workflow made mostly of deterministic operations, with narrowly bounded model-backed nodes only where semantic judgment is genuinely required.

When a user reviews and accepts an intention-to-outcome path, the system may preserve it as a **precedent**. A precedent records the interpreted intention, plan, approvals, capabilities, environmental assumptions, result, provenance, and user corrections. Reuse is conditional rather than blind: changed inputs, permissions, software, devices, or risk can force re-planning or renewed approval.

## Living workflow families

A workflow is not a frozen macro. Each useful intent may develop into a versioned family of variants, with explicit lineage, tests, observations, and rollback. At invocation time, the runtime selects or adapts a variant for the current environment: available tools, models, hardware, permissions, data locality, latency, cost, privacy, and accessibility requirements.

Optimization may run on a schedule or in response to meaningful events such as a model upgrade, tool/API change, repeated failure, hardware arrival, or a user's correction. Proposed variants should be evaluated in a sandbox or replay harness and promoted only when they preserve policy and improve measured outcomes. High-impact changes remain reviewable and reversible.

## Frontier-to-local compilation

Frontier models can be used during exploration to interpret unfamiliar intentions, construct plans, generate test cases, and identify the smallest uncertain steps. Successful paths should then be **compiled downward**: replace broad model calls with typed code, rules, retrieval, compact local models, or cached artifacts wherever evidence supports doing so.

This is not a promise that every task can become deterministic or local. It is an optimization objective: recurring work should become faster, cheaper, more private, more explainable, and less dependent on remote inference while preserving an escalation path for genuinely novel cases.

## Hardware and just-in-time sensing

The intended baseline is capable modern hardware rather than the weakest possible machine. Local accelerators, plentiful memory, fast storage, and low-latency networking make continuous perception, local inference, simulation, and rich generated interfaces practical. The architecture should still degrade transparently when resources are constrained.

Capabilities are discovered and composed just in time. External sensors or actuators—including cameras, microphones, robots, vehicles, or drones—may be requested when an intention needs information or action beyond the current device. Discovery never grants authority: use requires explicit capability mediation, privacy boundaries, safety policy, visible state, and context-appropriate approval. Autonomous physical operation remains a high-risk domain and must fail safe.

## Prototype implications

The first vertical slice should demonstrate:

1. multimodal invocation with a keyboard-accessible fallback;
2. a visible intention-to-plan transformation;
3. a generated full-screen presentation rendered from trusted components;
4. a deterministic workflow with at least one bounded semantic node;
5. preview and approval before consequential effects;
6. capture of an accepted run as a versioned precedent;
7. replay under a changed environment, showing variant selection or re-planning;
8. provenance, cancellation, failure handling, and rollback.

The current [proof-of-concept foundation recommendation](../research/poc-foundation-recommendation.md) remains a tactical way to test this slice. Its shell, compositor, agent runtime, and UI protocol choices are replaceable; the trust and workflow boundaries are the durable experiment.
