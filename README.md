# crnas

A file sharing web app that allows users to share files privatly using a key - password system. A downloader must have both the key name, and the password, to download a file.

## Installation

`shards install`
`crystal run ./src/app.cr`

## Usage

Navigate your browser to 127.0.0.1:3000, you can also use `curl` to upload and download files.

`curl -F "password=123" -F "file@=/path/to/file" http://localhost:3000/upload`

`curl -F "storename=0c7e02f7-c9b7-4f9e-97f0-276d47acd7ef"-F "password=123" http://localhost:3000/download`
or
`curl -F "password=123" http://localhost:3000/download/0c7e02f7-c9b7-4f9e-97f0-276d47acd7ef`

## Development

Fork it or something idc

## Contributing

1. Fork it ( https://github.com/[your-github-name]/crnas/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [redcodefinal](https://github.com/redcodefinal) Ian Rash - creator, maintainer
