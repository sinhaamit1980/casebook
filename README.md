Installing and Running tests
================================

This is a short guide to installing and running the Which? tests.  

## Clone the tests

```bash
git clone https://github.com/sinhaamit1980/whichTest.git
```

## Install RVM stable with ruby

Follow installation instructions for installing RVM here:

https://rvm.io/rvm/install
 
Once rvm is installed, we need ruby version 2.4.0, to install use the following:
 `rvm install 2.4.0`
 
Use ruby version 2.4.0 and set it as your default:
 `rvm use 2.4.0 --default`

## Installing required gems

Go to the folder root folder casebook( which contain gemfile) and run the following commands:

```bash
gem install bundler and then bundle install
```

These two commands will install all the gems that the tests need.

## Installing Chromedriver
Download Chrome Driver from following location

https://sites.google.com/a/chromium.org/chromedriver/

Download it your local folder and add that folder in your PATH

## Running the tests

##### Basic

To run the tests with the default options use the below command:

```bash
rake features
```


Note: if no `DRIVER` is passed in, the default driver will be used, which is Chrome
  

If you want to run the tests in safari

```bash
rake features DRIVER=safari
```

If you are running a test in different Environment, you can pass the base url as environment variable

 ```bash
 rake features BASE_URL= "http://---"
 ```