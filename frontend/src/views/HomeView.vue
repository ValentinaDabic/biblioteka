<template>
  <div class="home">
    <v-row>
      <v-col cols="12">
        <v-container class="text-center">
          <h2 class="title-text">Najnovije</h2>
        </v-container>
      </v-col>
      <v-col v-for="book in latestBooks" :key="book.id" cols="12" sm="6" md="3">
        <BookCardComponent 
          :naslov="book.naslov" 
          :autor="book.autor" 
          :cijena="book.cijena" 
          :slika="book.slika"
        />
      </v-col>
    </v-row>

    <v-row>
      <v-col cols="12">
        <v-container class="text-center">
          <h2 class="title-text">Popularno</h2>
        </v-container>
      </v-col>
      <v-col v-for="book in popularBooks" :key="book.id" cols="12" sm="6" md="3">
        <BookCardComponent 
          :naslov="book.naslov" 
          :autor="book.autor" 
          :cijena="book.cijena" 
          :slika="book.slika"
        />
      </v-col>
    </v-row>

    <v-row>
      <v-col cols="12">
        <v-container class="text-center">
          <h2 class="title-text">Preporučujemo</h2>
        </v-container>
      </v-col>
      <v-col v-for="book in recommendedBooks" :key="book.id" cols="12" sm="6" md="3">
        <BookCardComponent 
          :naslov="book.naslov" 
          :autor="book.autor" 
          :cijena="book.cijena" 
          :slika="book.slika"
        />
      </v-col>
    </v-row>
  </div>
</template>

<script>
import axios from 'axios';
import BookCardComponent from '../components/BookCardComponent.vue';

export default {
  name: 'HomeView',
  components: {
    BookCardComponent
  },
  data() {
    return {
      latestBooks: [],
      popularBooks: [],
      recommendedBooks: []
    };
  },
  methods: {
    getBooks() {
      const api = "http://localhost:3000/knjige/dohvati";
      axios
        .get(api)
        .then((response) => {
          this.latestBooks = response.data.slice(0, 4); 
          this.popularBooks = response.data.slice(4, 8); 
          this.recommendedBooks = response.data.slice(8, 12); 
        })
        .catch((error) => {
          console.error("There was an error fetching the books:", error);
        });
    }
  },
  mounted() {
    this.getBooks();
  }
};
</script>

<style scoped>
.title-text {
  font-size: 32px;
  font-weight: bold;
  text-transform: uppercase;
  position: relative;
  display: inline-block;
}

.title-text::before,
.title-text::after {
  content: "";
  position: absolute;
  width: 50px;
  height: 2px;
  background-color: #F4511E;
  top: 50%;
}

.title-text::before {
  left: -70px;
}

.title-text::after {
  right: -70px;
}
</style>
