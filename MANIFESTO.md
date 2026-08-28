# Manifesto: Intent-Centric Computing

> **Status: `VISION`**

## The claim

It is time to reinvent how every computer is used.

Not to add another assistant. Not to bolt a chat window onto the desktop. To change the fundamental relationship between a person and a machine — so that the computer **morphs** to the human, instead of the human contorting to the computer.

Today you adapt to your machine. You learn its menus, its apps, its idioms, its notion of where a file belongs and how a task should be broken up. An intention-driven computer inverts that. You express what you want — an outcome, an experience, a way of working — and the machine reshapes itself around you: around your demands, your perception, your abilities, and your style. Not a preference toggle. Not a theme. The software itself is regenerated to fit the moment.

We believe this is now buildable for the first time. This manifesto argues why, and invites the people and resources to build it.

## Morph, not merely adapt

Adaptation is what current software already does, weakly. You change a setting; the app rearranges within limits its authors foresaw. You are still inside their box — a slightly resized box.

Morphing is different in kind. A morphing system does not pick from options a designer anticipated. It **composes and generates** the interface, the workflow, and where needed the underlying components, in response to what you are trying to do right now.

Concretely:

- A person with low vision doesn't hunt for an accessibility menu. Their computer *becomes* high-contrast, large-target, voice-first — everywhere, in every task, because that is how they perceive. The morphing follows them, not the app.
- A trader and a poet, handed the same machine, end up with two different computers within a week — different surfaces, different verbs, different rhythms — because each expressed a different way of working and the system grew to match.
- You say "I hate how this looks." Instead of a settings pane, the interface in front of you is rebuilt — its layout, density, and interaction model regenerated — until it fits how *you* think.

The unit of change is not configuration. It is the interface and the capability themselves, generated around the desired outcome.

## Why now: the convergence

Three things have quietly come together. None was built for this purpose, and none alone is enough. Together they make intent-centric computing newly feasible.

**1. Linux — an open, inspectable, modifiable substrate.** It runs across nearly every class of hardware, from personal devices to servers. The permission to change how the machine works has existed for decades.

**2. A vast open-source capability base.** More than thirty years of applications, desktops, drivers, libraries, daemons, and protocols form an enormous reservoir of working capability. Almost anything a person might want a computer to do, some open component can already do at least in part. These are the materials.

**3. Models capable of translating intent into technical realization.** For the first time, loosely expressed human intention can be translated into the configuration, integration, glue code, generated interfaces, and — in bounded cases — real modification needed to produce an outcome. The model need not be a perfect or infallible systems engineer to change the economics. It must be capable enough, often enough, under verification and control.

Openness was always real, but it was never free to use. Its price was specialized engineering effort: knowing which system service, device rule, dependency, driver flag, protocol, or application boundary had to change, then changing it correctly. Most people could not justify years of expertise merely to make one computer behave differently. The open door existed; walking through it cost too much.

Models do not make the underlying work disappear. A systemd unit still has to be correct; a driver still has to be configured safely. What changes is the cost of discovering and applying the machine's vocabulary for one person's specific situation. A person should be able to state the outcome without first knowing whether it requires udev, PipeWire, a compositor rule, or generated code.

Linux gives permission. Open source gives working materials. Models supply the missing translator between human intention and realized software. The breakthrough is therefore not one new component, but the collapse in the cost of assembling components around one particular person, in one particular moment. We already built most of the pieces. The work now is to make them cohere.

This is testable today in its most mundane form: make one machine behave the way you actually think, one specific request at a time. The larger version—coordinated devices, generated interfaces, and software assembled around a purpose rather than preassembled as an app—starts exactly there. It is a harder engineering problem, but not a different principle: begin with the outcome, then make the machinery conform to it.

## Why this is more than assistants and orchestration

Most "AI on your computer" work stops at operating the machine you already have. It is worth situating clearly:

1. **Agent-operated** `PRIOR ART` — an agent clicks the buttons and calls the APIs of existing apps on your behalf. The apps, and their interfaces, are untouched. A skilled operator of someone else's software.

2. **Agent-modifiable** `PARTIAL` — an agent can reconfigure and connect components, gaining real malleability, but the ontology of apps, windows, files, and settings still rules.

3. **Intent-native** `VISION` — the desired outcome is the primary abstraction. Applications are demoted to interchangeable capability providers. Interfaces are generated for the task. And bounded portions of the OS, the applications, and the interaction paradigms themselves are **rewritten and generated** around what you want — not selected from what a vendor shipped.

Orchestration drives the existing world. This proposes to *regenerate* it, locally and safely, per person. That is the line: assistants make today's computer easier to operate; an intent-native computer stops being today's computer at all.

## Why self-modification is necessary

Any single intent-native experience could be built as a conventional product. A team could spend months defining one domain, choosing supported hardware, inventing its data model, writing integrations, and freezing an interface. Given enough engineers, the excavation, the search mission, or the room-as-instrument could each become an application suite.

The claim is not that one predetermined experience requires an LLM-modifiable operating system. The claim is that the **unbounded sequence of personal, situated, and evolving experiences does**.

A fixed system can expose only concepts and interaction rules its designers anticipated. An orchestrator can rearrange only abstractions and capabilities it already possesses. But an intention may require the machine to treat a new domain concept, relationship, social boundary, gesture, or activity as first-class—and to carry it coherently across storage, applications, displays, audio, sensors, identity, and permissions. At that point composition has reached the machine's **capability frontier**. Some of the software vocabulary itself must change.

The computer must then perform a bounded version of the engineering a product team would otherwise perform: define new objects and invariants; generate participant-specific interfaces; adapt open components; and, where necessary, rewrite parts of the application logic, compositor, audio graph, data model, service policy, or other userspace substrate. Most intentions should reuse stable, trusted capabilities. Self-modification begins only when the desired experience cannot be expressed faithfully with what already exists.

“Bounded” is concrete: each proposed rewrite has a declared purpose and scope; runs first in an isolated environment; is tested against explicit behavioral and safety invariants; requests only typed, least-privilege authority; installs transactionally; remains observable and attributable; and has a deterministic rollback path. The LLM proposes and implements change inside these boundaries. It does not receive an unrestricted root shell, and it does not rewrite the kernel opportunistically.

This is why the convergence matters. Linux supplies an open substrate and the right to alter it. Open source supplies mature components whose internals can be understood and adapted. LLMs make the missing, situation-specific engineering economically possible for each person and each unforeseen intention—not merely for markets large enough to justify a product team.

> **Any one of these experiences could be a product. The breakthrough is a computer that can create all of them—and the next one nobody has imagined yet.**

## What this is not

Not a chatbot on a desktop. Not a launcher, a shell wrapper, an AI sidebar, or a theme. Not a system that turns you into the AI's project manager, forever prompting and supervising. It is a proposal for a different kind of machine — one that carries the mechanics so you can carry the meaning.

## The credibility ballast

Ambition without discipline is vaporware. A system permitted to rewrite parts of itself must be governed harder, not softer. The architecture rests on a small number of non-negotiable commitments:

- **A persistent harness, replaceable models.** The system's identity, commitments, and state are durable. Model invocations are bounded episodes inside that continuity. Models can be swapped or upgraded; the steward survives.
- **Authority is earned, domain-specific, and risk-sensitive.** The system may silently restart a crashed service but must ask before sending a message. Open scope never means unlimited authority — boundaries are explicit and inspectable.
- **Every material action is attributable and reconcilable.** The system tracks what it intended, attempted, observed, and what actually happened — and reconciles the gaps. Provenance is not optional.
- **Self-modification is staged, tested, and reversible.** Every rewrite has a motivation, a scope, test evidence, and a rollback path. Nothing regenerates itself without a way back.
- **Human attention is scarce and protected.** Silence during routine success is a feature; interruption is proportional to importance.

These are the guardrails that make morphing something you would actually trust to run your machine.

## The lineage

We stand on real shoulders — Licklider's human-computer symbiosis; Kay and Goldberg's personal dynamic media; the Smalltalk tradition of inspectable, alterable environments. Contemporary efforts illuminate parts of the picture: [Omarchy](https://omarchy.org/) (AI-native, malleable Linux), [Ink & Switch](https://www.inkandswitch.com/essay/malleable-software/) (malleable software), [Brain](https://brain.ai/) (computing organized by intent), [Open Interpreter / 01](https://01.openinterpreter.com/getting-started/introduction) (open conversational computing), and [OpenDAN](https://github.com/fiatrete/OpenDAN-Personal-AI-OS) (personal AI OS). None yet unifies intent-first interaction, genuine ownership, generated interfaces, and safe self-rewriting into one open synthesis. That synthesis is the work.

## Invitation — build this with us

This is an open research and design effort in its earliest stage. There is no running code yet — there is a thesis sharp enough to build against, and an open door.

We are looking for people and resources to turn it real:

- **Engineers** — OS internals, Linux userland, agent harnesses, code-generation, sandboxing and rollback.
- **Designers and HCI researchers** — what does an interface that regenerates itself even *look* like? What makes it legible and trustworthy?
- **Safety and security researchers** — governing a machine that can rewrite parts of itself.
- **Accessibility practitioners** — the people for whom "morph to my perception and abilities" is not a demo but daily life.
- **Funders and hardware partners** — compute, devices, and runway to move from manifesto to prototype.

If you want a computer that works the way *you* think — or you want to help build it — get involved.

See [CONTRIBUTING.md](CONTRIBUTING.md). *(Public repository link to be inserted before publication.)*

## Boundaries

We do not claim to have solved intent-centric computing. We claim the problem is worth solving, that the technical preconditions are — for the first time — met, and that the design space deserves rigorous, open exploration. Every proposal here is subject to revision through evidence and argument.
