---
title: "Beyond Apps: What If Your Computer Simply Did What You Meant?"
subtitle: "Intent-centric computing and the case for machines that adapt to people, not the other way around"
status: DRAFT
date: 2026-08-23
---

# Beyond Apps: What If Your Computer Simply Did What You Meant?

The computer you use was designed by someone else.

Someone else decided that photos live in one app, files in another, and messages in a third. Someone else decided the menu structure, the notification rules, the default behaviors. You learned their system. You adapted to their design. And if you wanted something different — a workflow that crosses three applications, an automation that matches your specific needs — you either became a programmer or you gave up.

We've accepted this so thoroughly that we forgot it was a choice.

## The Linux Paradox

There is a world where people own and control their computing. It's called Linux. You can modify anything — the kernel, the desktop, the window manager, the boot process. The source code is yours. The philosophy is unimpeachable.

And yet, after three decades, desktop Linux sits in the low single digits of market share. Not because freedom is unpopular, but because exercising that freedom requires you to speak the machine's language. Configuration files. Package managers. Dependency conflicts. Shell scripting. The openness is real, but it's operationally demanding in ways that exclude most people from its benefits.

The result is a strange split: people who value control over their computing can have it — if they invest hundreds of hours into systems administration. Everyone else gets polished, opinionated software that works well within its boundaries and not at all outside them.

## The AI Inflection

Large language models change the calculus here in a fundamental way. Not because they're flashy or because "AI" makes good marketing copy, but because they collapse the distance between what you mean and what gets done.

Before LLMs, translating human intent into machine action required formal specification — code, configuration, structured commands. That translation step was the bottleneck. It's why we have apps in the first place: pre-packaged translations of common intents into working software.

Now, for the first time, it's computationally feasible to accept loosely expressed intent and realize it as working functionality. Not perfectly, not without guardrails, but feasibly. This isn't about chatbots or writing assistance. It's about a different relationship between people and their machines.

## Three Levels of Intent-Centric Computing

We see this unfolding across three levels of depth:

**Agent-operated.** Your existing system, but with an AI layer that can drive it on your behalf. You say "find all the receipts in my email from last quarter and put them in a spreadsheet," and an agent navigates your apps to make it happen. Your tools don't change; they just gain a skilled operator.

**Agent-modifiable.** The system itself can be reshaped by an agent acting on your intent. You say "I want my morning briefing to include weather, calendar, and any messages marked urgent," and the agent configures, connects, or even writes the components to make that real. The machine adapts its own structure.

**Intent-native.** The system is built from the ground up around intent rather than applications. There are no apps to navigate or configure — just capabilities that compose fluidly in response to what you're trying to accomplish. The concept of "an app" dissolves into something more like a responsive environment.

## What This Looks Like in Practice

A photographer says: "Keep my best photos from this trip synced across my laptop, phone, and the frame in the living room — high-res on the laptop, compressed for the phone, cropped to landscape for the frame." Today this requires multiple apps, manual exports, and ongoing maintenance. In an intent-native system, you've expressed the policy; the system handles realization continuously.

A team lead says: "Show me how communication patterns in our company have shifted since we reorganized in March." This isn't a dashboard someone pre-built. It's an analysis that requires accessing communication data, understanding organizational structure, and synthesizing a novel view — assembled from intent, not selected from a menu.

A student says: "I want to run a local language model for my research, but I don't know if my hardware can handle it." The system understands its own capabilities and constraints, explains the gap honestly, and suggests concrete options — not because someone built a "hardware compatibility checker app," but because the system can reason about itself.

## What Exists Today

Several projects are exploring adjacent territory:

[Omarchy](https://omarchy.org/) reimagines the desktop as an AI-native environment built on open-source foundations, treating the operating system itself as something an AI can operate and extend.

[Ink and Switch's work on malleable software](https://www.inkandswitch.com/essay/malleable-software/) articulates a vision where end users reshape their tools without traditional programming — software that's meant to be modified by its users rather than just consumed.

[Brain](https://brain.ai/) organizes software around human intent rather than discrete applications, exploring what interaction looks like when the app boundary disappears.

[Open Interpreter's 01](https://01.openinterpreter.com/getting-started/introduction) demonstrates an open-source voice interface that can take action on your computer, making the intent-to-action loop tangible and immediate.

DHH has written compellingly about [the malleable computer](https://world.hey.com/dhh/the-malleable-computer-7c187a9b) as a north star worth pursuing.

Each of these projects illuminates part of the picture. But no single effort currently combines all the properties we think are necessary: intent-first interaction, genuine user ownership of data and computation, persistent context that accumulates over time, safe self-modification with meaningful guardrails, and seamless operation across devices.

## What We're Working Toward

We think the convergence of these properties — not any one alone — is what creates a genuinely different kind of computing. A system that understands what you mean, owns nothing about you that you don't control, remembers what it's learned, can reshape itself safely, and follows you across every device you touch.

This is hard. The individual pieces are becoming feasible; the integration is where the real challenge lives. Questions of safety, reliability, privacy, and trust don't get easier when you give a system permission to modify itself.

## An Invitation

We've published our research and design thinking openly at [TODO: INSERT GITHUB URL BEFORE PUBLISHING]. Not because we think we have the answers, but because we think the questions matter enough to work on in public.

If this resonates — if you've been thinking about what computing looks like when machines finally adapt to people rather than the reverse — we'd welcome the conversation. Whether you're building in this space, researching adjacent problems, or simply frustrated by the gap between what computers could do and what they actually do for you, the door is open.

The computer you use was designed by someone else. It doesn't have to stay that way.
