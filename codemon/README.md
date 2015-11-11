# Inspiration
* [Christoph Pojer: Evolving Complex Systems Incrementally | JSConf EU 2015](https://www.youtube.com/watch?v=d0pOgY8__JM)


# Tools

* [JSCodeShift](https://github.com/facebook/jscodeshift)
* [AST Explorer](http://felix-kling.de/esprima_ast_explorer)

# Examples

Transformations examples:
  https://github.com/facebook/jscodeshift/wiki/Codemod-Examples
  https://github.com/cpojer/js-codemod/tree/master/transforms

What is done:
1) Replace require('...') calls
2) Replace _.bind(fn, context) to fn.bind(context)
3) Explicite underscore require

Possible transformations:

1) $.extend / _.extend => Object.assign
2) Replace appDependencies.<service>.method() => require(<service>) + <service>.method()

Tools for fun:
* js-replace: in-file replacement
* in-mv: move your file and do not thing about dependencies
