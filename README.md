# hyper

[![Master Branch Build Status](https://img.shields.io/travis/elpete/hyper/master.svg?style=flat-square&label=master)](https://travis-ci.org/elpete/hyper)

## A CFML HTTP Builder

### Inspiration

Hyper was built after coding several API SDK's for various platforms — [S3SDK](https://github.com/coldbox-modules/s3sdk), [cbstripe](https://github.com/coldbox-modules/cbox-stripe), and [cbgithub](https://github.com/elpete/cbgithub), to name a few.  I noticed that I spent a lot of time setting up the plumbing for the requests and a wrapper around `cfhttp`.  Each implementation was mostly the same but slightly different. It was additionally frustrating because I really only needed to tweak a few values, usually just the `Authorization` header.  It would be nice to create an HTTP client pre-configured for each of these SDK's.  It seemed the perfect fit for a module.

