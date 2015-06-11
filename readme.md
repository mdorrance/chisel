During week for at Turing we were challenged with making our own Markdown Parser.

I was able to get multiple links working and still working on the "Bonus" features.

You will need to use Chisel from the command line, reading in Markdown
files and writing out HTML. It'll go like this:

```bash
$ ruby ./lib/chisel.rb my_input.markdown my_output.html
Converted my_input.markdown (6 lines) to my_output.html (8 lines)
```

Where `my_input.markdown` is a file like this:

```markdown
# My Life in Desserts

## Chapter 1: The Beginning

"You just *have* to try the cheesecake," he said. "Ever since it appeared in
**Food & Wine** this place has been packed every night."
```

And the resulting `my_output.html` would contain the following:

```html
<h1>My Life in Desserts</h1>

<h2>Chapter 1: The Beginning</h2>

<p>
  "You just <em>have</em> to try the cheesecake," he said. "Ever since it appeared in
  <strong>Food &amp; Wine</strong> this place has been packed every night."
</p>
```

Have fun and let me know of any additional refactoring you would suggest.

Please note that using Regex was prohibited with this project.