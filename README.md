# Intent-Centric Computing

> A user-owned, intent-native computing environment in which applications become implementation details, interfaces are composed for the task at hand, and agents can safely reshape the environment itself.

**Project status: `RESEARCH` / `DESIGN PROPOSAL`** — This repository contains research, design artifacts, and a manifesto. There is no running code.

> **Public research project.** The documents describe an evolving proposal, not a finished system. Claims are labeled by maturity and substantial changes should remain reviewable in version control.

## Status labels

Documents in this repository use these labels to distinguish maturity:

| Label | Meaning |
|---|---|
| `VISION` | Aspirational direction; not yet validated or specified |
| `RESEARCH` | Investigation of prior art, landscape, or open questions |
| `DESIGN PROPOSAL` | Concrete proposal subject to revision through evidence and argument |
| `IMPLEMENTATION` | Specified and ready for (or under) implementation |

## Start here

- **[MANIFESTO.md](MANIFESTO.md)** — The project's vision, principles, and boundaries
- **[roadmap.md](roadmap.md)** — Phased plan from research to prototype
- **[design/current-direction.md](design/current-direction.md)** — Current synthesis: multimodal interaction, dependable workflows, precedents, local inference, and just-in-time hardware
- **[research/poc-foundation-recommendation.md](research/poc-foundation-recommendation.md)** — Evidence-backed Linux shell, agent, and generative-UI PoC recommendation

## Repository structure

```
intent-centric-computing/
├── README.md              # This file
├── MANIFESTO.md           # Vision, principles, and invitation
├── LICENSE                # Apache-2.0
├── CONTRIBUTING.md        # How to get involved
├── GOVERNANCE.md          # Governance model (provisional)
├── roadmap.md             # Phased roadmap
├── articles/
│   └── linkedin-beyond-apps.md  # LinkedIn article draft
├── research/
│   ├── landscape.md       # Prior-art map
│   ├── conceptual-ladder.md  # Agent-operated → agent-modifiable → intent-native
│   ├── poc-foundation-recommendation.md  # Linux/UI foundation research and PoC path
│   └── sources.md         # Cited sources with verification status
├── design/
│   ├── philosophy.md      # Core philosophy and models
│   ├── architecture.md    # High-level architecture
│   ├── principles.md      # Foundational principles
│   ├── current-direction.md # Latest design synthesis and prototype implications
│   └── open-questions.md  # Unresolved questions
└── scripts/
    └── verify-repo.sh     # Repository structure verification
```

## The idea in brief

Computing today is organized around paradigms designed by vendors: applications, windows, menus, notifications. Even on open platforms like Linux, practically reshaping your computing environment requires deep expertise.

Large language models change a key constraint: translating human intention into machine procedures is becoming feasible at a general level. This project explores what personal computing looks like when **intent** — not applications — is the primary abstraction.

We define three levels:

1. **Agent-operated** — AI uses existing apps on your behalf
2. **Agent-modifiable** — AI can modify apps and system behavior
3. **Intent-native** — your desired experience is the starting point; the system discovers how to realize it

This project targets level 3. See the [manifesto](MANIFESTO.md) for the full vision and [research/conceptual-ladder.md](research/conceptual-ladder.md) for the detailed framework.

## Related work

This project builds on ideas from [Omarchy](https://omarchy.org/), [Ink & Switch](https://www.inkandswitch.com/essay/malleable-software/), [Brain](https://brain.ai/), [Open Interpreter](https://01.openinterpreter.com/getting-started/introduction), [OpenDAN](https://github.com/fiatrete/OpenDAN-Personal-AI-OS), and the historical lineage of Kay, Goldberg, and Licklider. See [research/landscape.md](research/landscape.md) for the full analysis.

## License

[Apache 2.0](LICENSE)

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md). This project is in its earliest research phase — discussion, critique, and ideas are the most valuable contributions right now.
