# hari

**jordiprats/eyp-hari**: [![Build Status](https://travis-ci.org/jordiprats/eyp-hari.png?branch=master)](https://travis-ci.org/jordiprats/eyp-hari)


#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
    * [What hari affects](#what-hari-affects)
    * [Beginning with hari](#beginning-with-hari)
4. [Usage](#usage)
5. [Reference](#reference)
5. [Limitations](#limitations)
6. [Development](#development)

## Overview

Hello World puppet module *on asteroids*

## Module Description

module to be able to create files on a system using a given content or using
a concat resource

## Setup

### What hari affects

* creates files on specified locations

### Beginning with hari

basic usage:

```puppet
class { 'hari': }
```

This creates a file **/.hari** (**0400** mode) with the following contents:

```
HARi was HERE
```

## Usage

### create a file

```puppet
class { 'hari':
  file    => '/hello.world.txt',
  content => 'hello world',
}
```

### create additional files

```puppet
hari::file { '/.hari.file1':
  content => 'hello world',
}

hari::file { '/.hari.file2':
  content => 'hello world',
}
```

### create additional files using concat

```puppet
hari::concatfile { 'hari3':
  file => '/.hari.file3',
}

hari::concatfile { 'hari4':
  file => '/.hari.file4',
}

hari::concatfile_fragment { 'base hari3':
  file => '/.hari.file3'
}

hari::concatfile_fragment { 'base hari4':
  file => '/.hari.file4',
}

hari::concatfile_fragment { 'extra hari 3':
  file => '/.hari.file3',
  content => 'someone else was HERE',
  fragment_name => 'extra',
}

hari::concatfile_fragment { 'extra hari 4':
  file => '/.hari.file4',
  content => 'someone else that wasnt HERE',
  fragment_name => 'extra',
}
```

## Reference

### classes

#### hari

* **file**: file (string) or files path(array), if set to undef, does not create any file (default: /.hari)
* **content**: file contents (default: HARi was HERE)
* **mode**: file mode (default: 0400)

### defines

#### hari::file

* **file**: file path (default: resource's name)
* **content**: file content (default: HARi was HERE)
* **mode**: file mode (default: 0400)

#### hari::concatfile

* **file**: file path (default: resource's name)
* **mode**: file mode (default: 0400)

#### hari::concatfile_fragment

* **file**: file path (default: resource's name)
* **content**: file contents (default: HARi was HERE)
* **mode**: file mode (default: 0400)
* **fragment_name**: fragment name (default: 00)
* **order**: fragment order (default: 00)

## Limitations

Tested on:
* CentOS 6

But should work anywhere

## Development

We are pushing to have acceptance testing in place, so any new feature should
have some test to check both presence and absence of any feature
