/**
 * Wait for the given element to be enabled, displayed, or to exist
* @param  {String}   selector                  Element selector
 * @param  {String}   ms                       Wait duration (optional)
 * @param  {String}   falseState               Check for opposite state
 * @param  {String}   state                    State to check for (default
 *                                             existence)
 */
export default async (selector, ms, falseState, state) => {
  /**
     * Maximum number of milliseconds to wait, default 3000
     * @type {Int}
     */
  const intMs = parseInt(ms, 10) || 3000

  /**
     * Boolean interpretation of the false state
     * @type {Boolean}
     */
  const reverse = !!falseState

  /**
     * Parsed interpretation of the state (last word, default existence)
     * @type {String}
     */
  const parsedState = state ? state.split(/\s/).pop() : 'exist'

  const element = $(selector)

  const conditions = {
    exist: () => element.isExisting(),
    displayed: () => element.isDisplayed(),
    enabled: () => element.isEnabled(),
    checked: () => element.isSelected(),
    selected: () => element.isSelected(),
    text: async () => (await element.getText()) !== '',
    value: async () => (await element.getValue()) !== ''
  }

  const condition = conditions[parsedState]
  if (!condition) {
    throw new Error(`Unknown wait state "${state}"`)
  }

  await browser.waitUntil(
    async () => (await condition()) !== reverse,
    {
      timeout: intMs,
      timeoutMsg: `Element "${selector}" did not ${reverse ? 'stop being' : 'become'} "${parsedState}" within ${intMs}ms`
    }
  )
}
