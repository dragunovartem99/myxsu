# myxsu

Project is fully based on the [genius idea](https://github.com/yegor256/jttu) by [Yegor Bugayenko](https://github.com/yegor256)

- no API
- no database
- just good old HTML

> This URL shortener works with **just 20 lines of Bash** — [check it out!](./myxsu)

## How to use it?

We have key-value pair data structure in [`urls`](./urls)  
In Bash, these [are called](https://www.gnu.org/software/bash/manual/html_node/Arrays.html) "associative arrays"  

```bash
# this serves as a poor man's database

declare -A urls=(
	[git]=https://github.com/dragunovartem99/myxsu
)
```

Here, `git` key is the _alias_ (key), and https://github.com/dragunovartem99/myxsu is the _full link_ (value)

It means that https://myx.su/git will redirect to the full link. You can try it right now 😉

## Automation under the hood

1. For every entry in `urls`, a new HTML file is created
2. Each HTML file is based on [redirect.html](./redirect.html) template
3. This HTML file redirects user via JavaScript (with fallback mechanisms)

Steps 1 and 2 are simple. `myxsu` iterates over the aliases in `urls` and:
- replaces the `{url}` placeholder in the [redirect.html](./redirect.html) template with the full link
- creates a new HTML file with the alias as its name

For the `git` key, it will create [git.html](https://github.com/dragunovartem99/myxsu/blob/gh-pages/git.html)

You can examine the final `dist` on this branch: https://github.com/dragunovartem99/myxsu/tree/gh-pages 
