import clearInputField from '../support/action/clearInputField'
import clickElement from '../support/action/clickElement'
import clickElementContaining from '../support/action/clickElementContaining'
import closeLastOpenedWindow from '../support/action/closeLastOpenedWindow'
import deleteCookies from '../support/action/deleteCookies'
import dragElement from '../support/action/dragElement'
import focusLastOpenedWindow from '../support/action/focusLastOpenedWindow'
import handleModal from '../support/action/handleModal'
import moveTo from '../support/action/moveTo'
import pause from '../support/action/pause'
import pressButton from '../support/action/pressButton'
import scroll from '../support/action/scroll'
import selectOption from '../support/action/selectOption'
import selectOptionByIndex from '../support/action/selectOptionByIndex'
import setCookie from '../support/action/setCookie'
import setInputField from '../support/action/setInputField'
import setPromptText from '../support/action/setPromptText'
import Propertytype from '../pageobjects/ffc-demo-property-type'
import ClaimName from '../pageobjects/ffc-demo-claimname'
import PropertyAccessible from '../pageobjects/ffc-demo-property-accessible'
import PropertyMineType from '../pageobjects/ffc-demo-mine-type'
import selectRadioOption from '../support/action/selectRadioOption'

const { When } = require('cucumber')

When(
  /^I (click|doubleclick) on the (link|button|element) "([^"]*)?"$/,
  clickElement
)

When(
  /^I (click) on the (link|button|element) containing "([^"]*)?"$/,
  clickElementContaining
)

When(/^I clicks on the button$/, function () {
  Propertytype.selectHomeRadioButton()
})

When(/^I click on the yes accessibilty button$/, function () {
  PropertyAccessible.selectYesRadioButton()
})

When(/^I click on the coal mine checkbox$/, function () {
  PropertyMineType.selectCoalCheckBox()
})

When(
  /^I input claim name$/, async () => {
    await ClaimName.claimNameInput()
  }
)

When(
  /^I (add|set) "([^"]*)?" to the inputfield "([^"]*)?"$/,
  setInputField
)

When(
  /^I clear the inputfield "([^"]*)?"$/,
  clearInputField
)

When(
  /^I drag element "([^"]*)?" to element "([^"]*)?"$/,
  dragElement
)

When(
  /^I pause for (\d+)ms$/,
  pause
)

When(
  /^I set a cookie "([^"]*)?" with the content "([^"]*)?"$/,
  setCookie
)

When(
  /^I delete the cookie "([^"]*)?"$/,
  deleteCookies
)

When(
  /^I press "([^"]*)?"$/,
  pressButton
)

When(
  /^I (accept|dismiss) the (alertbox|confirmbox|prompt)$/,
  handleModal
)

When(
  /^I enter "([^"]*)?" into the prompt$/,
  setPromptText
)

When(
  /^I scroll to element "([^"]*)?"$/,
  scroll
)

When(
  /^I close the last opened (window|tab)$/,
  closeLastOpenedWindow
)

When(
  /^I focus the last opened (window|tab)$/,
  focusLastOpenedWindow
)

When(
  /^I select the (\d+)(st|nd|rd|th) option for element "([^"]*)?"$/,
  selectOptionByIndex
)

When(
  /^I select the option with the (name|value|text) "([^"]*)?" for element "([^"]*)?"$/,
  selectOption
)

When(
  /^I select the radio option with the value "([^"]*)?" from the radio group "([^"]*)?"$/,
  selectRadioOption
)

When(
  /^I move to element "([^"]*)?"(?: with an offset of (\d+),(\d+))*$/,
  moveTo
)
