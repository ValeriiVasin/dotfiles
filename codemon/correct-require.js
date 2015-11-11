/**
 * Replace AMD require style to CJS one
 *
 * @example
 *
 * define(['dep1', 'dep2'], function(dep1, dep2) {...});
 *
 * will be converted to:
 *
 * define(function(require) {
 *   var dep1 = require('dep1');
 *   var dep2 = require('dep2');
 *   ...
 * });
 */

module.exports = function(file, api) {
  const j = api.jscodeshift;
  const {expression, statement, statements} = j.template;

  const createRequire = (id, requireName) => {
    return j.variableDeclarator(
      id,
      j.callExpression(
        j.identifier('require'),
        [j.literal(requireName)]
      )
    );
  }

  const createRequireVar = (id, requireName) => {
    return j.variableDeclaration(
      'var',
      [createRequire(j.identifier(id), requireName) ]
    );
  };

  const filterIncorrectDefines = (path) => {
      return path.value.arguments &&
        path.value.arguments.length === 2 &&
        path.value.arguments[0].type === 'ArrayExpression' &&
        path.value.arguments[1].type === 'FunctionExpression';
  }

  const createFunctionBody = (path) => {
    let args = path.value.arguments;
    let oldBodyBlock = args[1].body;
    let body = oldBodyBlock.body;

    let deps = args[0].elements.map((element) => element.value);

    let requires = args[1].params.map((param, index) => {
      return createRequireVar(param.name, deps[index]);
    });

    // append after "use strict"
    if (body[0].type === 'ExpressionStatement' &&
        body[0].expression.type === 'Literal' &&
        body[0].expression.value === 'use strict') {
      body.splice(1, 0, ...requires);
    } else {
      body.unshift(...requires);
    }

    return oldBodyBlock;
  };

  const replaceDefine = (path) => {
      return j.callExpression(
        j.identifier('define'),
        [
          j.functionExpression(
            null,
            [j.identifier('require')],
            createFunctionBody(path)
          )
        ]
      )
  }

  const root = j(file.source);

  const didTransform = root
    .find(j.CallExpression, { callee: { name: 'define' } })
    .filter(filterIncorrectDefines)
    .replaceWith(replaceDefine)
    .size() > 0;

  return didTransform ? root.toSource({ quote: 'single' }) : null;
};
