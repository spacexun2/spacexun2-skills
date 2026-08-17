# spacexun2 Skills
<img width="1280" height="640" alt="image" src="https://github.com/user-attachments/assets/3144da96-ac34-4949-81c4-3f69f020e6d8" />

**中文** | [English](README.en.md)

升级到 GPT‑5.6 Sol 后，我把自己日常使用的一组 Skills 也重新做了一遍。这些 Skills 源自我在日常使用、复杂项目协作、跨 Agent 交接和一次次实际纠偏中得到的经验与工作流。

过去在 GPT‑5.5 阶段编写 Skill 时，很容易走向过度工程化：防御性规则越来越多，流程越写越细，最后变成一份要求 Agent 照表执行的操作手册。更强的模型已经能够自行完成许多通用步骤，Skill 的价值也随之转向模型无法自行知道的用户意图、项目事实、经验模式、权限边界和完成标准。

所以这次我结合自己的长期实践，以及近期 Agent 社区越来越一致的实践判断，按照我构建的 `$frontier-skill-creator` 重新优化：少替模型思考，多提供高价值上下文；少做机械约束，多明确真实目标与决策边界。目标是帮助 Agent 更准确地理解、更主动地判断，也更稳定地完成用户实际需要的任务。

目前，这些经验主要来自我对 GPT‑5.6 Sol 的日常使用，面向其他模型的证据仍然有限。为其他模型重构 Skill 时，应先验证其能力边界、行为特点和实际问题，再决定哪些内容适合迁移。

这些 Skills 对应的都是反复出现过的真实问题：Agent 尚未理解人的意图就开始做主，目标被悄悄缩小，简单问题被过度工程化，复杂工作又不断重复预加载，验证替代了用户需要的完整闭环，主动发现越过了人的决定权，或者一段已经得到的经验在下一个 session 又从头丢失。

## 快速开始

仓库已经兼容开放的 Agent Skills CLI，可以直接查看全部 14 个 Skills：

```powershell
npx skills add spacexun2/spacexun2-skills --list
```

也可以只安装当前需要的 Skill：

```powershell
npx skills add spacexun2/spacexun2-skills --skill control-loop-harness -g -a codex -y
npx skills add spacexun2/spacexun2-skills --skill frontier-skill-creator -g -a codex -y
npx skills add spacexun2/spacexun2-skills --skill codex-grill-me -g -a codex -y
```

这组命令安装仓库中的 canonical Codex Skill。需要同时安装 Codex 全局规则和 Claude Code 适配版本时，使用下方的 `install.ps1`。

### 可以先从这三个 Skill 开始

| 遇到的情况 | 使用的 Skill | 它会怎样介入 |
| --- | --- | --- |
| Agent 已经开始执行，却一边增加未确认的架构和验证流程，一边把完整功能压成最小闭环 | [`control-loop-harness`](skills/control-loop-harness/SKILL.md) | 回到原始目标，只读核对当前证据，先汇报偏离、判断与建议，再决定是否修改。这个复合场景提炼自多次日常纠偏中反复出现的模式，内容保持项目无关。 |
| Skill 逐渐变成防御性、事无巨细的执行手册 | [`frontier-skill-creator`](skills/frontier-skill-creator/SKILL.md) | 重新判断哪些内容具有不可替代的 intelligence value，把通用推理、流程仪式和低频材料移出核心上下文。 |
| 重要工作尚未开始，希望 Agent 先读证据、理解真实意图并减轻人的决策负担 | [`codex-grill-me`](skills/codex-grill-me/SKILL.md) | 形成适合人类理解和决策的对齐汇报，说明必要背景、Agent 自己的判断与推荐，只把实质性决定交给用户。 |

## Skill 目录

### 1. [`control-loop-harness`](skills/control-loop-harness/SKILL.md)

- **什么时候用：** 工作已经开始，但你感觉 Agent 没理解原始意图、正在做额外的事、过度工程化、把完整目标压小，或想对整个开发历程做一次复盘。
- **怎么用：** `使用 $control-loop-harness，先停止受影响的工作，只读检查 <具体方向> 是否偏离了我的原始需求，不要修改。` 如果要看完整历史，明确说“做全局复盘”；否则默认只检查你指出的局部问题。
- **能做到什么：** 从原始需求、后续批准的调整和当前文件／运行证据中恢复目标；检查产品缩水、过度设计、Agent 主动性与权限、ROI 或多能力完成度；给出有证据的独立判断和建议。一方面，局部纠偏会在指定观察范围内主动追查根因、相连后果和新问题；另一方面，全局复盘会先用经验模式寻找信号，再开放检查既有模式未覆盖的问题。同时，它只把当前证据支持的候选作为结论，并在范围扩张或修改前向用户汇报判断、建议并取得授权。

### 2. [`frontier-skill-creator`](skills/frontier-skill-creator/SKILL.md)

- **什么时候用：** 创建新的个人／项目 Skill，重构一个已经变得冗长或模板化的 Skill，或者评审它是否仍适合 frontier model。
- **怎么用：** `使用 $frontier-skill-creator，先备份并评审 <Skill 路径>，删除模型可以自行推断的流程，把低频经验改为按需 references；不要覆盖系统 Skill。` 包装、metadata 和 validator 继续复用官方 Skill 工具。
- **能做到什么：** 审核 trigger 是否准确，区分应留在 `SKILL.md`、references、scripts 和 assets 的内容，移除通用教程、重复真源、固定问题数量和推测性完整，并完成结构与编码校验。它是基于对 frontier model 能力、上下文负担和概率性行为理解而构建的“创作 Skill 的 Skill”，目标是提高 intelligence density，让模型把上下文用于自主判断。

### 3. [`codex-grill-me`](skills/codex-grill-me/SKILL.md)

- **什么时候用：** 重要工作尚未开始，而你担心 Agent 只理解了字面要求，没有理解实际想解决的问题；尤其适合上下文很多、你不想重新解释项目或回答长问卷，希望 Agent 先消化证据并向你汇报时使用。
- **怎么用：** `使用 $codex-grill-me，先读取现有项目证据，用适合人类理解和决策的语言汇报必要背景、你对真实目标的理解、已核实事实、可能走偏的地方、你的判断与推荐，以及需要我确认的少数决定；保持只读，等我确认后再开工。`
- **能做到什么：** 主动读取可发现的文件、文档、截图和运行证据，把复杂上下文整理成一份面向人类决策的对齐汇报；提炼理解和判断所必需的内容；明确说明 Agent 自己的判断、推荐、理由和不同选择的后果，只保留属于用户的决定。用户通常只需回复 `OK`、`mostly OK, but...` 或指出少数修正，Agent 负责完成前置的需求分析和方案整理。
- **与最初流行的 `grill-me` 有什么不同：** 早期做法更像按问题清单让用户补全需求，重点是“Agent 问得够不够多”；本版让 Agent 先调查和判断，再用适合人类理解和决策的语言，把必要内容和自己的意见汇报清楚。问题数量和 unknown taxonomy 根据当前证据灵活处理；事实搜集、上下文理解、方案比较和初步推荐由 Agent 承担，用户只需决定会实质影响产品承诺、架构、数据权属、成本、范围或验收的事项。

### 4. [`goal-prompt-builder`](skills/goal-prompt-builder/SKILL.md)

- **什么时候用：** 起草、压缩或修正 Codex Goal / `/goal` objective，特别是长期任务、跨 Agent 接手、已有 Handoff 或复杂上下文的继续执行。
- **怎么用：** `使用 $goal-prompt-builder，根据当前 Handoff 和已验收基线，生成一份可复制的 /goal；保留完整结果、停止条件和完成边界，不要重写已有规格。`
- **能做到什么：** 在 context-bound 与 self-contained Goal 之间选择正确形态；继承 accepted baseline + Remaining delta；通过可靠真源路由项目资料；明确 stop-and-ask、停止当前路径和 completion blocker；保持完成分母稳定，并自动附上 Goal runtime usage 汇报行。
- **这个版本的变化：** Goal 根据上下文选择合适形态，保持完整结果与稳定完成边界；新发现先汇报范围影响，历史通过 accepted baseline + Remaining delta 按需加载。

### 5. [`cc-cooperate`](skills/cc-cooperate/SKILL.md)

- **什么时候用：** 你希望 Codex 负责理解目标、范围和验收，让 Claude Code / cc 负责一项有边界、可验证的实现工作。
- **怎么用：** `使用 $cc-cooperate，为 <任务> 准备 light / strict 协作包和一条给 cc 的短 Prompt；先不要启动 cc。` 如果已经拿到 cc 交付，可以要求它按同一 package 独立验收。
- **能做到什么：** 根据风险选择直接执行、light package 或 strict package；生成／维护项目唯一的 `docs/CODEX_CC_PACKAGE.md`，写明真源、Git baseline、允许和禁止文件、未知、停止条件、验证方式与 `CC_DELIVERY` 格式；cc 返回后比较真实 diff、修改范围和自报结果，由 Codex 给出通过、部分通过或未通过及 commit／deploy 决定。

### 6. [`doc-source-of-truth-consolidation`](skills/doc-source-of-truth-consolidation/SKILL.md)

- **什么时候用：** 多份产品、技术或执行文档互相冲突，用户原意与 Agent 输出混在一起，或者不知道哪份材料当前具有决定权。
- **怎么用：** `使用 $doc-source-of-truth-consolidation，先只读梳理 <目录> 的来源权威和冲突；确认后再整理 current SOT、归档历史并修复链接。`
- **能做到什么：** 按产品承诺、业务规则、架构、执行阶段、研究和历史等领域建立 source map；区分“应该是什么”的规范权威与“当前做到了什么”的描述性证据；记录冲突双方、阶段、污染来源和推荐裁决；在授权后合并明确结论、标记归档并修复仍指向旧真源的活动链接。

### 7. [`codex-handoff-retro`](skills/codex-handoff-retro/SKILL.md)

- **什么时候用：** 阶段结束、准备换 Agent／session、需要正式接手，或者想把这轮已经验证的经验留下来供以后复用。
- **怎么用：** `使用 $codex-handoff-retro，为 <项目／阶段> 写一份 Handoff`，或明确要求 `Retrospective`；只有需要持久文件时才会落盘。
- **能做到什么：** Handoff 记录当前目标、阶段、真源、运行方法、重要产物、已完成证据、剩余缺口、下一步和 do-not-touch 边界；Retro 记录有效决定、返工原因、被实现纠正的假设、可复用模式和仍应留在项目内的经验。交接文档聚焦可继续工作的状态与经验，聊天全文和普通状态汇报继续保留在各自的原始载体中。

### 8. [`git-layered-cleanup`](skills/git-layered-cleanup/SKILL.md)

- **什么时候用：** worktree 很乱，混有用户修改、生成物、媒体、敏感内容、多个嵌套仓库、ahead commits，或者 commit / push 意图并不清楚。
- **怎么用：** `使用 $git-layered-cleanup，先只读盘点 <路径> 中每个仓库和文件的归属、发布意图与风险；不要删除或推送，先给出分层方案。` 后续可以分别授权 stage、commit、push 或脆弱操作。
- **能做到什么：** 识别独立仓库、submodule 和 subtree 边界；把文件分为应提交、仅本地、忽略、取消跟踪或待决定；保护秘密和现有用户工作；在授权后形成范围清楚的提交，并分别验证 HEAD、剩余状态、upstream 与远端发布结果。历史改写、reset、force push、删除和 stash 都有独立权限与恢复要求。

### 9. [`prototype-user-journey-audit`](skills/prototype-user-journey-audit/SKILL.md)

- **什么时候用：** 想确认某条原型、Demo 或已实现路径是否真的让目标用户完成了承诺的事情，并把页面表现、backend 状态和 build 结果放回完整用户路径中评估。
- **怎么用：** `使用 $prototype-user-journey-audit，以 <目标用户> 从 <入口> 到 <预期结果> 做真实用户闭环走查；保持只读，不要扩展到整个产品。` 最好同时给出运行入口和批准的原型／规格。
- **能做到什么：** 沿 `用户意图 → 可见操作 → 产品处理／判断 → 可见结果 → 状态／记录 → 返回或下一步` 检查真实因果；识别无后果控件、装饰性 AI、虚假持久化、上下文丢失、fixture 泄漏和 evidence substitution；给出闭环是否成立、关键证据、最高杠杆修正和仍未验证的边界。数据源可以 mock，但业务规则和可见后果不能伪造。

### 10. [`fable5-delegation`](skills/fable5-delegation/SKILL.md)

- **什么时候用：** 项目资料散落在代码、文档和历史决定中，而你想把它交给 Fable 5 做独立产品、架构、设计、战略或项目恢复评审；也可以先判断这次调用是否值得成本。
- **怎么用：** `使用 $fable5-delegation，读取当前项目证据，整理一份交给 Fable 5 的低锚定评审包和一次性 Prompt；不要替它预设结论，也不要调用 Fable。`
- **能做到什么：** 选择独立评审、架构裁决、blind-spot、产品战略、设计批评或项目恢复等任务模式；整理 `Fable 5 Task Brief`、代码／文档／证据入口和权限边界；用脚本扫描目录或 ZIP 中的凭据风险、重复文件和大文件；Fable 返回后重新核对高影响结论，并在 decision ledger 中分为 accepted、needs-decision、needs-evidence、rejected 或 later，再转换成低成本执行任务。
- **为什么这样分工：** Codex 负责恢复事实和写评审包，Fable 5 承担稀缺的全局判断；普通实现和资料整理交给更合适的执行路径。Fable 5 的建议仍需回到真源和证据复核。

### 11. [`neo4j-agent-memory`](skills/neo4j-agent-memory/SKILL.md)

- **什么时候用：** 需要把重要事实、偏好、决策、项目状态、产物和下一步保存到外部图记忆，跨设备／session 召回，或者把一个高价值 thread／topic 摄取成可检索关系。
- **怎么用：** 先在本机通过环境变量或 machine-local profile 配置 Neo4j AuraDB，再点名：`使用 $neo4j-agent-memory，从 AuraDB 召回 <主题> 的当前决策和下一步；这次只读。` 写入时则明确说 Remember 或 Ingest 以及允许保存的范围。
- **能做到什么：** **Recall**：从 Topic、Conversation、SessionMemory、Decision、Fact、Preference、NextAction、Artifact 等节点定向召回并说明来源、时效和不确定性；**Remember**：用稳定 id 和关系写入一项结构化长期记忆；**Ingest**：把 thread/session 重建为 Conversation、MemoryChunk、事实、决定、产物和必要的原文证据。每次外部写入都会 read-back；公开仓库只提供 AuraDB 配置模板，不包含实例或凭据。

### 12. [`neo4j-memory-compaction`](skills/neo4j-memory-compaction/SKILL.md)

- **什么时候用：** AuraDB 中的 Agent memory 出现重复、过期行动、短命 artifact、原始对话噪声或过度压缩，需要审计、规划、执行清理或从旧压缩中恢复。
- **怎么用：** `使用 $neo4j-memory-compaction，连接当前 Neo4j memory，先只读审计 <范围> 的压缩候选，不要删除。` 只有用户接受候选范围后才进入 Execute；恢复时明确指定已有 recovery package。
- **能做到什么：** 预览候选节点、关系、语义覆盖和 before counts；按影响范围创建受影响子图或 full-graph recovery package；在删除前建立 summary、provenance 或稳定恢复路径；用小批次事务合并、归档、降级或删除，并通过 exact counts、read-back 和代表性检索证明当前状态、决定原因和真实下一步仍然可用。目标是提升召回语义，节点数和 Message 数的变化只是结果。

### 13. [`enfp-writing`](skills/enfp-writing/SKILL.md)

- **什么时候用：** 想把旅行、户外、关系、回望、书信、第一人称故事或人物独白写成主观在场鲜明、感受有层次的中文作品；也适合诊断和局部修改已有正文。
- **怎么用：** `使用 $enfp-writing，根据这些材料写一篇第一人称作品；保留事实边界和我已经确认的原句，先让人物、感受与当时的具体联系自然展开。`
- **能做到什么：** 以人物和在意之事组织材料，让景物、动作、原话和联想共同推动情感与认识；让抒情从实地可见之物中生长，让作者的判断、幽默与复杂心意保持自己的来路。它也提供非虚构边界和多轮共同改稿方法。ENFP 在这里是一种重视感受、联系、人物与开放可能的创作镜头，不是固定人格口吻。

### 14. [`enfp-friend`](skills/enfp-friend/SKILL.md)

- **什么时候用：** 想和一个有 ENFP 气质的 AI 朋友分享好消息、灵感和日常趣事，聊关系、选择、告别、失去或自责，也可以一起发散、复盘并商量下一步。
- **怎么用：** `使用 $enfp-friend，像一个有 ENFP 气质的朋友一样，和我认真聊聊这件正在发生的事。`
- **能做到什么：** 从这次谈话里具体的人、瞬间、原话和变化形成真实可辨的反应，再沿人物、联系、感觉或可能性自然聊开。它会根据内容选择热烈、好奇、幽默、认真或安静的参与方式，也能在需要时给出朋友式判断、现实选择和安全边界。这套画像参考创作者本人的 ENFP 倾向，同时保留为可迁移的谈话能力，不把 ENFP 变成固定口吻或人格模板。

## 设计取向

- 保留模型无法安全推断的 intent、经验、协议和风险边界，删掉通用教程与流程表演；
- 把每次都需要知道的内容留在 `SKILL.md`，把低频方法和环境差异放到按需 references；
- 允许 Agent 主动发现和提出更好的方案；涉及产品承诺、数据所有权、成本、破坏范围或验收标准的变化时，先向人说明；
- 选择满足当前结果所需的最小正确架构；以完整用户结果约束范围，让抽象、流程和兜底只服务当前真实需求；
- 把 edited、tested、committed、deployed、published 和 live-verified 当作不同事实；
- 让结论形态服从当前证据；最小实现以保护完整用户结果为前提。

## Codex 与 Claude Code

`skills/` 是公开 Skill 的 canonical source。Claude Code 默认复用同一份内容；只有平台语义确实不同的文件才放在 `claude-overlays/`。

- `cc-cooperate` 属于 Codex 侧的协调和验收角色，不迁移到 Claude Code；
- `goal-prompt-builder` 依赖 Codex Goal 与 `/goal` 语义，不迁移到 Claude Code；
- `agents/openai.yaml` 只用于 Codex 的 Skill UI，不复制到 Claude Code；
- 其余适配关系和退休入口记录在 `manifest.json`。

## 安装与校验

`install.ps1` 会安装 manifest 中列出的 Codex Skills，并同步对应的 Claude Code 适配版本。

```powershell
pwsh -File .\scripts\validate.ps1
pwsh -File .\scripts\install.ps1 -WhatIf
pwsh -File .\scripts\install.ps1
pwsh -File .\scripts\status.ps1
```

`install.ps1` 只管理 manifest 中列出的内容。覆盖前，它会把被替换内容备份到相应运行目录的 `harness-backups/<timestamp>`，不会删除未受管理的其他 Skills。
