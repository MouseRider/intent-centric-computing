# Design Philosophy

**Status: DESIGN PROPOSAL**

This document describes the philosophical foundations of intent-centric computing: a system that maintains persistent responsibility for its user's digital environment, reasons about the world through multiple complementary models, and acts with calibrated autonomy proportional to earned trust.

A key philosophical commitment: from the user's perspective, the operating system as a concept disappears. "Operating system" is an engineering abstraction. The user experiences a responsive environment that fulfills intentions — they never need to think in terms of apps, files, windows, or system settings unless they choose to.

---

## Semantic Reconciliation

The system maintains four world-models that together constitute its understanding and basis for action:

**1. Observed world** — timestamped, provenance-bearing evidence gathered from sensors, APIs, file systems, network events, user interactions, and external services. Every observation carries metadata: when it was recorded, how it was obtained, what confidence applies, and what limitations bound its accuracy. The observed world is append-only in principle; corrections are new observations, not retroactive edits.

**2. Believed world** — an uncertainty-aware interpretation of current reality synthesized from observations. Beliefs have confidence levels, supporting evidence chains, known gaps, and expiration conditions. The believed world acknowledges what is unknown and distinguishes between "no evidence of X" and "evidence of not-X." Beliefs may conflict; the system maintains competing hypotheses when evidence is ambiguous rather than prematurely collapsing to a single interpretation.

**3. Intended world** — the constellation of goals, commitments, invariants, preferences, constraints, and acceptable futures that define what the user wants reality to become or remain. Intentions range from explicit instructions ("keep my inbox below 50 unread") to inferred preferences ("this user prefers morning notifications") to hard constraints ("never send email without confirmation"). The intended world is not a single target state but a space of acceptable futures, some more preferred than others.

**4. Predicted world** — expected consequences of acting or not acting, given current beliefs and available interventions. Predictions are conditional: "if action A is taken, outcomes B1, B2, B3 follow with respective likelihoods." The predicted world also models inaction — what happens if the system does nothing — because sometimes the cost of intervention exceeds the cost of the problem.

**Reconciliation** is the continuous process of comparing these four models. When belief diverges from intention, the system evaluates interventions through predicted consequences and chooses the smallest justified action that moves the believed world toward the intended world without unacceptable side effects. Reconciliation is bidirectional: sometimes the appropriate response to a divergence is not to change the world but to update beliefs, refine predictions, or even suggest that the user reconsider an intention that appears to conflict with their other goals.

The system does not optimize a single objective function. It balances competing concerns, preserves optionality, and recognizes that many situations have no single correct response — only responses with different trade-off profiles that the user may evaluate differently depending on context.

---

## Continuous Responsibility, Episodic Reasoning

The system's obligations persist indefinitely. A commitment to "ensure backups run nightly" does not expire when the current conversation ends, when the model context fills, or when the underlying model is upgraded. The system remembers what it promised and continues to fulfill those promises across arbitrary time horizons.

Model invocations, by contrast, are bounded episodes. Each reasoning episode has a finite context window, limited computation budget, and specific triggering conditions. The harness — not the model — is the durable entity. It maintains state, tracks commitments, schedules observations, and invokes models as cognitive resources when reasoning is needed.

Models are replaceable. A commitment made during an interaction with one model version remains binding when a newer model handles subsequent episodes. The system's identity inheres in its accumulated state, commitments, and relationship with the user — not in any particular model's weights or capabilities.

This separation means the system can reason about its own cognitive limitations: it knows when an episode's context is insufficient, when a problem exceeds current model capabilities, and when to defer reasoning to a future episode with better information.

---

## Perception Substrate

Between the raw chaos of operating system events and the focused reasoning of language models lies a deterministic perception layer:

Raw events → normalized facts → current-state projections → meaningful transitions → situations → attention decisions → bounded context → LLM reasoning.

The perception substrate handles volumes that would be absurd to present to a language model: thousands of file system events per second, continuous network traffic, periodic sensor readings, application state changes. It applies deterministic rules — deduplication, debouncing, windowed aggregation, threshold detection, state machine transitions, statistical anomaly detection — to reduce this torrent to a manageable stream of meaningful situations.

The LLM reasons selectively; the system observes continuously. Most of what happens in the user's digital environment requires no reasoning at all — only faithful observation and mechanical response. The model is invoked when genuine judgment is needed: ambiguous situations, novel contexts, competing priorities, or decisions that require understanding intent rather than following rules.

---

## Attention Hierarchy

Not all events deserve equal consideration. The system prioritizes based on:

- **Relevance** to active commitments and stated goals
- **Urgency** — time-sensitivity and deadline proximity
- **Consequence** — magnitude and reversibility of potential outcomes
- **Novelty** — deviation from established patterns
- **Uncertainty** — situations where the system's confidence is low
- **Authority** — whether the situation exceeds the system's delegated autonomy
- **Interruption cost** — the value of what the user is currently doing

Human attention is the scarcest resource in the system. Every notification, question, or status update competes against whatever the user would otherwise be doing. The system must earn its interruptions by consistently delivering value proportional to the attention consumed.

Silence during routine success is a feature, not a bug. A system that reports every successful backup, every resolved transient error, every routine maintenance task is a system that trains its user to ignore it.

---

## Stewardship Model of Autonomy

The system operates at six levels of autonomy, selecting the appropriate level for each action based on domain, risk, reversibility, and earned trust:

1. **Observe** — notice and record without acting or reporting
2. **Recommend** — present analysis and suggested actions for user decision
3. **Prepare** — stage an action for one-click user approval
4. **Act and report** — execute and inform the user what was done
5. **Act silently** — execute routine, reversible, low-risk actions without notification
6. **Escalate** — recognize that risk, novelty, or consequence exceeds delegated authority and actively seek guidance

Authority is not uniform across domains. The system might silently restart a crashed service (level 5) while requiring explicit approval to send an email on the user's behalf (level 3). Authority depends on: domain-specific delegation, reversibility of the action, financial or social cost of error, privacy implications, system confidence in its understanding, user presence and availability, and historical trust established through successful past actions.

Authority is earned through demonstrated competence and never self-granted. The system may suggest that it could handle a class of decisions autonomously, but the user must explicitly delegate that authority.

---

## User Model with Preserved Uncertainty

The system builds an evolving model of the user — their preferences, patterns, priorities, and constraints — while maintaining rigorous honesty about the quality of that knowledge:

- **Explicit instruction** — the user directly stated a preference or rule. Highest confidence.
- **Explicit preference** — the user chose between alternatives, revealing a preference. High confidence within the observed context.
- **Repeated behavior** — the user consistently acts in a pattern. Moderate confidence, subject to contextual variation.
- **Tentative inference** — the system hypothesizes a preference from indirect evidence. Low confidence, requires validation before consequential use.
- **Contextual exception** — a deviation from pattern that may indicate context-dependence rather than preference change.

The system does not treat silence as consent, prediction as intention, or correlation as preference. When acting on inferred preferences, the system holds its inferences lightly — ready to update, retract, or ask rather than assuming its model is correct. A user who has not objected to a behavior may simply not have noticed it, and the absence of complaint is weak evidence of approval.
