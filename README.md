# 英语语法简明教程

一本以「句子」为组织中心的英语语法教材，共十六章，分七个模块由浅入深推进，书末附三个检索用附录。面向初高中到大学阶段的学习者，也适合自学者与教师备课参考。

## 目录结构

| 模块 | 章节 | 主题 |
|---|---|---|
| 一、全景导览 | 第一章 | 语法全景导览 |
| 二、句子骨架 | 第二至三章 | 五大基本句型、句子成分 |
| 三、词类填充 | 第四至七章 | 名词与冠词、代词、形容词与副词、介词与连词 |
| 四、动词系统 | 第八至十一章 | 时态、被动语态与情态动词、非谓语动词 |
| 五、句子扩展 | 第十二至十三章 | 并列句与名词性从句、定语从句与状语从句 |
| 六、句子变形 | 第十四至十五章 | 虚拟语气与倒装、强调省略与主谓一致 |
| 七、语篇运用 | 第十六章 | 语篇衔接与时态呼应 |

附录：全书易错点速查、不规则动词表、语法术语表。


[点我开始阅读](./src/SUMMARY.md)

## 环境要求

- [mdBook](https://github.com/rust-lang/mdBook) v0.5+
- [mdbook-epub](https://github.com/michael-f-bryan/mdbook-epub)（仅构建 EPUB 时需要）

```
cargo install mdbook
cargo install mdbook-epub
```

## 使用

```bash
make serve     # 本地预览，自动重载（默认 http://localhost:3000）
make build     # 构建 HTML 到 book/
make epub      # 构建 EPUB 电子书到 book/
make check     # 校验环境与构建
make clean     # 删除构建产物
```

不使用 `make` 时直接调用 `mdbook build` / `mdbook serve` / `mdbook-epub -s .` 亦可。

## 目录结构

```
book.toml      # mdBook 配置
Makefile       # 常用命令
src/
  SUMMARY.md   # 目录（决定章节顺序与导航）
  chapter-00.md          # 本书导览
  chapter-01.md ... 16   # 第一至十六章
  appendix-01.md ... 03  # 三个附录
book/          # 构建产物，已忽略
```

新增章节：在 `src/` 建文件，再登记到 `src/SUMMARY.md`。
