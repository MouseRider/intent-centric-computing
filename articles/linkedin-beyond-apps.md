---
title: "Wait—We Already Built Most of This."
status: FINAL
date: 2026-08-25
---

# Wait—We Already Built Most of This.

Here's the moment that actually got me. I'd assumed the future needed some new piece of technology that simply hadn't arrived yet — the missing ingredient. Then I realized the last piece had already arrived, quietly, on its own schedule, without anyone announcing that it had just completed something.

Three things, each already sitting there, none built for this purpose, that suddenly click together.

**Linux** is an open, inspectable, modifiable substrate, running on nearly everything from phones to servers, and it has been for decades. Not a hobbyist niche — actual permission to change how the machine works, built in from the start.

**Open source, more broadly,** is thirty-plus years of working capability sitting in public: desktops, daemons, drivers, protocols, libraries, entire categories of software. Almost anything you'd want a computer to do, some piece of open software already does at least part of.

And now: **a model that can translate loosely expressed human intent into the specific technical steps that realize it** — configuration, integration, glue code, and in bounded cases, real modification of the software itself. Not a perfect systems engineer. Not infallible. A translator, good enough often enough to matter, for the first time.

None of these three is the headline on its own. Put together, they're something else.

Here's the part worth sitting with: openness was never actually free to use. It was denominated in a currency almost nobody had enough of — specialized engineering effort. Knowing what a systemd unit is, what a udev rule does, which driver flag actually matters, how one package's dependencies collide with another's — that's real expertise, and it took real years to build — years that almost nobody could justify spending just to make their computer behave differently. The open door was real. Walking through it cost more than most people had to spend.

What a capable model changes isn't the substance of that work — the systemd unit still has to be right; the driver still has to be configured correctly. What changes is the cost of finding out what those things even are, for your specific situation, right now. You don't need to already know the word "udev" to get the outcome that happens to require one. That's a real shift in economics, not a claim that the underlying work disappears.

I shouldn't need to know what udev is to say: *when I plug this dock in, move these displays here, switch audio to this device, mount this share, and undo all of it the moment I unplug and leave.* It may turn out the answer involves udev, systemd, PipeWire, and a small script wiring them together. That's the machine's vocabulary, not mine — and for the first time, I don't have to learn all of it before I can ask for the outcome.

So: three pieces, each already here, and the cost of the translation that used to gate all of it just collapsed.

That's the mundane version of the idea, and it's the one you can already try tonight: make the machine work the way you actually think, one specific request at a time, without first becoming the person who knows what udev is.

Now let it run further, carefully. If intent can increasingly be translated into changes on one machine, the interesting question becomes how much farther that same principle can extend — to multiple devices, to a temporary environment built around one task, to software assembled around a purpose instead of preassembled as an app. Getting there isn't just more of the same translation: coordinating several machines, generating an interface instead of configuring one, holding shared state safely, is a harder problem than telling one laptop what to do. But the principle hasn't changed: start from the outcome, then make the machinery conform to it. The dig site, the search, the rehearsal space — the larger version of this idea — start exactly here.

Here's the part I think is genuinely the exciting one, more than any of the mechanics: most of us have spent thirty or forty years absorbing one lesson about computers so thoroughly that we stopped noticing we'd learned it — that they are fixed things, and your job is to work around them. Not "computers are hard to operate." Something quieter and deeper: it never occurred to most people that *why does it have to work this way at all* was a question worth asking, because nothing in decades of experience ever suggested the answer could be anything other than "because that's how it was built."

That's the actual shift. Not that computers get easier to operate. That the question of why they're shaped the way they are becomes askable again, for the first time in most people's lived experience of using one.

We don't need to wait for someone to invent the missing ingredient. Linux is already here — it wasn't built anticipating this. Thirty years of open source is already here — none of it was accumulated for this. The model is already here too, and it wasn't trained to complete some intent-native roadmap. Nobody coordinated any of it, and yet the pieces fit. The interesting question is no longer when the next piece arrives — it's what happens now that we stop treating these as three separate technologies in three separate corners, and start assembling them around what one particular person, in one particular moment, actually wants.

I'd rather find out by trying it than by predicting it — not by waiting for someone to build the finished thing, but by noticing you're already holding the pieces.
