# Hanzo AI Voice & Tone Guidelines

## Brand Voice

Hanzo AI's voice is **technical, innovative, and bold**—reflecting our pioneering work in AI compute markets and decentralized infrastructure.

### Core Voice Attributes

#### 1. Technical Precision
**What it means**: We speak the language of engineers and researchers with accuracy and depth.

✅ **Good Example**:
> "Our Hamiltonian Market Maker maintains a provably-stable invariant H(Ψ,Θ) = κ across heterogeneous compute resources, enabling oracle-minimal price discovery for AI workloads."

❌ **Bad Example**:
> "We have a cool new algorithm that makes AI compute cheaper!"

**Why**: The good example demonstrates technical expertise and precision. The bad example is vague and sounds unprofessional.

#### 2. Innovation-Forward
**What it means**: We emphasize novel mechanisms and cutting-edge research.

✅ **Good Example**:
> "Active Semantic Optimization (ASO) enables training-free model adaptation through Bayesian product-of-experts decoding at the token level."

❌ **Bad Example**:
> "We're working on some new AI stuff that might be interesting."

**Why**: We're pioneers in AI compute markets—our language should reflect that pioneering spirit.

#### 3. Bold & Confident
**What it means**: We're not afraid to make strong technical claims backed by research.

✅ **Good Example**:
> "HMM eliminates the need for external oracles while maintaining provable stability—a fundamental breakthrough in decentralized market design."

❌ **Bad Example**:
> "We think our approach might be better than existing solutions in some cases."

**Why**: We've done the research and testing. Confidence (backed by evidence) is warranted.

#### 4. Accessible Complexity
**What it means**: We explain complex concepts clearly without dumbing them down.

✅ **Good Example**:
> "Think of HMM like a self-balancing economic flywheel: as demand for compute increases, prices adjust smoothly through our Hamiltonian invariant, preventing the violent price swings common in traditional AMMs."

❌ **Bad Example**:
> "HMM uses advanced mathematical techniques from physics and economics that are too complex to explain here."

**Why**: Our audience is technical, but analogies and clear explanations make concepts stick.

## Tone Variations by Context

### Technical Documentation
**Tone**: Precise, methodical, comprehensive

**Characteristics**:
- Use exact terminology
- Include mathematical notation where appropriate
- Provide code examples
- Link to related concepts
- Assume reader has technical background

**Example**:
```markdown
## HMM Invariant Maintenance

The Hamiltonian invariant is maintained through:

1. **State Function**: Ψ = (R₁, R₂, ..., Rₙ) representing resource reserves
2. **Price Function**: P = ∇H(Ψ) computing marginal prices
3. **Conservation**: ΔH = 0 for all valid trades

See [HIP-004](https://github.com/hanzoai/papers/blob/main/hips/HIP-004-hmm.md) for complete specification.
```

### Marketing Copy
**Tone**: Bold, visionary, accessible

**Characteristics**:
- Lead with benefits
- Use powerful verbs
- Include social proof (Techstars '17)
- Paint the future vision
- Still technically accurate

**Example**:
> "Hanzo Network is building the economic rails for decentralized AI. Our Hamiltonian Market Maker enables stable, oracle-free pricing for heterogeneous compute—from edge devices to H100 clusters. Train frontier models without centralized gatekeepers. Deploy anywhere, settle on-chain."

### Blog Posts
**Tone**: Conversational yet expert, educational

**Characteristics**:
- Start with the "why"
- Mix technical details with real-world examples
- Use headings and structure
- Include visuals where helpful
- End with call-to-action

**Example Opening**:
> "Why do AI compute markets fail? Traditional AMMs assume fungible assets—but a TPU isn't a V100 isn't an H100. Each resource has unique performance characteristics, power requirements, and availability patterns. This heterogeneity breaks standard AMM designs, leading to price instability and inefficient allocation.
>
> That's why we built HMM..."

### Social Media
**Tone**: Punchy, technical-but-accessible, engaging

**Characteristics**:
- One key idea per post
- Use threads for complex topics
- Include visuals/charts
- Reference papers/code
- Engage with community

**Twitter Example**:
> "New paper: Hamiltonian Market Maker (HMM) 🧵
> 
> Traditional AMMs fail for AI compute because resources aren't fungible. HMM solves this with a physics-inspired invariant that maintains stability across heterogeneous resource types.
> 
> Here's how it works... [1/7]"

### Community Support
**Tone**: Helpful, patient, technically accurate

**Characteristics**:
- Answer the question directly first
- Provide context/background
- Link to relevant docs
- Offer to help further
- Never condescending

**Discord/GitHub Example**:
> "Great question! The HMM invariant is maintained automatically by the smart contract during each trade.
> 
> When you buy compute, the contract:
> 1. Calculates ΔΨ (change in reserves)
> 2. Computes required payment via ∇H
> 3. Executes the trade
> 4. Verifies H(Ψ_new) = κ
> 
> You can see the full implementation in [core/hmm.sol](link).
> 
> Let me know if you'd like me to walk through a specific example!"

### Whitepapers
**Tone**: Academic, rigorous, comprehensive

**Characteristics**:
- Formal structure (Abstract, Intro, Methods, Results)
- Mathematical proofs where needed
- Compare to prior work
- Include experimental results
- Cite sources properly

**Abstract Example**:
> "We present the Hamiltonian Market Maker (HMM), a novel automated market maker design for heterogeneous compute resources. Unlike traditional constant-product AMMs, HMM maintains a Hamiltonian invariant H(Ψ,Θ) = κ that accounts for resource-specific characteristics. We prove stability under adversarial conditions and demonstrate 94% price efficiency vs. centralized markets in simulations. HMM enables decentralized AI compute marketplaces with provable economic properties."

## Word Choice

### Preferred Technical Terms

#### Our Terminology
- **Hamiltonian Market Maker (HMM)**: Not "compute AMM" or "AI market maker"
- **Active Semantic Optimization (ASO)**: Not "semantic fine-tuning"
- **Proof of AI (PoAI)**: Not "proof of inference" (that's Zoo's)
- **Training-Free GRPO**: Not "zero-shot GRPO"
- **Hanzo Network**: Our L1 blockchain
- **Compute Credits**: Not "compute tokens" (reserve tokens for $AI token)

#### Action Verbs (Strong → Weak)
- ✅ Deploy, enable, build, prove, optimize, scale
- ⚠️ Try, attempt, hope, maybe, might, possibly
- ❌ Disrupt, revolutionize, transform (overused buzzwords)

#### Adjectives (Appropriate → Avoid)
- ✅ Efficient, stable, provable, decentralized, novel
- ⚠️ Innovative (overused, be specific about what's new)
- ❌ Groundbreaking, game-changing, best-in-class, next-gen

### Industry Jargon

**Use Freely** (our audience knows these):
- GPU, TPU, ASIC
- LLM, transformer, inference, training
- AMM, DeFi, on-chain, smart contract
- TEE, attestation, consensus
- PyTorch, CUDA, ONNX

**Define First Use** (not universal):
- Hamiltonian invariant
- Product-of-experts (PoE) decoding
- BitDelta compression
- Byzantine fault tolerance
- Snow consensus family

**Avoid** (unless absolutely necessary):
- Web3, metaverse, NFT (not our focus)
- "AI-powered", "machine learning-based" (too vague)
- "Blockchain technology" (just say "blockchain")

## Messaging Framework

### The Hanzo Story

**Problem**: AI development is centralized. Training frontier models requires massive compute clusters that only a few companies can afford. Existing compute markets suffer from price instability due to resource heterogeneity.

**Solution**: Hanzo Network decentralizes AI compute through novel economic mechanisms. Our Hamiltonian Market Maker enables stable pricing for heterogeneous resources. ASO allows training-free model adaptation. Anyone can participate.

**Proof**: Techstars '17 company, published research (HIP-002, HIP-004), open source codebase, co-development with Zoo Labs, 94% price efficiency in simulations.

**Vision**: A world where AI development is democratized—where compute markets are open, efficient, and fair. Where researchers can train frontier models without asking permission from tech giants.

### Key Messages by Audience

#### For AI Researchers
**Primary**: "Train frontier models without centralized infrastructure"
**Secondary**: "ASO enables training-free adaptation, PoAI verifies compute integrity"
**Proof**: "See papers.hanzo.ai for technical details"

#### For DeFi Builders
**Primary**: "HMM solves the heterogeneous asset problem for AMMs"
**Secondary**: "Provably-stable pricing without oracles"
**Proof**: "HIP-004 includes formal proofs and simulation results"

#### For Infrastructure Teams
**Primary**: "Decentralized compute marketplace with economic guarantees"
**Secondary**: "Oracle-minimal settlement, TEE attestations, on-chain verification"
**Proof**: "Techstars '17, production-ready codebase on GitHub"

#### For Investors
**Primary**: "Building the economic rails for decentralized AI"
**Secondary**: "Novel IP (HMM, ASO), strong ecosystem (Zoo, Zen), experienced team"
**Proof**: "Co-development with 501(c)(3) foundation, published research"

## Common Pitfalls to Avoid

### ❌ Overhyping
**Bad**: "Hanzo will revolutionize AI forever and make training accessible to everyone!"
**Better**: "Hanzo enables decentralized AI training through novel market mechanisms and efficient resource allocation."

### ❌ Vague Technical Claims
**Bad**: "Our algorithm is better than existing solutions."
**Better**: "HMM achieves 94% price efficiency vs. centralized markets while eliminating oracle dependencies—see Section 4.2 for benchmarks."

### ❌ Mixing Metaphors
**Bad**: "HMM is like a flywheel that disrupts the game and revolutionizes the space."
**Better**: "HMM maintains stability through a self-balancing economic mechanism inspired by Hamiltonian mechanics."

### ❌ Apologetic Language
**Bad**: "We're trying to build something that might help with compute markets."
**Better**: "Hanzo Network provides stable, oracle-free pricing for heterogeneous AI compute resources."

### ❌ Jargon Overload
**Bad**: "Leveraging synergistic paradigms to facilitate blockchain-enabled AI-as-a-Service solutions."
**Better**: "Decentralized marketplace for AI compute with provable economic properties."

## Checklist for Every Piece of Content

Before publishing, ask:

- [ ] **Technically Accurate**: Are all claims backed by research/code?
- [ ] **Clear Purpose**: What is the reader supposed to understand/do?
- [ ] **Appropriate Tone**: Does it match the context (docs, marketing, blog)?
- [ ] **Active Voice**: Did I use strong, active verbs?
- [ ] **Defined Terms**: Are complex terms explained on first use?
- [ ] **Proofread**: No typos, consistent terminology?
- [ ] **Links/Citations**: Are all references included?
- [ ] **Call-to-Action**: What should the reader do next?

---

**Last Updated**: 2025-10-29  
**Version**: 1.0.0
