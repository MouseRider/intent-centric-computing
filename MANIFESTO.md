# Manifesto: Intent-Centric Computing

> **Status: `VISION`**

## What we propose

We are designing a computing environment where the user expresses desired experiences and outcomes, and the system discovers how to realize them — across software, hardware, and services. Applications become implementation details. Interfaces form around the task at hand. The system itself is safely malleable.

## The problem

Every computer you use was designed by someone else. The applications, the desktop, the notification model, the way files are organized, the boundaries between programs — all of these reflect choices made by vendors and developers, not by you.

Open-source operating systems like Linux offer theoretical freedom: everything is inspectable, modifiable, and redistributable. In practice, exercising that freedom requires deep technical expertise. The gap between "you are permitted to change this" and "you can actually change this" remains vast for most people.

The result is that even on open platforms, most users operate within paradigms designed for them rather than by them. Computing is organized around applications, windows, menus, and notifications — abstractions that have remained largely unchanged for decades despite radical advances in hardware, connectivity, and now artificial intelligence.

## The AI inflection point

Large language models change a fundamental constraint. For the first time, translating human intention into machine procedures is becoming feasible at a general level. A person can describe what they want in natural language, and a system can interpret, plan, and execute — not just within one application, but across the full scope of a computing environment.

This creates an opportunity to rethink the operating model of personal computing from first principles.

## The vision: intent-native computing

We distinguish three levels of AI integration with an operating environment:

1. **Agent-operated** `IMPLEMENTATION` — An AI agent uses existing applications on the user's behalf: clicking buttons, typing commands, calling APIs. The applications and their interfaces remain unchanged.

2. **Agent-modifiable** `IMPLEMENTATION` — An AI agent can modify applications, configuration, and system behavior. The user gains practical malleability, but the underlying ontology of apps, windows, files, and settings persists.

3. **Intent-native** `VISION` — The user's desired state is the primary abstraction. Applications are implementation-level capability providers. Interfaces are composed dynamically for the task. The system maintains a continuous understanding of the user's environment, intentions, and commitments — and acts as a steward of that environment over an indefinite lifespan.

This project targets level 3. Levels 1 and 2 are useful stepping stones, but the architectural goal is a system where "which app do I use?" is no longer a question the user needs to answer.

## Core principles

The following principles guide the design. Each is a deliberate architectural commitment, not an aspiration.

**1. Continuous responsibility, episodic reasoning.** The system's obligations persist indefinitely. Model invocations are bounded episodes within that continuity. The harness — not the model — is the durable entity.

**2. The harness persists; models are replaceable cognitive resources.** Models may be upgraded, swapped, or become unavailable. The system's identity, commitments, and state survive these changes.

**3. Intentions, commitments, and policies are first-class primitives.** The system does not merely execute tasks. It manages evolving intentions ("keep my photos organized"), durable commitments ("remind me before deadlines"), and policies ("never publish without approval") — alongside bounded operations.

**4. Human attention is scarce and must be protected.** The system should know when interaction is valuable. Silence during routine success is a feature. Interruption must be proportional to importance.

**5. Autonomy is domain-specific, risk-sensitive, and earned.** The system may silently restart a crashed service but must ask before sending a message. Authority varies by domain, reversibility, confidence, and historical trust.

**6. Every material action must be attributable and reconcilable.** The system maintains models of what it intended, what it attempted, what it observed, and what actually happened — and reconciles discrepancies.

**7. Self-improvement must be staged, tested, and reversible.** The system can modify its own capabilities and environment, but every adaptation must have a motivation, scope, test evidence, and rollback path.

**8. Conversation is one interface, not the operating model.** The system may present a chat reply, a generated control panel, a progress view, a conventional application window, or no interface at all — whatever suits the moment.

**9. Open scope does not imply unlimited authority.** The system operates across the full computing environment but within explicit, inspectable boundaries.

## What this is not

This is not a chatbot bolted onto a desktop. It is not a launcher, a shell wrapper, an AI sidebar, or a new desktop theme. It is not a system that requires the user to become the AI's project manager, constantly prompting and supervising.

It is a proposal for a fundamentally different relationship between a person and their computing environment — one where the person expresses meanings and desired experiences, and the system handles the mechanics.

## Relationship to prior work

Several projects and research efforts explore parts of this space:

- [Omarchy](https://omarchy.org/) builds an opinionated Linux environment with first-class AI agent support and system-level malleability. It demonstrates agent-modifiable computing on open infrastructure.
- [Ink & Switch](https://www.inkandswitch.com/essay/malleable-software/) articulates a philosophy of malleable software where users reshape tools at the point of use.
- [Brain](https://brain.ai/) frames its work around organizing computing by human intent rather than applications and menus.
- [Open Interpreter / 01](https://01.openinterpreter.com/getting-started/introduction) presents an open conversational computing platform spanning software and hardware.
- [OpenDAN](https://github.com/fiatrete/OpenDAN-Personal-AI-OS) consolidates personal agents with access to filesystems, services, and devices.

The historical lineage includes Alan Kay and Adele Goldberg's vision of personal dynamic media, Licklider's human-computer symbiosis, and the Smalltalk tradition of inspectable, alterable environments.

We do not claim that no one has conceived intent-centric computing. We observe that the ingredients are converging, while a mature, open project unifying intent-first interaction, user ownership, universal operation, persistent context, generated interfaces, safe self-modification, and cross-device composition has not yet emerged. This project is an attempt to articulate and pursue that full synthesis.

## Invitation

This is a research and design effort in its earliest stage. There is no running code. What exists is a set of principles, an architectural direction, and an open invitation.

If you are interested in the future of personal computing — whether as a researcher, designer, engineer, or someone who simply wants a computer that works the way you think — we welcome your perspective.

See [CONTRIBUTING.md](CONTRIBUTING.md) for how to get involved.

## Boundaries

This project does not claim to have solved intent-centric computing. It claims that the problem is worth solving, that the technical preconditions are newly met, and that the design space deserves rigorous, open exploration. Every proposal in this repository is subject to revision through evidence and argument.
