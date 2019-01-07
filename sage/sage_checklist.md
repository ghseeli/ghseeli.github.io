When developing a new package for SageMath, it can feel daunting, especially because your code is subject to public review and needs to meet a myriad of standards. The definitive guide for these standards is the [official developer guide](https://doc.sagemath.org/html/en/developer/coding_basics.html). Another helpful resource is [the reviewer's checklist](https://doc.sagemath.org/html/en/developer/reviewer_checklist.html). You should always try to go ahead and do a review of your own review. You probably will not catch everything, but it is good to know what reviewers will be looking for!

Most notably, SageMath packages are expected to adhere to general Python coding conventions as well as extra SageMath conventions. The Developer's Guide does a good job enumerating all of these, but I want to list a few key things developed by my former colleague [Matthew Lancellotti](http://matthewlancellotti.com/) when he was migrating code into SageMath. [Original source](https://github.com/MareoRaft/k_combinat_for_sage/issues/8)

Even as someone who has contributed multiple bits of Sage code, I can have a hard time keeping track of all these conventions. So, this list is primarily made for my reference but publicly available in case it might help you, too.

1. Follow [PEP 8](https://www.python.org/dev/peps/pep-0008/) coding conventions. A handy tool to help you is [autopep8](https://pypi.org/project/autopep8/).
1. Make sure *every* class, method (except an `__init__` method), and function has a docstring and, at minimum,...

- that they conform to [PEP 257](https://www.python.org/dev/peps/pep-0257/),
- that the first sentence concisely describes the function in a declarative form. Eg, for the `add_cell` method of the `Partition` class, the beginning line of the docstring says `Return a partition corresponding to "self" with a cell added in row "i". (This does not change "self".)`,
- that further exposition defining any new terms or providing references for curious users is given after the opening sentence and a blank line,
- that they include an example in an EXAMPLES block with insightful examples that also test the code well.

1. If a function has multiple different ways of computing its output, the user should be able to specify which algorithm to use with an optional parameter `algorithm`.
1. When verifying that input parameters for an object are "correct", use a `check` method. 
1. While older SageMath code may not follow this convention, references should go in the master bibliography file. In the SageMath source tree, this file is located at `src/doc/en/reference/references/index.rst` at the time of this writing.
1. When implementing new algebraic structures, look at these guides. [Implementing Algebraic Structures](https://doc.sagemath.org/html/en/thematic_tutorials/tutorial-implementing-algebraic-structures.html), [How to implement new algebraic structures in Sage](https://doc.sagemath.org/html/en/thematic_tutorials/coercion_and_categories.html). In particular, 

- make sure you understand the "Parent" and "Element" design pattern in SageMath,
- make sure your "Parent" is unique, easily done by inheriting from `UniqueRepresentation`,
- implement single underscore methods instead of double underscore methods. For instance, `_repr_`, as well as `_add_`, `_mul_`, etc. 
- make sure your algebraic object fits into Sage's category framework. 

Recommendations
---

Furthermore, while not required by SageMath rules, here are some recommended techniques I have found to minimize headaches.

1. Just make all docstrings multi-line raw docstrings. In otherwords, always wrap them in `r""" ... """`. Sage does not require this, but most docstrings in Sage do it.
1. Include a `.. SEELALSO:` block when relevant. You can reference other classes anywhere in your docstrings via the convention `:class:Foo`, other methods via `:meth:foo_bar`, and functions via `:func:foo_var`.

Weird headaches I have run into
---

1. When adding a new file to the source code, make sure you add relevant `import` statements to the `all.py` file in the directory so that the important functions and classes are added to the namespace. 
1. When adding a new file specifically to the `combinat` module, make sure to add a line to the `src/doc/en/reference/combinat/module_list.rst` file so the documentation is added to Sage.
1. Sage requires that all lines in your source file are broken at 80 characters except in certain cases. If you do not do this, someone will most certainly comment on your Trac ticket telling you to do so. There are some exceptions to this rule, as far as I can tell.

- In codeblocks inside documentation, such as inside `EXAMPLES` and `TESTS` blocks, code seems to not limited to 80 characters.
- I have seen that long strings in the Sage library, such as error statements, are often not forced to be line wrapped. I believe this happens because, although this functionality is possible, it disagrees with indentation structure. For example,
```
>>> if True:
...     raise ValueError("Oh no! You have triggered a very very \
... very very very very very long error!")
... 
Traceback (most recent call last):
  File "<stdin>", line 3, in <module>
ValueError: Oh no! You have triggered a very very very very very very very long error!
```
but
```
>>> if True:
...     raise ValueError("Oh no! You have triggered a very very \
...                       very very very very very long error!")
... 
Traceback (most recent call last):
  File "<stdin>", line 3, in <module>
ValueError: Oh no! You have triggered a very very 			  very very very very very long error!
```
However, probably the best thing to do to avoid this altogether is 
```
>>> error_msg = "oh no! You have triggered a very very very very \
very very very very long error!"
>>> if True:
...     raise ValueError(error_msg)
... 
Traceback (most recent call last):
  File "<stdin>", line 2, in <module>
ValueError: oh no! You have triggered a very very very very very very very very long error!
```
1. When meeting the 80 character line limit, you must make sure bulleted lists follow an indentation structure like so: 
```
INPUT:

- ``directed`` -- (default: ``False``) whether to have the dual
  equivalence graph be directed (where we have a directed edge
  `S \to T` if `i` appears to the left of `i+1` in the
  reading word of `T`; otherwise we have the directed edge
  `T \to S`)
```
