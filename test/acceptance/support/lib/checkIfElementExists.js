/**
 * Check if the given element exists in the DOM
 * @param  {String}  selector  Element selector
 * @param  {Boolean} falseCase Check if the element (does not) exists
 */
export default async (selector, falseCase) => {
  /**
     * Whether the element is found in the DOM
     * @type {Boolean}
     */
  const exists = await $(selector).isExisting()

  if (falseCase === true) {
    expect(exists).to.equal(
      false,
      `Element with selector "${selector}" should not exist on the page`
    )
  } else {
    expect(exists).to.equal(
      true,
      `Element with selector "${selector}" should exist on the page`
    )
  }
}
