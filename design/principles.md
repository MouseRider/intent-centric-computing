# Foundational Principles

**Status: DESIGN PROPOSAL**

These principles guide all design decisions in the system. Each represents a deliberate choice with alternatives that were considered and rejected.

---

**1. Continuous responsibility, episodic reasoning.**
The system's obligations persist indefinitely; model invocations are bounded episodes within that continuity. A commitment does not expire when the conversation ends or the context window fills.

**2. The harness persists; models are replaceable.**
Models may be upgraded, swapped, or run in parallel. The system's identity and commitments survive any individual model change because they are maintained by the durable harness, not by model weights.

**3. Intentions, commitments, and policies are first-class primitives.**
The system explicitly manages evolving intentions, durable commitments, and composable policies alongside bounded operations. These are not implicit in conversation history — they are structured, queryable, and have defined lifecycles.

**4. Human attention is scarce and must be protected.**
Interruption must be proportional to importance. The system earns the right to interrupt by consistently delivering value exceeding the cost of attention consumed. Silence during routine success is a feature.

**5. Autonomy is domain-specific, risk-sensitive, and earned.**
The system may silently restart a crashed service but must ask before sending a message on the user's behalf. Authority varies by domain, is proportional to demonstrated competence, and is never self-granted.

**6. Every material action must be attributable and reconcilable.**
The system maintains records of what it intended, what it attempted, what it observed, and what actually happened. Discrepancies between intent and outcome are detected, investigated, and resolved.

**7. Self-improvement must be staged, tested, and reversible.**
Every adaptation — whether to rules, policies, models, or behavior — carries documented motivation, defined scope, test evidence, and a rollback path. The system does not silently evolve in ways that cannot be inspected or undone.

**8. Conversation is one interface, not the operating model.**
The system may present natural-language chat, generated graphical interfaces, progress views, application windows, ambient indicators, or no interface at all. The interaction modality adapts to the situation; the underlying reasoning is independent of presentation.

**9. Open scope does not imply unlimited authority.**
The system operates across the full digital environment — files, services, devices, networks, communications — but within explicit, inspectable boundaries. Breadth of awareness does not grant breadth of permission.

**10. Location and format may be abstracted; provenance must not.**
The system may present information without exposing where it is stored or how it is encoded. But for consequential conclusions — decisions, recommendations, claims — the supporting evidence chain must be preservable and inspectable on demand.

**11. The user is freed from technical concepts, not prohibited from using them.**
Progressive disclosure: the default experience requires no technical knowledge, but full expert control is always accessible. The system never hides complexity — it layers it.

**12. Hardware is a composable capability, not a fixed peripheral.**
Devices are semantically described capability providers that can be discovered, composed, and reasoned about. The system adapts to available hardware rather than requiring static configuration.

**13. The system resists oscillation, over-optimization, and quiet authority expansion.**
Stability, familiarity, reversibility, and preservation of options are explicit values. The system does not chase local optima at the expense of predictability, and it does not gradually accumulate authority through incremental precedent.

**14. Environmental content is untrusted data.**
Context compilation rigorously distinguishes between user instructions, system policy, tool execution results, observed environmental content, and model-generated hypotheses. Content from external sources is never treated as instruction.

**15. The AI must not become a new opinionated vendor.**
When multiple designs, workflows, or configurations are reasonable, the system exposes alternatives rather than imposing a single opinion. User agency means genuine choice, not just the ability to override defaults.
