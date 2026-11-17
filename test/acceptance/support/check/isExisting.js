/**
 * Check if the given element exists in the current DOM
 * @param  {String}   selector  Element selector
 * @param  {String}   falseCase Whether to check if the element exists or not
 */
export default async (selector, falseCase) => {
  /**
     * Elements found in the DOM
     * @type {Object}
     */
  const elements = await $$(selector)

  if (falseCase) {
    expect(elements.length).to
      .equal(0, `Expected element "${selector}" not to exist`)
  } else {
    expect(elements.length).to
      .be.above(0, `Expected element "${selector}" to exist`)
  }
}
