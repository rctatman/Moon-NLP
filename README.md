## Moon NLP Project

# What it is

There is a long tradition in the (Eastern?) US of naming full moons & using this lunar calander to denote the general time range  of natural events and thus when to do various garden tasks.

Each moon has a variety of names, some of which overlap. I would like a NLU system which can take in a moon name & translate it to a Gregorian calander date or span.

# MVP features
- A list of synonym moon names & sources
- A warning if a named moon may mean more than one moon
- A tool which can translate a moon name & given date into a specific date (E.g. "The last strawberry moon" on November 8, 2022 -> "June 14 2022")


# Additional features
- Include the moon phases (to start with, only use the full moon)
- Option to toggle luner month starting on new or full or half moon
- Blue moons?
- Toggle for more or less euro-centric system? (using English varients or more US varients which include indiginous names)
- Toggle between different native american naming systems (include original language)
- Use provdied location (state or USDA zone level) for auto-disambiguation


# TODOs

Data cleaning
- [x] Add names from Wikipedia
- [x] Add farmer's almanac names
- [x] Add English/UK names (some are anchored on solar events)
- [x] Finish filling out blanks in moon_synonyms for almanac names

Design decisions
- [X] Exact date ooooor.... date range? 
    - Decision: date range, return the possible gregorian clanader months
- [X] Figure out what to do about moon names that are tied to solar events & not Greg. calander (e.g. first moon after Yule)
    - Return all possible calander months
- [X] What to do about duplicates/ambiguous names (e.g. more than one moon can be the strawberry moon)
    - Return all possible calander months
- [X] What to do if mulitple moon names are provided? Return multipule dates?
    - Only ask for a single moon name
- [X] Is natural langauge the right interface for this? Should we do something different, like just a flat HTML table?
    - For me: yes, for someone else: no unless they already know the names of the moons. Solution to make it more useful is to include a table of moon names & some more information.

NER? (Note: no NER is actually going to be done in this project)
- [X] Decide: rule based or fuzzy?
    My instinct is to go with fuzzy because I can't spell but since I want to return all substring matches regex may be faster... I'll try with regex & if the usabilty is bad we can come back to SpaCy NER
- [X] Pick programming langauge (R + Shiny? Python + Flask? Look at what other libraries are using.)
    R + Shiney https://shiny.rstudio.com/gallery/datatables-options.html
    Host via Rstudio's shiny hosting service
- [X] Extract moon names using NER (maybe)
    Don't need to do unless something comes up
- [X] (Fuzzy? Exact?) match iput text to specific moon name
    Can use built in table search in shiny 

Moon name to date
- [ ] Find library for getting full moon dates
    Several in R.
- [ ] Moon name to date (next full one) 
- [ ] Return date & source

UI
- [ ] Create text input interface
- [ ] Convert date to output format


# Notes on sources in moon_synoyms.tsv
- "Beard, Wikipedia" Beard 1918 guide for the boyscouts as extracted on [the Wikipedia page for the full moon](https://en.wikipedia.org/wiki/Full_moon)
- "Almanac" Names provided by the Farmer's almanac on their page "Full Moon Names for 2022" https://www.almanac.com/full-moon-names
- "UCL" names provdied by Stephen Boyle at the UCL Observatory https://www.ucl.ac.uk/~ucapsj0/moon/index.html
- NOT INCORPERATED INTO DATA, multi-lingual moon/lunar month names https://docs.google.com/spreadsheets/d/1RtmPorWmy9_HDS2epfx9dg3-H37IZQ2-EZs9ZCb4znk/edit#gid=0 by Kevin Finity

# Mock up of interface (note: moot, we're going with a different solution)

Enter moon name here: [Corn planting]

One of these may be the moon you're looking for:
- Name: Corn-Planting, Gregorian month: June, Source: Beard Wikpedia


Enter moon name here: [Corn]

One of these may be the moon you're looking for:
- Name: Corn-Planting, Gregorian month: June, Source: Beard Wikpedia
- Name: Green Corn, Gregorian month: June, Source: Almanac
- ..... (all the other months with "corn" in the name)