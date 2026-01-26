---
layout: default
title: Lean Resources
use_math: true
---
# Lean Resources


## Installing Lean and Mathlib

I highly recommend using VSCode + the Lean4 extension to get Lean4 working.
Then, follow [these instructions](https://leanprover-community.github.io/install/project.html) to setup a project using [Mathlib4](https://github.com/leanprover-community/mathlib4).

Note, you can call `lake exe cache get` in your VSCode terminal in your project directory to download precompiled Mathlib dependencies instead of recompiling it yourself. See [these instructions](https://github.com/leanprover-community/mathlib4/wiki/Using-mathlib4-as-a-dependency) for more details.


## Learning resources

-   In my opinion, the [manual](https://lean-lang.org/doc/reference/latest/) is actually the best reference for learning about any specific concept. The second best place is to look at the source code file for a given type or theorem.
-   People recommend [Theorem proving in Lean](https://lean-lang.org/theorem_proving_in_lean4/), but I found it a bit difficult to follow as a beginner. However, it may be helpful to think about [Propositions as Types](https://en.wikipedia.org/wiki/Curry%E2%80%93Howard_correspondence), which is the foundation for how proving theorems works in Lean.
-   I find [Functional programming in Lean](https://lean-lang.org/functional_programming_in_lean/) incredibly helpful for learning the language features.
-   The [Natural Number Game](https://adam.math.hhu.de/) and related games are good for getting hands-on experience with the basics of how to do theorem proving.
-   [Mathlib4's list of learning resources](https://leanprover-community.github.io/learn.html)
-   After the natural numbers game, it might be helpful to try to prove some basic theorems (without just using Mathlib’s version of the theorem). Here is an example.
    -   Show $\sum_{i=1}^n i = \frac{n(n-1)}{2}$. Note, this includes some language specific challenges, such as using the `induction` tactic and dealing with `Nat` versus `Rat` types. \_


## Getting help

-   [Zulip chat](https://leanprover.zulipchat.com/)
-   Formalize the statement you want and search it in [Moogle](https://www.moogle.ai/) or [Leansearch](https://leansearch.net/).
-   Lean4 [tactic reference](https://lean-lang.org/doc/reference/latest/Tactic-Proofs/Tactic-Reference/#obtain)
-   At the time of this writing, LLMs are not great at Lean4 because they have absorbed a lot of Lean3 and struggle to separate the difference. Thus, in my experience, they often hallucinate a bunch of non-existent theorems.


## Useful things to know


### Check, print, and eval

Use `#check`, `#print`, and `#eval` to get a sense of what various theorems and expressions are actually doing.


### Manually add definition and theorems to simp (even if not tagged)

`simp` and its variations (`simp only`, `dsimp`, etc.) is a valuable workhorse for doing proofs.
The `simp` tactic will only use theorems that are tagged `@[simp]` because otherwise, one could create loops in the logic.
However, in the context of a given proof, it can be helpful to pass in hypotheses or definitions to the `simp` tactic, even though they are not tagged as simplification results.


### Understand `Nat`

The natural numbers have some mathematically weird behavior in order to *guarantee* operations on `Nat` stay in `Nat`.
In particular, division is implemented as *integer division*, so `#eval 7/2` will return `3`, and subtraction will never go negative, so `#eval 3-5` will return `0`.
If you need different behavior, you should work with `Int` or `Rat`.


### Casting

    #check (Finset.univ : Finset Fin 5)


### Specializing Theorems

Sometimes, you can implicitly or explicitly specialize a theorem to the case you want by using type annotations or passing in the explicit arguments. 
However, an extant theorem can have its explicit or implicit arguments specialized via

    theorem_name (in1 := x) (in2 := y)

A specific example is `Group.left_mul_inj`

    have h := Group.left_mul_inj (a := ) (b := ) (c := )


### Intro, unfold, and dsimp

If your goal state is of the form `P -> Q` for some propositions P and Q, `intro h` will add `P` to the assumptions and change the goal to `Q`.
Similarly, of the for `\forall x, P x`, then `intro x` 


### Obtain and specialize tactics

If you have an existence statement, it can help to obtain a specific element and the proof that it satisfies the proposition. 


### Pattern matching

Pattern matching is a functional programming technique for extracting information out of a structure or working with cases.


### Constructor tactic


### Refine tactic


### Omega and linarith tactics

The omega and linarith tactics allow you to solve inequalities in natural numbers and 


### Congr tactic

If you have an expression like `f(x) = f(y)`, the congr tactic will change the goal to `x = y`.
This is a pretty generic tactic and congr is also used in naming conventions for many theorems that justify steps like this.


### Conv tactic

Conv can feel a little clunky, but it allows you to navigate within the goal state to specify exactly where you might want to apply a rewrite or theorem application

