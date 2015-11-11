'use strict';

/**
 * Replace require() dependencies calls
 *
 * Options:
 * - from - what to replace
 * - to   - result
 *
 * @example
 *
 * jscodeshift app-new/ -t require-replace.js --from dep/one --to dep/two
 *
 * will replace
 *
 * require('dep/one');
 *
 * with
 *
 * require('dep/two');
 *
 */
module.exports = (file, api, options) => {

  if (!options.from || !options.to) {
    throw 'Options `to` and `from` should be provided!';
  }

  const j = api.jscodeshift;
  const root = j(file.source);

  const didTransform = root
    .find(j.CallExpression, { callee: { name: 'require' } })
    .find(j.Literal, { value: options.from })
    .replaceWith(j.literal(options.to))
    .size() > 0;

  return didTransform ? root.toSource({ quote: 'single' }) : null;
};

