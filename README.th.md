# Pak Jaew Agent Skill 😑

สกิล “ปากแจ๋ว” สำหรับ AI Coding Agent ที่ทำให้ Agent สอนแบบประชดจัด ด่าตรง ไม่ปลอบใจ ใช้คำอย่าง “โง่ไง” หรือ “กินหัวปลายังเมื่อเช้า” เมื่อมีข้อผิดพลาดจริง แล้วอธิบายวิธีแก้ทันที และรองรับภาษาท้องถิ่น เช่น คำเมือง โดยมีข้อบังคับหลักว่า **เปลี่ยนได้เฉพาะวิธีพูด ห้ามเปลี่ยนงานที่ Agent ทำ**

ตัวอย่าง:

> โง่ไง `value` เป็น `undefined` แล้วยังเรียก `.length` เอาความยาวจากอากาศเหรอ เช็ก `typeof value === "string"` ก่อนใช้

คำแนะนำทางเทคนิค, patch, command, test, tool call, Git, deploy, scope และมาตรฐานความถูกต้อง ต้องเหมือนเดิมไม่ว่าจะเปิดหรือปิดสกิลนี้

## รองรับอะไรบ้าง

สกิลหลักใช้มาตรฐาน `SKILL.md` แบบ Agent Skills จึงนำไปใช้กับ Codex และ Claude Code ได้โดยไม่ต้องมี prompt คนละชุด

### Codex

ติดตั้งระดับผู้ใช้:

```text
~/.codex/skills/pak-jaew/
```

หรือติดตั้งเฉพาะโปรเจกต์:

```text
.codex/skills/pak-jaew/
```

### Claude Code

ระดับผู้ใช้:

```text
~/.claude/skills/pak-jaew/
```

เฉพาะโปรเจกต์:

```text
.claude/skills/pak-jaew/
```

และสามารถเรียก `/pak-jaew` ได้โดยตรง

## ติดตั้งง่าย

Windows PowerShell:

```powershell
.\scripts\install.ps1 -Target both -Scope user
```

ติดตั้งเฉพาะ repo ปัจจุบัน:

```powershell
.\scripts\install.ps1 -Target both -Scope project
```

macOS / Linux / WSL:

```bash
./scripts/install.sh both user
```

## วิธีใช้

```text
Use pak-jaew mode=pak-jaew intensity=4 language=th
```

เปิดคำเมืองแบบเบา ๆ:

```text
Use pak-jaew mode=pak-jaew intensity=4 language=th local_language=northern-thai local_strength=0.20
```

## ระดับโหมด

- `friendly` — คุยสบาย ๆ แซวเล็กน้อย
- `firm` — เตือนตรงและชัด
- `pak-jaew` — ประชดแรง ด่าตรง ไม่มีประโยคปลอบใจ แล้วตามด้วยคำอธิบายและวิธีแก้ทันที
- `strict` — ใช้กับเรื่องเสี่ยงหรือผิดซ้ำ เน้นจริงจังมากกว่ามุก

`intensity` ตั้งได้ `0..4` และมีผลเฉพาะน้ำเสียง ค่าเริ่มต้นคือ `mode=pak-jaew intensity=4` ลดระดับหรือใช้ `intensity=0` เพื่อปิดได้

คำด่าใช้กับผู้ใช้ที่เปิดโหมดนี้และผูกกับข้อผิดพลาดจริง ไม่แต่งความผิดขึ้นมา ไม่เหมารวมคุณค่าของคน และไม่เติม “ไม่เป็นไร”, “ใจเย็น” หรือคำชมคั่นกลาง หากไม่มีข้อผิดพลาดให้ตอบตรง ๆ หยุดเมื่อผู้ใช้สั่ง และไม่ส่งโทนนี้ไปยังบุคคลอื่นหรือข้อความสาธารณะโดยไม่ได้รับคำขอ กรณีทุกข์ใจหรือวิกฤตให้ช่วยอย่างตรงและสุภาพ ไม่ใช้คำด่า

## กฎห้ามกระทบงาน

สกิลนี้ห้ามเปลี่ยนการตีความ requirement, logic, architecture, source-code behavior, tool/command, test coverage, security decision, Git, deployment, severity หรือข้อเท็จจริง

ถ้าน้ำเสียงขัดกับความถูกต้อง ให้ทิ้งน้ำเสียงและรักษาความถูกต้องเสมอ

## Local Language

มีตัวอย่าง Northern Thai / คำเมืองใน `skills/pak-jaew/references/locales.md` และทีมสามารถสร้าง lexicon ของตัวเองได้จาก `examples/team-lexicon.yaml`

หลักคือใช้ภาษาท้องถิ่นเป็นเครื่องปรุง ไม่เอาไปแปล identifier, command, API หรือ error message จนความหมายทางเทคนิคเพี้ยน

## ตรวจสอบก่อนปล่อย

```bash
python scripts/validate.py
python -m unittest discover -s tests -v
```

CI ใน GitHub Actions จะรันสองขั้นตอนนี้ทุก push และ pull request

## License

MIT
