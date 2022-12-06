# Realtime Search box Using Rails

A Ruby on Rails application for searching articles and indexing and providing statistics of these searches and theirs results.

The app aims performance and organization, so the searches are asynchronously indexed in background.

## Features

- Article search by title.
- Search statistics grouped by term.
  - Search made with the help of [Meilisearch]
- Search statistics cleaning.

## Technologies

- **Ruby 3.0.0**
- **Ruby on Rails 7**
- **PostgreSQL**
- **React**
- **Meilisearch**

## Installing and running

Clone the project:

git@github.com:souuja-ops/rails-search-box.git

```bash
cd rails-search-box
```

Update frontend dependencies with Yarn:

```bash
# Install Meilisearch
curl -L https://install.meilisearch.com | sh
```
```bash
# Launch Meilisearch
./meilisearch
```

```bash
# You will need Yarn pre-installed
yarn install
```

Update the gems:

```bash
bundle install
```

Run migrations (PostgreSQL):

```bash
# Your PostgreSQL database must exist
rails db:migrate
```

This app is made with Ruby on Rails 6 that uses webpacker and Yarn for frontend dependency management. So you can keep `webpack-dev-server` alive:

```bash
bin/webpack-dev-server
```

Run the development web server:

```bash
rails server -b 0.0.0.0 -p 3000
```
## Search indexing logic

Every search that hits the server is stored on a queue for processing. It does not matter if it is a complete or a parcial search.

So, imagine user typing:

```
1.What is 
2.What is a 
3.What is a good car?
```

At first, all these there terms are stored for the user's IP address.

But we only want keep final search terms. If we consider the example above, it would be: *What is a good car?*.

Every minute (it can be less frequent if necessary) a background cron job consumes the search queue and tries to extract the best search terms, aiming at only get final search terms. Its result is stores in DB for future visualization.

### Rule

A Search is considered as a final search and is stored in DB for statistics generation if:

- The user makes only one search.
- The user presses ENTER (or clicks the submit button).
- There are move than one search and the next search for the same user are separated by more than 3 seconds (empirically discovered).