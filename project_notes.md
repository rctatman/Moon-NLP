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
- [x] Add names from Wikipedia
- [x] Add farmer's almanac names
- [x] Add English/UK names (some are anchored on solar events)
- [] Finish filling out blanks in moon_synonyms for almanac names
- [] Figure out what to do about moon names that are tied to solar events & not Julian calander (e.g. first moon after Yule)
- [] Detect duplicates
- [] Pick programming langauge (R + Shiny? Python + Flask? Look at what other libraries are using.)
- [] Create text input interface
- [] Find library for getting full moon dates
- [] (Fuzzy? Exact?) match iput text to specific moon name
- [] Moon name to date (next full one) 
- [] Return date & source


# Notes on sources in moon_synoyms.tsv
- "Beard, Wikipedia" Beard 1918 guide for the boyscouts as extracted on [the Wikipedia page for the full moon](https://en.wikipedia.org/wiki/Full_moon)
- "Almanac" Names provided by the Farmer's almanac on their page "Full Moon Names for 2022" https://www.almanac.com/full-moon-names
- "UCL" names provdied by Stephen Boyle at the UCL Observatory https://www.ucl.ac.uk/~ucapsj0/moon/index.html