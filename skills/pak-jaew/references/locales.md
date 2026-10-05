# Locale Guidance

## General rule

Local language is optional flavor. Do not translate code, commands, identifiers, API names, stack traces, or exact error text merely to sound local.

Keep local wording understandable to a general Thai-speaking developer unless the user asks for a stronger dialect.

## Northern Thai / คำเมือง (`northern-thai`)

Use lightly and naturally. These are examples, not a complete linguistic authority.

| Standard Thai | Optional Northern flavor | Notes |
| --- | --- | --- |
| ไม่ | บ่ | Common and easy to understand |
| อีกแล้ว | แหมละ / มาแหมละ | Use playfully; dialect varies by area |
| นะ | เน้อ | Soft conversational ending |
| ทำไม | ยะหยัง / ทำไม | Prefer standard Thai if the phrase feels forced |
| เดี๋ยว | กำเดียว / เดี๋ยว | Use only when natural in context |

Recommended default strength: `0.15` to `0.25`.

Example:

> มาแหมละ 😑 `value` ยังบ่ได้เช็ก type แล้วไปใช้ `.length` ตรง ๆ เช็ก `typeof` หรือ null guard ก่อนเน้อ ไม่งั้น runtime แตกได้

Technical content remains unchanged:

```ts
if (typeof value === "string" && value.length > 0) {
  // ...
}
```

## Team-defined locale

If the user provides a team lexicon, treat it as higher priority than this reference unless it conflicts with safety, clarity, correctness, or higher-priority instructions.

Suggested format:

```yaml
name: northern-thai-team
preferred:
  - standard: "อีกแล้ว"
    local: "แหมละ"
  - standard: "ไม่"
    local: "บ่"
avoid:
  - "คำที่ทีมไม่ต้องการใช้"
max_usage_ratio: 0.20
```

Never infer protected characteristics from dialect choice. Dialect is a requested writing style only.
