# Schelling's Segregation Model (MATLAB)

A minimal implementation of Thomas Schelling's segregation model, one of
the earliest agent-based models, originally proposed in the early 1970s.
Two types of agents are scattered in a continuous 2D space. Agents that
are unhappy with their local neighborhood relocate randomly, and the
population self-organizes into segregated clusters over time.

## Files

- `schelling_segregation.m` - Self-contained MATLAB function that
  initializes the agents, runs the simulation, and visualizes the result.

## Requirements

- MATLAB (no additional toolboxes required)

## Usage

1. Place `schelling_segregation.m` in your MATLAB path or current folder.
2. Run it from the command window:

   ```matlab
   schelling_segregation
   ```

3. A figure window opens showing agents as colored dots. The plot updates
   periodically as the simulation runs.

## How it works

- Each agent has a type (0 or 1) and a position `(x, y)` in the unit
  square.
- On each iteration, one agent is picked at random. Its neighbors are all
  other agents within a fixed radius `r`.
- If the fraction of neighbors sharing the agent's type is below a
  threshold `th`, the agent is considered unhappy and jumps to a new
  random position.
- Repeating this thousands of times produces visible segregation from an
  initially random distribution, even when `th` is well below what
  intuition might suggest is needed.

## Parameters

All parameters are set at the top of `schelling_segregation.m`:

| Parameter      | Description                                   | Default |
|----------------|------------------------------------------------|---------|
| `n`            | Number of agents                                | 200     |
| `r`            | Neighborhood radius                             | 0.10    |
| `th`           | Similarity threshold required to stay put       | 0.50    |
| `steps`        | Number of agent picks (iterations)              | 20000   |
| `redraw_every` | How often (in steps) the plot is updated        | 200     |

## Suggested experiments

- Vary `th` to find the threshold at which segregation starts to occur,
  and check whether the transition is gradual or sharp.
- Vary `r` and `n` to see how neighborhood size and agent density affect
  the resulting pattern.
- Add a segregation metric (for example, the average fraction of
  same-type neighbors across all agents) and track it over time or across
  parameter sweeps to quantify segregation instead of just observing it
  visually.

## Reference

Sayama, H. *Introduction to the Modeling and Analysis of Complex
Systems*. Chapter 19: Agent-Based Models.
https://math.libretexts.org/Bookshelves/Scientific_Computing_Simulations_and_Modeling/Introduction_to_the_Modeling_and_Analysis_of_Complex_Systems_(Sayama)/19:_AgentBased_Models/19.02:_Building_an_Agent-Based_Model
