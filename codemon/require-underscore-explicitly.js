module.exports = function(file, api) {
  const j = api.jscodeshift;

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

  const isUnderscoreUsed = (path) => {
    return j(path)
      .find(j.MemberExpression, {
          object: {
              type: 'Identifier',
                name: '_'
            }
      })
      .size() > 0;
  };

  const isUnderscoreRequired = (path) => {
    return j(path)
      .find(j.VariableDeclarator)
        .filter((path) => {
          // check id
          let id = path.value.id;

          if (id.type !== 'Identifier' || id.name !== '_') {
              return false;
            }

          // check value
          let init = path.value.init;

          if (init.type !== 'CallExpression') {
              return false;
            }

          if (init.callee.type !== 'Identifier' || init.callee.name !== 'require') {
              return false;
            }

          if (arguments.length === 0) {
              return false;
            }

          if (init.arguments[0].type !== 'Literal' || init.arguments[0].value !== 'underscore') {
                return false;
            }

          return true;
      })
      .size() > 0;
  };

  const fixUnderscore = (path) => {
    if (!isUnderscoreUsed(path)) {
      return;
    }

    if (isUnderscoreRequired(path)) {
      return;
    }

    let body = path.value.body.body;
    let requireVar = createRequireVar('_', 'underscore');

    // append underscore
    // append after "use strict"
    if (body[0].type === 'ExpressionStatement' &&
        body[0].expression.type === 'Literal' &&
        body[0].expression.value === 'use strict') {
      body.splice(1, 0, requireVar);
    } else {
      body.unshift(requireVar);
    }

    return true;
  };

  const root = j(file.source);
  let didTransform = false;

  root
    .find(j.CallExpression, { callee: { name: 'define' } })
    .forEach((path) => {
        j(path)
          .find(j.FunctionExpression)
          .forEach((path, index) => {
            if (index === 0 && fixUnderscore(path)) {
              didTransform = true;
            }
          });
      });

  return didTransform ? root.toSource({ quote: 'single' }) : null;
};
