
<p align="center">
	<a href="https://github.com/tenhobi/effective_dart"><img src="https://img.shields.io/badge/style-effective_dart-40c4ff.svg" alt="Effective Dart Badge"></a>
	<a href="https://opensource.org/licenses/MIT"><img src="https://img.shields.io/badge/license-MIT-purple.svg" alt="MIT License Badge"></a>
</p>

# Status Page Dart

Use this package to consume Atlassian's Status Page API from Dart/Flutter.

Please refer to https://developer.statuspage.io for more info on the API.


## Features

Initially we support the following functionality:

- Get list of pages
- Get specific page by id
- Get list of components by page
- Get component by id by page

In the following versions we'll be adding more more functionality

## Getting started

### API Key

First, you need to get your api key, to do this, enter Status Page website and go to API info section on your profile.

From here you can start using this package but we recommend to get couple other data. 

### Page Id

On the same page, you'll find your page id, it should look something like this: 

![image](https://user-images.githubusercontent.com/8421789/149045182-6daaf2c3-75cc-45ff-ac4e-e4faf17daffe.png)


### Component Ids

Although you can get this using the package, it might be easier to get them from the web.

to do this, go to you components page and look at the url, there you'll find every component id refer to the following example:

https://manage.statuspage.io/pages/PAGE_ID/components/COMPONENT_ID/

## Usage

```dart
final statusPage = StatusPage(apiKey: 'YOUR_API_KEY');

final pages = await statusPage.pages;

final page = await statusPage.page('PAGE_ID');

final componentList = page.components;

final component = page.component('COMPONENT_ID');


```
