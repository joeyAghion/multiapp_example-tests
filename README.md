This is an example test suite accompanying the [Testing Multiple Applications](http://artsy.github.io/blog/2014/05/12/testing-multiple-applications/) blog post. You'll find more detail there.

Set-up
---

Install dependencies:

    bundle install

Check out latest versions of the [API](https://github.com/joeyAghion/multiapp_example-api) and [web](https://github.com/joeyAghion/multiapp_example-web) repositories and install _their_ dependencies:

    bundle exec rake checkout install

Launch the tests:

    bundle exec rspec

You'll need the usual prerequisites for Ruby, Selenium, and Node.

&copy; Joey Aghion, [Artsy](https://artsy.net)

License
---

The MIT License (MIT)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
