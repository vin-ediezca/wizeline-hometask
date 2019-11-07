require 'selenium-webdriver'
require 'minitest/autorun'

class TestSignup < Minitest::Test
  def setup
    options = Selenium::WebDriver::Chrome::Options.new(args: ['no-sandbox', 'start-maximized'])
    @browser = Selenium::WebDriver.for(:chrome, options: options)
    @wait = Selenium::WebDriver::Wait.new(timeout: 30)
  end

  def test_can_access_signup_page_fillup_form_and_submit
    @browser.navigate.to('https://www.utest.com')

    signup_link = @wait.until do
      element = @browser.find_element(xpath: '//*[@id="nav-bar-container"]/div/div/div/a[2]')
      element if element.displayed?
    end

    assert_match(/Sign Up For Free/, signup_link.text)

    signup_link.click

    form_title = @wait.until do
      element = @browser.find_element(xpath: '//*[@id="regs_container"]/div/div[2]/div/div[1]/div/div/h1/span[2]')
      element if element.displayed?
    end

    assert_match(/Tell us about yourself/, form_title.text)

    @browser.find_element(id: 'firstName')
            .send_keys('First')
    @browser.find_element(id: 'lastName')
            .send_keys('Last')
    @browser.find_element(id: 'email')
            .send_keys('test.email@website.com')
    @browser.find_element(id: 'birthMonth')
            .click
    @browser.find_element(xpath: '//*[@id="birthMonth"]/input[1]')
            .send_keys('December', :enter)
    @browser.find_element(id: 'birthDay')
            .click
    @browser.find_element(xpath: '//*[@id="birthDay"]/input[1]')
            .send_keys('31', :enter)
    @browser.find_element(id: 'birthYear')
            .click
    @browser.find_element(xpath: '//*[@id="birthYear"]/input[1]')
            .send_keys('1992', :enter)
    @browser.find_element(id: 'genderCode')
            .click
    @browser.find_element(xpath: '//*[@id="genderCode"]/input[1]')
            .send_keys('Male', :enter)
    @browser.find_element(xpath: '//*[@id="regs_container"]/div/div[2]/div/div[2]/div/form/div[2]/a')
            .click

    form_title_2 = @wait.until do
      element = @browser.find_element(xpath: '//*[@id="regs_container"]/div/div[2]/div/div[1]/div/div/h1/span[2]')
      element if element.displayed?
    end

    assert_match(/Add your address/, form_title_2.text)
  end

  def test_can_access_signup_page_fillup_form_with_invalid_email_and_submit
    @browser.navigate.to('https://www.utest.com')

    signup_link = @wait.until do
      element = @browser.find_element(xpath: '//*[@id="nav-bar-container"]/div/div/div/a[2]')
      element if element.displayed?
    end

    assert_match(/Sign Up For Free/, signup_link.text)

    signup_link.click

    form_title = @wait.until do
      element = @browser.find_element(xpath: '//*[@id="regs_container"]/div/div[2]/div/div[1]/div/div/h1/span[2]')
      element if element.displayed?
    end

    assert_match(/Tell us about yourself/, form_title.text)

    @browser.find_element(id: 'firstName')
            .send_keys('First')
    @browser.find_element(id: 'lastName')
            .send_keys('Last')
    @browser.find_element(id: 'email')
            .send_keys('invalid.email')
    @browser.find_element(id: 'birthMonth')
            .click
    @browser.find_element(xpath: '//*[@id="birthMonth"]/input[1]')
            .send_keys('December', :enter)
    @browser.find_element(id: 'birthDay')
            .click
    @browser.find_element(xpath: '//*[@id="birthDay"]/input[1]')
            .send_keys('31', :enter)
    @browser.find_element(id: 'birthYear')
            .click
    @browser.find_element(xpath: '//*[@id="birthYear"]/input[1]')
            .send_keys('1992', :enter)
    @browser.find_element(id: 'genderCode')
            .click
    @browser.find_element(xpath: '//*[@id="genderCode"]/input[1]')
            .send_keys('Male', :enter)
    @browser.find_element(xpath: '//*[@id="regs_container"]/div/div[2]/div/div[2]/div/form/div[2]/a')
            .click

    email_error = @wait.until do
      element = @browser.find_element(id: 'emailError')
      element if element.displayed?
    end

    assert_match(/Enter valid email/, email_error.text)
  end

  def teardown
    @browser.quit
  end
end