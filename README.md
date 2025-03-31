# IUCNRedListRb

![324493713-8cba43f2-09a4-44ad-b6ce-128e84208884](https://github.com/user-attachments/assets/adb277f8-14a5-42d6-86ab-9b51298617af)

The [International Union for Conservation of
Nature’s](https://www.iucn.org) [Red List of Threatened
Species](https://www.iucnredlist.org) has evolved to become the world’s
most comprehensive information source on the global conservation status
of animal, fungi and plant species. It’s a critical indicator of the
health of the world’s biodiversity.

The [IUCN Red List API](https://api.iucnredlist.org) has been developed
to inform and drive biodiversity conservation and policy change -—
critical steps in protecting essential natural resources. It provides
programmatic access to data including (but limited to); population size,
habitat and ecology, trade and threats to help support informed
conservation decisions.

The iucnredlist Ruby Gem aims to serve as a client library for the Red
List API, offering the research community and other users an efficient
and user-friendly tool to access and interact with the vital data and
services provided by the IUCN Red List.

We have open sourced this Gem to promote transparency, enable
research community contributions, and drive adoption of the API. As an
official IUCN-supported library, we shall maintain synchronisation with
any API changes and updates.

## API Usage

The use of the API falls under the same [Terms of
Use](https://www.iucnredlist.org/terms/terms-of-use) as the Red List. By
requesting a token, you are agreeing to abide by the Terms of Use of the
Red List. If your token usage is found to be in breach of our terms of
use, it will be revoked. We kindly request your cooperation in ensuring
responsible and respectful usage of our services.

Please be aware that misusing your API token, such as using it for
information extraction (scraping) rather than making legitimate requests
for non-commercial purposes, may result in your token being rate limited
and/or revoked.

We are committed to maintaining a high-quality service for all users and
have implemented a rate limiting system to ensure our resources are
accessible equally to all. We actively monitor API usage to prevent
abuse. We understand that some users may have unique requirements for
making frequent calls in succession. If you find yourself in such a
situation, we kindly request that you incorporate appropriate delays
between your API calls to ensure smooth operation and prevent
overloading our system, otherwise your token may be further
rate-limited. It’s important to note that the Red List API is primarily
designed to support conservation efforts, particularly in the fields of
education and research. We may need to restrict access if the API is
being used for purposes that do not align with our mission, such as
mobile app development, inclusion in computing courses, or visualization
projects unrelated to conservation.

*Use of the Red List API for commercial purposes is strictly forbidden.
Users who wish to use Red List data for commercial purposes should
consider subscribing to [IBAT](www.ibat-alliance.org).*

### Responsible Usage

We are committed to ensuring fast and reliable access for all users of
this API. To this end, we have implemented rate limiting to maintain
service reliability for all users. Several functions within this package
have an argument called `wait_time` - we recommend setting this to
\>=0.5 seconds (default 0.5 seconds) to avoid rate limiting. If you
build your own functions from this package, we recommend you implement
an appropriate wait time in your code to avoid any such limits.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add iucnredlistrb

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install iucnredlistrb

## Usage

### Initializing a Client

The `IUCNRedListRb` Gem contains a number of functions to allow quick
access to Red List data. The examples below are some quick-start scripts
to get you familiar with a basic workflow.

Before running this code, you must first sign up to the [Red List
API](https://api.iucnredlist.org) to obtain an API token. You can view
(and cycle) your token from your [account
page](https://api.iucnredlist.org/users/edit).

Please also familiarise yourself with the [Red List API Documentation](https://api.iucnredlist.org/api-docs/index.html)

To start interacting with the IUCN Red List API, first, initialize a Client instance:

```
client = IUCNRedListRb::Client.new(api_key: 'YOUR_IUCN_RED_LIST_API_KEY')
```

### Assessments

To get data for a given assessment
```
# Returns assessment data for the Black Rhino
# https://www.iucnredlist.org/species/6557/152728945
assessment = client.assessment.find(152728945)
assessment
```

### Biogeographical Realms

To retrieve a list of all Biogeographical Realms
```
response = client.biogeographical_realms.list
response
```

To retrieve a list of all assessments for a given Biogeographical Realm
```
# e.g. all assessments with an Afrotropical (code "0") biogeographical realm
response = client.biogeographical_realms.all(0)
response
```

To retrieve a list of all assessments for a given Biogeographical Realm with some additional filtering
```
# e.g. all latest and Global assessments with an Afrotropical (code "0") biogeographical realm
response = client.biogeographical_realms.all(0, { latest: true, scope: 1 })
response
```

You can also include a progress bar and wait time (this also aplies to the "all" method on every endpoint below)
```
response = client.biogeographical_realms.all(0, { latest: true, scope: 1 }, show_progress: true, wait_time: 0.8 )
response
```

### Comprehensive Groups

To retrieve a list of all Comprehensive Groups
```
response = client.comprehensive_groups.list
response
```

To retrieve a list of all assessments for a given Comprehensive Group
```
# e.g. all assessments belonging to an Amphibian (code "amphibians") Comprehensive Group
response = client.comprehensive_groups.all("amphibians")
response
```

To retrieve a list of all assessments for a given Comprehensive Group with some additional filtering
```
# e.g. all assessments belonging to an Amphibian (code "amphibians") Comprehensive Group
response = client.comprehensive_groups.all("amphibians", { latest: true, scope: 1 })
response
```


### Conservation Actions

To retrieve a list of all Conservation Actions
```
response = client.conservation_actions.list
response
```

### Countries

To retrieve a list of all Countries
```
response = client.countries.list
response
```

### FAOs

To retrieve a list of all FAOs
```
response = client.faos.list
response
```

### Growth Forms

To retrieve a list of all Growth Forms
```
response = client.growth_forms.list
response
```

### Habitats

To retrieve a list of all Habitats
```
response = client.habitats.list
response
```

### Population Trends

To retrieve a list of all Population Trends
```
response = client.population_trends.list
response
```

### Red List Categories

To retrieve a list of all Red List Categories
```
response = client.red_list_categories.list
response
```

### Research

To retrieve a list of all Research
```
response = client.research.list
response
```

### Scopes

To retrieve a list of all Scopes
```
response = client.scopes.list
response
```

### Stresses

To retrieve a list of all Stresses
```
response = client.stresses.list
response
```

### Systems

To retrieve a list of all Systems
```
response = client.systems.list
response
```

### Threats

To retrieve a list of all Threats
```
response = client.threats.list
response
```

### Use and Trade

To retrieve a list of all Use and Trade
```
response = client.use_and_trade.list
response
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/IUCN-UK/iucnredlistrb. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/IUCN-UK/iucnredlistrb/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Iucnredlistrb project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/IUCN-UK/iucnredlistrb/blob/main/CODE_OF_CONDUCT.md).
