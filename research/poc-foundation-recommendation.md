# Proof-of-Concept Foundation Recommendation

> **Status: `RESEARCH` / `DESIGN PROPOSAL`**  
> **Research snapshot:** 2026-08-30  
> This is a time-bounded evaluation, not an endorsement or a claim that the proposed architecture has been implemented.

## Decision in one paragraph

For the first Linux proof of concept, run a **full-screen Chromium/WebKit presentation workspace on [niri](https://github.com/niri-wm/niri)**, with DankMaterialShell (DMS) or Quickshell limited to thin native session, recovery, diagnostics, and notification chrome. Accept voice and gesture as primary intent channels while preserving keyboard and pointer access. Keep the persistent runtime and all effects in separate, unprivileged processes. Use **[AG-UI](https://github.com/ag-ui-protocol/ag-ui)** for the streamed agent/session event boundary and a deliberately small **[A2UI](https://github.com/a2ui-project/a2ui)-inspired declarative UI schema** rendered by trusted web components. Do not execute model-generated HTML, JavaScript, QML, or shell directly. Reuse an existing agent runtime—preferably **[goose](https://github.com/aaif-goose/goose)** initially—behind an adapter rather than forking an “AI OS.” Treat every shell, compositor, renderer, and agent choice as a replaceable experimental host; preserve the protocol and trust boundaries.

## What the prototype must test

The repository's core claim is not “chat on the desktop.” The prototype should test one narrow vertical slice:

1. The user invokes an intent surface through voice, gesture, or spatial context, with keyboard and pointer fallbacks.
2. The system resolves the request into a visible plan and typed capability requests.
3. It composes a task-specific interface from trusted components.
4. Read-only actions may run immediately; consequential actions require explicit preview/approval.
5. Progress, results, errors, cancellation, and provenance stream back into the same surface.
6. The entire interaction is keyboard operable and exposed to AT-SPI.

A good demo intent is: **“Find the large downloads I have not opened recently, explain what is safe to remove, and let me choose.”** It exercises search, state, generated presentation, reversible selection, approval, filesystem capability mediation, and auditability without pretending to implement an entire operating system.

## Evaluation criteria

Candidates were judged on:

- **Time to first interaction:** can a useful overlay and result surface be built in days rather than months?
- **Linux integration:** Wayland surfaces, launcher, notifications, clipboard, files, windows, and IPC.
- **Isolation:** whether model output can remain data and privileged effects can stay out of the UI process.
- **Accessibility:** keyboard interaction plus an AT-SPI path that can be tested with Orca.
- **Replaceability:** whether UI, agent, and compositor can evolve independently.
- **License and project health:** practical reuse terms, current activity, documentation, and community.
- **Conceptual fit:** intent, persistent state, generated UI, human approval, and user ownership—not merely AI branding.

## Linux desktop foundations

| Candidate | Reusable strengths | Important limitations | PoC fit |
|---|---|---|---|
| **DMS + Quickshell** | Complete MIT shell; QML UI plus Go services; launcher, notifications, controls, packaging, and plugin examples already exist. DMS supports niri, Hyprland, Sway, labwc, and others. Quickshell is an LGPL QtQuick toolkit for shell surfaces. | DMS plugins are dynamically loaded QML in the shell process. Manifest `permissions` are metadata, not a demonstrated security boundary; examples can launch processes. This is unsuitable for untrusted/generated extensions. | **Best starting repository**, provided the existing plugin API is used only for trusted prototype code and all AI effects cross a separate broker boundary. |
| **niri** | Mature Rust/Smithay compositor, excellent keyboard-first spatial model, JSON Unix-socket IPC with an event stream, and documented basic Orca support through AccessKit and the freedesktop keyboard-monitor interface. | It is a compositor, not a complete desktop shell or authorization layer. Its scrollable tiling model may not be the eventual intent-native spatial model. | **Best compositor for the PoC.** Use its IPC; do not fork it initially. |
| **COSMIC / libcosmic** | Integrated Rust Wayland desktop; modular apps and applets; libcosmic uses iced and offers templates, XDG portal integration, and an experimental `a11y` feature. Applets are separate application processes rather than in-process JavaScript plugins. | A larger codebase and Rust UI learning/build cost make iteration slower. Accessibility support remains explicitly experimental in libcosmic. Deep shell changes require coordination across many repositories. | **Strong migration target**, especially for process isolation and a Rust-native stack; not the quickest first demo. |
| **KDE Plasma** | Mature desktop, QML/Qt component model, plasmoid ecosystem, broad system integration, and established accessibility facilities. | Large framework surface, version/API coupling, and extension lifecycle complexity. A fork would inherit substantial maintenance scope. | Good integration target or later host; weaker than DMS for a deliberately disposable experiment. |
| **GNOME Shell** | Mature interaction design, JavaScript extensions, accessibility integration, and broad deployment. | Extensions share shell process risk and regularly track shell APIs; GNOME's opinionated shell model makes structural experimentation costly. | Useful comparison platform, not the recommended base. |
| **Astal (GTK)** | Lightweight shell-building backends in Vala/C with GTK front ends; GTK brings a mature accessibility path. | Less complete than DMS; current documentation notes frontend/API evolution, especially around GTK4. More shell plumbing must be assembled. | Good fallback if Qt/Quickshell accessibility blocks the prototype. |
| **Smithay / custom compositor** | Rust building blocks and maximum control over compositor policy and protocol implementation. | Low-level framework, not a compositor or desktop. It would turn an interaction experiment into a multi-year systems project. | **Do not start here.** Consider only after compositor-level requirements are demonstrated. |

### Accessibility finding

Qt Quick exposes interactive items through accessibility APIs when components provide roles, names, actions, focus, and keyboard navigation. Linux assistive technology consumes these trees through AT-SPI over D-Bus. This is necessary but not automatic: generated UI needs semantic metadata and deterministic focus behavior in its schema.

A recent Quickshell issue showed `PanelWindow` and `FloatingWindow` surfaces registering with an empty AT-SPI tree even though equivalent `ApplicationWindow` content worked. The issue was fixed upstream on 2026-08-28. That fast response is encouraging, but it also demonstrates why accessibility must be a release gate rather than inferred from Qt support.

**Required CI/manual gate for every prototype milestone:** inspect the AT-SPI tree, navigate entirely by keyboard, and run the main scenario with Orca. If a Quickshell layer surface regresses, render the intent workspace in a normal Qt application window while retaining only the launcher trigger in the shell.

## AI and intent-oriented projects

| Project | What is genuinely reusable | Why it is not the desktop foundation |
|---|---|---|
| **goose** | Apache-2.0 Rust agent with Linux desktop, CLI, API, multiple model providers, and MCP extensions. Its API and custom-distribution support make it a useful replaceable execution engine. | It is a general-purpose agent, not an intent model, shell, capability broker, or generated desktop UI. Tool permission semantics must be wrapped by this project's broker. |
| **Open Interpreter** | Broad local code/tool execution and a proven natural-language computer-control loop. | Its power comes from arbitrary code execution, which conflicts with typed, least-authority effects unless heavily contained. Current repository direction is coding-agent oriented. |
| **Open Interpreter / 01** | Voice clients and device-oriented interaction are useful prior art. | The repository warns that the experimental project lacks basic safeguards; its last observed push was in 2024. It is unsuitable as the core. |
| **OpenHuman** | Local-first memory, goals/todos, workflow graphs, integrations, and a desktop distribution provide strong prior art for persistent context. | It is an early beta personal-agent product, not a Linux shell. Reuse through documented interfaces if needed; do not couple the desktop ontology to its agent model. |
| **OpenDAN** | Personal AI OS framing, multi-agent coordination, Docker deployment, knowledge-base and service integration. | Its own README describes an early-stage, all-in-one MVP. It remains agent/service-centric and does not provide the required desktop or generated-interface boundary. |
| **AGiXT** | Provider-agnostic automation, memory, agents, and plugins. | Server/automation platform rather than a desktop interaction foundation; substantial surface area before any shell UX can be tested. |
| **Delentia OS, CognitiveOS, Gaxera** | Useful contemporary evidence that intent-centric and capability-secure OS ideas are being explored. | As of the snapshot they are very new and tiny, with little adoption; CognitiveOS is mostly shell scaffolding and Gaxera is a ground-up microkernel. They are research peers, not credible PoC bases. |
| **Generative Computer / emagine / Aether Canvas** | Visual prior art for prompt-created workspaces and spatial generative UI. | Small proof-of-concept repositories, largely web/Electron style; limited evidence of Linux integration, accessibility, or safe capability mediation. Mine interaction ideas, not architecture. |

**Conclusion:** no surveyed “AI OS” repository supplies a mature, accessible Linux shell plus safe capability mediation plus generated UI. Starting from one would replace known desktop engineering with speculative infrastructure. Reuse an agent runtime behind an adapter and keep this project's intent records and policy semantics independent.

## Generative UI choices

These projects solve different layers and should not be treated as interchangeable:

| Project/protocol | Layer | Strengths | Limitations | Recommendation |
|---|---|---|---|---|
| **AG-UI** | Agent ↔ user-session event protocol | MIT; typed event stream; messages, tool calls, state snapshots/deltas, frontend tools, human-in-the-loop, transport-independent design. Broad agent-framework integrations. | It does not define a native Linux component renderer or confer authorization. | **Use at the session boundary.** Add project-specific envelope fields only where needed (intent ID, capability request ID, audit reference). |
| **A2UI** | Declarative generated-UI protocol | Apache-2.0; trusted component catalogs; incremental updates; data rather than executable code; cross-framework renderers; accessibility attributes in the v1.0 candidate. | Public preview; v1.0 is still a release candidate. Full adoption now risks churn. | **Use a small compatible subset as the design model.** Implement 8–12 trusted web components and version the schema. Track upstream rather than claiming conformance prematurely. |
| **json-render** | TypeScript generative-UI framework/renderer | Apache-2.0; schema-constrained component/action catalog; streaming; polished React and other renderers; fast experimentation. | Web/JS-centered and young; embedding a web runtime increases footprint and requires a strict sandbox. | Strong implementation reference for the primary presentation workspace; retain the project-owned schema and authority boundary. |
| **MCP Apps** | Interactive UI supplied by MCP tools | Official MCP extension; sandboxed iframe; CSP allowlists; portable rich tool UIs in compliant hosts. | An app delivered by a tool is not the shell's own generated task surface. HTML/iframe embedding is awkward in Quickshell and accessibility depends on web content. | Support later as a sandboxed interoperability surface; do not make it the core UI grammar. |
| **CopilotKit** | Agentic frontend framework | Mature React ecosystem and first-party AG-UI lineage; quickest route to a polished web demo. | React-centric and broader than needed; can blur application framework with protocol. | Useful reference and optional web inspector, not the durable Linux shell dependency. |
| **Vercel AI SDK / assistant-ui** | Web AI streaming and chat UI | Productive TypeScript/React primitives and strong chat ergonomics. | Primarily application/chat frameworks; not native shell protocols or authority systems. | Use only if the first demo is intentionally web-based. |
| **Streamlit / Gradio** | Python app/demo frameworks | Extremely fast forms, data views, and model demos. | Server-page model, weak desktop integration, and poor fit for durable bidirectional intent state. | Baseline for throwaway experiments only. |

### Why not let the model emit QML or HTML?

Generated executable UI collapses presentation and authority. QML can import modules and invoke process APIs; HTML/JavaScript can make network requests and exercise browser capabilities. The safe default is:

- the model emits versioned declarative data;
- the client accepts only catalogued components and validates every property;
- UI actions emit symbolic action IDs, never commands;
- the runtime maps an action to a typed capability request;
- the broker authorizes and executes that request;
- results return as events and immutable audit records.

A2UI's catalog model and MCP Apps' sandbox/CSP model are useful precedents, but neither replaces operating-system authorization.

## Recommended PoC architecture

```text
Multimodal grounding (voice, gesture, spatial context)
    │
    ▼
Full-screen Chromium/WebKit workspace (trusted web components)
    │  AG-UI-compatible local stream over Unix socket/HTTP
    ▼
Intent session service (unprivileged adapter)
    ├── agent runtime adapter (goose first; replaceable)
    ├── intent/session store (SQLite)
    └── A2UI-subset validator + UI planner
             │ typed capability request
             ▼
Capability-broker prototype (separate process)
    ├── policy: allow / ask / deny
    ├── preview and idempotency key
    ├── narrow adapters: search, stat, trash, launch, notify
    └── append-only audit log
             │
             ▼
Linux services, XDG portals, niri IPC, and constrained subprocesses
```

### Initial trusted component catalog

`Text`, `Heading`, `Status`, `List`, `ListItem`, `Checkbox`, `Button`, `Progress`, `Disclosure`, `FileFact`, and `ApprovalCard` are enough. Every component must define:

- allowed properties and maximum lengths;
- keyboard/focus behavior;
- accessible role, name, description, and live-region behavior;
- permitted child types;
- symbolic events it may emit;
- visual treatment for pending, verified, failed, and destructive states.

### Initial capability catalog

Start with `file.search`, `file.metadata`, `file.reveal`, `file.trash`, `app.launch`, and `notification.show`. Do not expose a generic shell capability. `file.trash` must require a preview and confirmation, produce an audit record, and offer restoration where the platform supports it.

## Repository strategy

### Recommended starting point

Create a project-owned full-screen web workspace and keep any **DMS/Quickshell** integration thin and replaceable:

1. Add multimodal observation adapters and a keyboard-accessible fallback that forward grounded input to the local intent service.
2. Add one full-screen task surface that renders only the fixed declarative catalog and may display one-way application streams as evidence.
3. Add visual plan, approval, progress, cancellation, and audit affordances.
4. Do not modify niri; consume its documented IPC/event stream.
5. Do not put model credentials, model execution, arbitrary subprocess execution, or privileged actions in the browser or shell UI.

DMS remains useful for mundane desktop integration, recovery, and diagnostics, but it is not the main interaction canvas. The web workspace is preferred for rapidly composing workflow visualizations, media, diagrams, and distributed presentation. Its process and content sandbox must remain separate from the capability broker; streamed application pixels are output, not a native-application control channel.

### Migration path

**Stage A — interaction spike (days to weeks).** Full-screen web workspace + niri, mocked agent responses, fixed UI catalog, multimodal-input stubs, and keyboard/accessibility tests. Validate whether intent + generated task UI is better than launcher + app.

**Stage B — real but narrow loop.** Add the unprivileged session service, goose adapter, SQLite state, and six typed capabilities. Threat-model each capability. Record latency, correction rate, approval burden, and task completion.

**Stage C — harden boundaries.** Replace ad hoc local HTTP with authenticated Unix-domain IPC; add cancellation, deadlines, idempotency, event backpressure, audit signing, and sandboxing. Use XDG portals where their interaction model fits.

**Stage D — decouple presentation and shell.** Extract the trusted web component catalog and session protocol into project-owned modules. Keep DMS or Quickshell compatibility only for native session/recovery chrome. Compare accessibility, performance, packaging, distribution to other devices, and isolation.

**Stage E — choose the durable shell.** Only after evidence, decide among continued Quickshell, COSMIC integration, a toolkit-specific standalone shell, or compositor work. A custom Smithay compositor is justified only if required semantics cannot be expressed through standard Wayland protocols and compositor IPC.

## Explicit non-decisions

- This does **not** select goose as the permanent reasoning runtime.
- This does **not** make AG-UI an authorization protocol.
- This does **not** claim A2UI v1.0 conformance.
- This does **not** bless DMS plugins as a security sandbox.
- This does **not** require replacing conventional applications during the prototype.
- This does **not** justify a new compositor or Linux distribution.

## Exit criteria

Continue beyond the PoC only if all are demonstrated:

- The chosen scenario works end to end without arbitrary generated code.
- Users can inspect and correct the interpreted intent before consequential effects.
- Consequential effects always cross the typed broker and appear in the audit log.
- The task UI is usable with keyboard only and meaningfully announced by Orca.
- Cancellation works during model generation and capability execution.
- The agent runtime can be replaced without changing the shell or capability protocol.
- Median simple-intent feedback begins in under one second, even if completion takes longer.
- At least one structured task is measurably easier than performing it through conventional applications.

If these fail, preserve the protocol and usability findings, discard the shell fork, and narrow the research claim.

## Primary sources

### Desktop, shell, and Linux integration

- DMS repository and architecture: https://github.com/AvengeMedia/DankMaterialShell
- DMS launcher plugin example: https://github.com/AvengeMedia/DankMaterialShell/tree/master/quickshell/PLUGINS/LauncherExample
- Quickshell documentation: https://quickshell.org/docs/
- Quickshell repository: https://github.com/quickshell-mirror/quickshell
- Quickshell AT-SPI issue and fix discussion: https://github.com/quickshell-mirror/quickshell/issues/1006
- niri repository: https://github.com/niri-wm/niri
- niri IPC: https://niri-wm.github.io/niri/IPC.html
- niri accessibility: https://github.com/niri-wm/niri/wiki/Accessibility
- COSMIC component index: https://github.com/pop-os/cosmic-epoch
- libcosmic repository: https://github.com/pop-os/libcosmic
- libcosmic panel applets: https://pop-os.github.io/libcosmic-book/panel-applets.html
- KDE Plasma widget development: https://develop.kde.org/docs/plasma/widget/
- GNOME Shell repository: https://gitlab.gnome.org/GNOME/gnome-shell
- Astal repository: https://github.com/Aylur/astal
- Smithay repository: https://github.com/Smithay/smithay
- Qt Quick accessibility: https://doc.qt.io/qt-6/qml-qtquick-accessible.html
- AT-SPI development guide: https://gnome.pages.gitlab.gnome.org/at-spi2-core/devel-docs/index.html
- XDG Desktop Portal: https://flatpak.github.io/xdg-desktop-portal/docs/

### Agents and adjacent systems

- goose: https://github.com/aaif-goose/goose
- Open Interpreter: https://github.com/OpenInterpreter/open-interpreter
- Open Interpreter / 01: https://github.com/OpenInterpreter/01
- OpenHuman: https://github.com/tinyhumansai/openhuman
- OpenDAN: https://github.com/fiatrete/OpenDAN-Personal-AI-OS
- AGiXT: https://github.com/Josh-XT/AGiXT
- Delentia OS: https://github.com/delentia-labs/Delentia-OS
- CognitiveOS: https://github.com/CognitiveOS-Project/cognitiveos
- Gaxera: https://github.com/gaxera/gaxera
- Generative Computer: https://github.com/joshbickett/generative-computer
- emagine: https://github.com/pavi2410/emagine
- Aether Canvas: https://github.com/abbasmir12/aether-canvas

### Generative UI and interaction protocols

- AG-UI repository: https://github.com/ag-ui-protocol/ag-ui
- AG-UI architecture: https://docs.ag-ui.com/concepts/architecture
- A2UI repository: https://github.com/a2ui-project/a2ui
- A2UI specification: https://a2ui.org/specification/v1.0-a2ui/
- json-render: https://github.com/vercel-labs/json-render
- MCP Apps specification and SDK: https://github.com/modelcontextprotocol/ext-apps
- MCP Apps security model: https://modelcontextprotocol.io/extensions/apps/overview
- CopilotKit: https://github.com/CopilotKit/CopilotKit
- Vercel AI SDK: https://github.com/vercel/ai
- assistant-ui: https://github.com/assistant-ui/assistant-ui
- Streamlit: https://github.com/streamlit/streamlit
- Gradio: https://github.com/gradio-app/gradio
