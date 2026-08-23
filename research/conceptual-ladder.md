# The Conceptual Ladder: Three Levels of AI-Computing Integration

> **Status: `RESEARCH`**

## Overview

Not all "AI computing" is the same. The differences are architectural, not merely quantitative. This ladder distinguishes three levels to clarify where existing projects sit and what Level 3 requires that Levels 1 and 2 do not.

## Level 1: Agent-Operated

AI uses existing applications on the user's behalf — clicking buttons, typing text, calling APIs, navigating menus. The applications themselves are unchanged. The user's computing environment remains conventional; the AI is an operator within it.

**Examples:** Screen-control agents (Anthropic's computer use, Adept), browser automation (Playwright-based agents), voice assistants that open apps and fill forms, RPA (robotic process automation) systems.

**Primitives:** Applications, windows, clicks, keystrokes, API calls.

**User experience:** "Do this task for me" — delegation of procedural work. The user must still think in terms of which app to use and what steps are involved. The AI reduces labor but does not change the abstraction level.

**Limitation:** The AI is constrained by the same interface friction as the user. It navigates menus, waits for pages to load, and works within the assumptions of pre-built software. The computing paradigm is unchanged; only the operator is different.

## Level 2: Agent-Modifiable

AI can modify applications, configurations, and system behavior — not just operate within them. The user gains practical malleability: the system reshapes itself. However, the ontology of apps, windows, files, and processes persists. The user still lives in a world of discrete applications; they are simply easier to customize.

**Examples:** Omarchy (agents alter Hyprland config, top bar, themes, system behavior), AI-powered IDE extensions that refactor codebases, systems where agents install/configure software on behalf of users.

**Primitives:** Configuration files, system settings, application state, installation scripts — plus all Level 1 primitives.

**User experience:** "Make my system work differently" — the user expresses preferences and the system adapts. But the user still thinks in terms of apps and settings, just with less friction in changing them.

**Limitation:** Modification operates on the existing substrate. You can rearrange the furniture, repaint the walls, even knock out a partition — but you are still living in a house built by someone else, with their floor plan as your starting point.

## Level 3: Intent-Native

The user's desired state is the primary abstraction. Applications are not destinations but capability providers — invisible infrastructure that the system composes as needed. Interfaces are generated dynamically from intent and context. The system maintains continuous understanding of the user's environment, active intentions, commitments, and policies.

**Examples:** This project (target architecture). Partial precedents: Brain.ai (intent-first but not user-owned), Apple's Siri Intents framework (intent vocabulary but not intent-native architecture).

**Primitives:** Intentions, commitments, policies, capabilities, context, composition rules — not files, windows, or processes.

**User experience:** "Here is what I want to be true" — the user expresses desired states, constraints, and ongoing commitments. The system continuously works toward those states, composing whatever capabilities are needed, generating whatever interface serves the moment.

## Why Level 3 Is Architecturally Distinct

Level 3 is not "Level 2 but more." It requires fundamentally different primitives and system design:

**Different primary objects.** Levels 1 and 2 operate on files, processes, windows, and configurations. Level 3 operates on intentions, commitments, and policies. This is not a UI change — it is a change in what the system represents and reasons about.

**Different persistence model.** Levels 1 and 2 persist filesystem state. Level 3 persists a model of the user's goals, context, and ongoing commitments — a semantic layer that survives across sessions, devices, and interface changes.

**Different composition model.** Levels 1 and 2 compose by launching apps and switching between them. Level 3 composes by assembling capabilities from multiple sources into a unified response to an intention — no app boundaries visible to the user.

**Different safety model.** Self-modification at Level 3 means the system alters its own reasoning, policies, and composition rules — not just configuration files. This requires policy-bounded self-modification with user-inspectable constraints, a fundamentally harder problem than "can the AI edit config files safely."

The architectural gap between Level 2 and Level 3 is where this project's core research and design challenges live.
