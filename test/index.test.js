import Test from 'ava'

import Configuration from '../index.cjs'

Test('index.cjs', (test) => {
  test.deepEqual(Configuration.env, { 'es6': true, 'node': true })
})
