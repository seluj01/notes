Markdown
======
highest title style has two possible synthax, `# Title` or
```
Titles
======
``` 
Second-highest title style has two possible synthax, `## H2` or
```
H2
------
``` 
### H3
Other titles are obtained as `### H3`, `#### H4`, `##### H5`, `###### H6`.
#### H4
##### H5
###### H6

Use at least three `-`, `*` or `_`, e.g. `---` for a horizontal rule.

---


### Text style
Comment markdown code as  
`<!-- This content will not appear in the rendered Markdown -->`
<!-- This content will not appear in the rendered Markdown -->
Leave a blank line for a new paragraph with space in-between.
Leave two spaces at end of line for line break, or use `\`.

`**bold text**` for  **bold text**  
`_italicized text_`for _italicized text_  
`~~strikethrough text~~` for ~~strikethrough text~~  
`_italic_` inside `**bold text**` for **bold _italic_ text**  
`***bold italic text***` for ***bold italic text***  
`<sup>superscript</sup> text` for <sup>superscript</sup> text  
`<ins>underlined</ins> text` for <ins>underlined</ins> text


````
`code`
````
for `code`

`> quote` for a 
> quote  
> second line in quote


### Internet links

`[GitHub link](https://github.com)` for [GitHub link](https://github.com/)

<a href="https://www.youtube.com/watch?v=fSytzGwwBVw" target="_blank"><img src="https://img.youtube.com/vi/fSytzGwwBVw/0.jpg" 
alt="Machine Learning Fundamentals: Cross Validation" width="200" height="180" border="2" /></a>

### Local links
`[Link to code section](#code)` for [Link to code section in other file](test002.md#code)

`![reference to local file](img/classmate.png)` for a [reference to local file](img/classmate.png)

`![two people](img/classmate.png)` for ![two people](img/classmate.png)

or better, to control image size, `!<img src="img/classmate.png" alt="two people" width="200"/>` for <img src="img/classmate.png" alt="two people" width="200"/>


### Code
Blocks of code for specific languages are written by encompassing them with ` ``` ` and specifying the language on the first ` ``` `, e.g. ` ```cpp `.
```cpp
#include<iostream>
int main()
{
std::cout << "Hello World!\n";
}
```

### Lists
Unordered lists with either `-`, `*` or `+` at begining of line, and ordered lists with `1.`, `2.`, etc.  
Nested lists with a tab, so marker is below above item's text.
```
- item a
   1. item a1
   2. item a2
* item b
    * some item
    * some other item
        - with a sub-item
+ item c
```
- item a
   1. item a1
   2. item a2
* item b
    * some item
    * some other item
        - with a sub-item
+ item c

### Tables
Colons can be used to align columns.
```
| Tables        | Are           | Cool  |
| ------------- |:-------------:| -----:|
| col 3 is      | right-aligned | $1600 |
| col 2 is      | centered      |   $12 |
| zebra stripes | are neat      |    $1 |
```
There must be at least 3 dashes separating each header cell.
The outer pipes (|) are optional, and you don't need to make the 
raw Markdown line up prettily. You can also use inline Markdown.

| Tables        | Are           | Cool  |
| ------------- |:-------------:| -----:|
| col 3 is      | right-aligned | $1600 |
| col 2 is      | centered      |   $12 |
| zebra stripes | are neat      |    $1 |


### Equations 
For inline math, use `\( a \)` for \(a\)

For equations, use `$$ $$`

The Cauchy-Schwarz Inequality,
$$\left( \sum_{k=1}^n a_k b_k \right)^2 \leq \left( \sum_{k=1}^n a_k^2 \right) \left( \sum_{k=1}^n b_k^2 \right)$$


### Collapsible sections
<details>

<summary>Tips for collapsed sections</summary>

### You can add a header

You can add text within a collapsed section.

You can add an image or a code block, too.

```ruby
   puts "Hello World"
```

</details>

<details open>

<summary>Collapsed sections</summary>

This one is opened by default

</details>

<details>
<summary>Section A</summary>
<details>
<summary>Section A.B</summary>
<details>
<summary>Section A.B.C</summary>
<details>
<summary>Section A.B.C.D</summary>
  Done!
</details>
</details>
</details>
</details>