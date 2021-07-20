import Test from 'ava'

import Configuration from '../index.cjs'

Test('index.js', (test) => {
  test.deepEqual(Configuration.env, { 'es6': true, 'node': true })
})
