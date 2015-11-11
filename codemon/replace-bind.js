/**
 * Replace _.bind(fn, context) with fn.bind(context)
 */

module.exports = function(file, api) {
  const j = api.jscodeshift;

  let BIND_CALL_EXPRESSION = {
    callee: {
      type: 'MemberExpression',
      object: { type: 'Identifier', name: '_' },
      property: { type: 'Identifier', name: 'bind' }
    }
  };

  const root = j(file.source);

  const didTransform = root
    .find(j.CallExpression, BIND_CALL_EXPRESSION)
    .replaceWith((path) => {
      return j.memberExpression(
        path.value.arguments[0],
        j.callExpression(
          j.identifier('bind'),
          path.value.arguments.slice(1)
        )
      );
    })
    .size() > 0;

    return didTransform ? root.toSource({ quote: 'single' }) : null;
};

