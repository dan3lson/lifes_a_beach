# Life's a Beach

**Life's a Beach** is an app where people can find and review beaches. Technologies we used include:

- Ruby on Rails
- Javascript, jQuery, AJAX
- Carrierwave
- Bootstrap
- Devise
- Kanimari

## Table of Contents

1. [Download](#download)
1. [Installation](#installation)
1. [Usage](#usage)
1. [Demo](#demo)
1. [Contributors](#contributors)
1. [Contributing](#contributing)
1. [License](#license)

## Download

- [Latest Version](https://github.com/dan3lson/lifes_a_beach/archive/master.zip)

## Installation

### Rails

You'll need an [Amazon Web Services](https://portal.aws.amazon.com/gp/aws/developer/registration/index.html) account to store image attachments. Once you have your AWS secret keys, create a `.env` file in the root directory, and add your AWS secret keys:

```
S3_ACCESS_KEY=<YOUR_ACCESS_KEY>
S3_SECRET_KEY=<YOUR_SECRET_KEY>
S3_BUCKET=<YOUR_S3_BUCKET>
```

In your terminal, run:

```
rake db:create
rake db:migrate
```

### Usage

In your terminal, run:

```
rails server
```

In your browser, visit:

```
localhost:3000
```

Guests can view beaches and reviews whereas registered users can add new beaches, submit reviews, and upvote / downvote reviews.

**[Back to top](#table-of-contents)**

## View Live Website

- [Life's a Beach](http://lifesabeach.herokuapp.com)

**[Back to top](#table-of-contents)**

## Contributors

Core contributors for this project are:
- [dan3lson](https://github.com/dan3lson)
- [thomascchen](https://github.com/thomascchen)
- [brea9482](https://github.com/brea9482)
- [jford8820](https://github.com/jford8820)

## Contributing

Open an issue first to discuss potential changes/additions.

**[Back to top](#table-of-contents)**

## License

#### (The MIT License)

Copyright (c) 2015 Bill Gooch

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
        distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

        The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

        THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
        EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
        IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
        TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

**[Back to top](#table-of-contents)**
