Rails Api Version Of Earthquake Counter
===========================

##Description
Earthquake counter will return n number of earthquakes within a givin timeframe closed to Los Angeles with the earliest occurrences up to the number supplied.
It is designed as an api that will return a json structured list of earthquakes that fit the criteria from an imported 
csv file.

## Getting Started

1. Clone the repo

   ```
   https://github.com/gerbdla/earthquake.git
   $ cd earthquakes
   ```

2. Install dependencies

   ```
   $ bundle install
   ```

3. Create the test db
    ```
    $ rake db:create RAILS_ENV=test
    ```

4. Seed the test db
    ```
    $ rake db:seed RAILS_ENV=test
    ```


5. Watch the specs pass

   ```
   $ bin/rspec
   ... 0 failures
   ```
