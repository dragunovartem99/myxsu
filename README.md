# myxsu

Project is fully based on the [genius idea](https://github.com/yegor256/jttu) by [Yegor Bugayenko](https://github.com/yegor256)

- no API
- no database
- just good old HTML

> This URL shortener works with **just 20 lines of Bash** — [check it out!](./myxsu)

## How to use it?

All redirects are defined in [`urls`](./urls), as a Bash [associative array](https://www.gnu.org/software/bash/manual/html_node/Arrays.html):

```bash
# this serves as a poor man's database

export -A urls=(
	["git"]=https://github.com/dragunovartem99/myxsu
)
```

Each entry maps a `short_url` (key) to a `full_url` (value)

So `git` here means that [myx.su/git](https://myx.su/git) redirects to https://github.com/dragunovartem99/myxsu. Try it 😉

## Automation under the hood

For each `short_url` → `full_url` pair in `urls`, [`myxsu`](./myxsu):

1. takes the [redirect.html](./redirect.html) template
2. replaces its `{url}` placeholder with `full_url`
3. saves the result as `short_url.html` in the `out_dir` (`dist`)

The generated `redirect.html` redirects the user via JavaScript, with fallback mechanisms

For example, the `git` entry produces [git.html](https://github.com/dragunovartem99/myxsu/blob/gh-pages/git.html)

You can see the generated `dist` on the [gh-pages](https://github.com/dragunovartem99/myxsu/tree/gh-pages) branch
