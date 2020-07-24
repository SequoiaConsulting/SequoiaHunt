# seqhunt

Docker container with Apache, MySql 8.0, PhpMyAdmin and Php

Use docker-compose as an orchestrator. To run these containers:

```
docker-compose up -d
```

Open phpmyadmin at [http://localhost:8000](http://localhost:8000)
Open web browser at [http://localhost:8001](http://localhost:8001)

Run mysql client:

- `docker-compose exec db mysql -u root -p` 


`Rules for the event:`
    - This is a Treasure Hunt
    - Once you reach the final level, follow the order there
    - There will be clues all around the page – in the page title, html, css, image name, urls, etc.,
    - Try to break in if possible. The original code was written 11 years back and it still runs
    - All the levels were framed around Sequoia product , teams, team members, locations
    - To kick start, here is the answer to the first level. Use rainbow tables - bc9bf7bb6c4ab8d0daf374963110f4a7


Start Hunting !
