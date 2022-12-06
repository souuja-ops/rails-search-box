
import React from "react"
import { InstantSearch, Highlight, SearchBox, Hits } from 'react-instantsearch-dom';
import { instantMeiliSearch } from '@meilisearch/instant-meilisearch';

const searchClient = instantMeiliSearch(
  "http://127.0.0.1:7700", // Your Meilisearch host
  "" // Your Meilisearch API key, if you have set one
);

const App = () => (
  <InstantSearch
    indexName="Post" // Change your index name here
    searchClient={searchClient}
  >
    <SearchBox />
    <Hits hitComponent={Hit} />
  </InstantSearch>
);

const Hit = ({ hit }) => <Highlight attribute="title" hit={hit} />

export default App