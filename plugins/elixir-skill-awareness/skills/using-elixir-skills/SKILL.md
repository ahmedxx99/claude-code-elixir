---
name: using-elixir-skills
description: Guides when to invoke Elixir thinking skills during development
---

# Elixir Skills Awareness

When working on Elixir, Phoenix, or OTP code, check if any of these skills apply before writing code.

## Available Skills

### elixir-architectural-thinking

**Use when:** Designing modules, processes, data structures, or making architectural decisions in Elixir.

Covers:
- The fundamental paradigm shift: "You don't need a process" (processes are for runtime, not code organization)
- Functional core / imperative shell pattern
- "Let it crash" actually means "let it heal" (supervisors restart)
- Data transformation vs state management
- The three decoupled dimensions: behavior (modules), state (data), mutability (processes)
- Polymorphism mechanisms: behaviors, protocols, message passing
- Design patterns in Elixir (from José Valim's "Gang of None?" talk)
- Testing behavior, not implementation (unit = behavior, not code)
- Library author guidelines (avoid global config, provide child_spec)
- Pre-coding checklist: domain, data, process architecture, APIs, failure modes

**Trigger phrases:** "design", "architecture", "should I use a process", "how to structure", "pattern", "module organization", "testing strategy"

---

### phoenix-ecto-thinking

**Use when:** Working with Phoenix controllers, LiveView, contexts, Ecto schemas, or database patterns.

Covers:
- Phoenix Scopes (1.8): security-first authorization threading, multi-tenancy
- Contexts as bounded domains with their own "dialect"
- Cross-context references: use IDs, not belongs_to associations
- Ecto schemas: embedded_schema for forms, virtual fields, schemaless changesets, multiple changesets per schema
- Preload strategies: separate vs join preloads, N+1 prevention
- Multi-tenancy with composite foreign keys and prepare_query/3
- LiveView lifecycle: mount (setup only) vs handle_params (data queries)
- Stateful vs functional components
- PubSub patterns: scoped topics, broadcast_from to avoid self-broadcast
- External data polling: GenServer + PubSub, not LiveView polling
- DDD concepts for better contexts (from German Velasco's talk)

**Trigger phrases:** "LiveView", "context", "schema", "Ecto", "Phoenix", "preload", "PubSub", "multi-tenant", "scope", "mount", "handle_params"

---

### otp-thinking

**Use when:** Implementing GenServers, supervisors, Tasks, or deciding which OTP abstraction to use.

Covers:
- GenServer is a bottleneck BY DESIGN (processes one message at a time)
- When GenServer becomes a problem: mailbox filling, timeouts, degradation
- ETS pattern for bypassing GenServer bottleneck (concurrent reads)
- Decision tree: Agent vs GenServer vs Task vs plain functions
- GenStateMachine for explicit state machines with timeouts
- Supervision strategies: one_for_one, one_for_all, rest_for_one
- DynamicSupervisor for dynamic children, PartitionSupervisor for scaling
- Task.Supervisor.async is THE recommended pattern (not raw Task.async)
- Registry + DynamicSupervisor pattern for named dynamic processes
- Distributed OTP: Horde, :pg for cluster-wide process groups
- Broadway vs Oban: external queues vs background jobs (different problems)
- Telemetry for observability
- Debugging with :sys module

**Trigger phrases:** "GenServer", "supervisor", "Task", "process", "ETS", "bottleneck", "distributed", "Broadway", "Oban", "pool", "concurrent"

---

## How to Use

When you recognize trigger phrases or contexts above, invoke the skill:

```
Skill tool: elixir-architectural-thinking
Skill tool: phoenix-ecto-thinking
Skill tool: otp-thinking
```

The skill content will guide your approach before writing code.
