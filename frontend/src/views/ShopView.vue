<template>
  <div class="home">
    <v-row class="mt-5 pb-0">
      <v-col class="mt-5 pb-0">
        <v-text-field
          v-model="searchBook"
          label="Pronađi knjigu"
          prepend-inner-icon="mdi-magnify"
          solo
          @input="filterBooks"
        ></v-text-field>
      </v-col>
    </v-row>
    <v-row v-if="filteredBooks.length">
      <v-col 
        v-for="book in paginatedBooks" 
        :key="book.id" 
        cols="12" 
        sm="6" 
        md="4"
        lg="3"
        @contextmenu.prevent="openEditModal(book)"
      >
        <BookCardComponent 
          :naslov="book.naslov" 
          :autor="book.autor" 
          :cijena="book.cijena" 
          :slika="book.slika"
        />
      </v-col>
    </v-row>

    <v-row>
      <v-col cols="12" class="mb-5">
        <v-pagination
          v-model="page"
          :length="totalPages"
          @input="updatePaginatedBooks"
          color="#F4511E"
          circle
        ></v-pagination>
      </v-col>
    </v-row>

    <v-dialog v-model="editDialog" max-width="500px">
      <v-card class="p-4">
        <v-card-title class="text-h5">Ažuriranje ili brisanje knjige</v-card-title>
        <v-card-text>
          <v-alert v-if="successMessage" type="success" dismissible>
            {{ successMessage }}
          </v-alert>
          <v-form ref="editForm" v-model="validEditForm">
            <v-text-field
              v-model="editBookData.naslov"
              label="Naslov knjige"
              :rules="[v => !!v || 'Naslov je obavezan']"
              required
            ></v-text-field>

            <v-text-field
              v-model="editBookData.autor"
              label="Autor knjige"
              :rules="[v => !!v || 'Autor je obavezan']"
              required
            ></v-text-field>

            <v-text-field
              v-model="editBookData.cijena"
              label="Cijena knjige"
              :rules="[v => !!v || 'Cijena je obavezna']"
              required
            ></v-text-field>
          </v-form>
        </v-card-text>
        <v-card-actions>
          <v-btn color="primary" @click="saveEditedBook">Spremi</v-btn>
          <v-btn color="error" @click="deleteBook">Izbriši</v-btn>
          <v-divider></v-divider>
          <v-btn color="secondary" @click="closeEditModal">Odustani</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>
import axios from 'axios';
import BookCardComponent from '../components/BookCardComponent.vue';

export default {
  name: 'ShopView',
  components: {
    BookCardComponent
  },
  mounted() {
    this.getBooks();
  },
  data() {
    return {
      books: [],
      searchBook: '',
      filteredBooks: [],
      paginatedBooks: [],
      perPage: 8,
      page: 1,
      editDialog: false,
      validEditForm: false,
      successMessage: '',
      editBookData: {
        id: '',
        naslov: '',
        autor: '',
        slika: ''
      }
    };
  },
  watch: {
    filteredBooks() {
      this.page = 1;
      this.updatePaginatedBooks();
    },
    page() {
      this.updatePaginatedBooks();
    }
  },
  computed: {
    totalPages() {
      return Math.ceil(this.filteredBooks.length / this.perPage);
    }
  },
  methods: {
    getBooks() {
      const api = "http://localhost:3000/knjige/dohvati";
      axios
        .get(api)
        .then((response) => {
          this.books = response.data;
          this.filteredBooks = this.books;
          this.updatePaginatedBooks();
        })
        .catch((error) => {
          console.error("There was an error fetching the books:", error);
        });
    },
    filterBooks() {
      const searchBookLower = this.searchBook.toLowerCase();
      this.filteredBooks = this.books.filter((book) =>
        book.naslov.toLowerCase().includes(searchBookLower)
      );
    },
    updatePaginatedBooks() {
      const start = (this.page - 1) * this.perPage;
      const end = this.page * this.perPage;
      this.paginatedBooks = this.filteredBooks.slice(start, end);
    },
    openEditModal(book) {
      this.editBookData = { ...book };
      this.editDialog = true;
      this.successMessage = '';
    },
    closeEditModal() {
      this.editDialog = false;
      this.successMessage = '';
      this.editBookData = { id: '', naslov: '', autor: '', slika: '' };
    },
    saveEditedBook() {
      if (this.$refs.editForm.validate()) {
        const api = `http://localhost:3000/knjige/uredi/${this.editBookData.id}`;
        axios
          .put(api, this.editBookData)
          .then(() => {
            this.successMessage = 'Knjiga je uspješno ažurirana!';
            setTimeout(() => {
              this.successMessage = '';
              this.editDialog = false;
            }, 2000);
            this.getBooks(); 
          })
          .catch((error) => {
            console.error('Došlo je do greške prilikom ažuriranja knjige:', error);
          });
      }
    },
    deleteBook() {
      const api = `http://localhost:3000/knjige/izbrisi/${this.editBookData.id}`;
      axios
        .delete(api)
        .then(() => {
          this.successMessage = 'Knjiga je uspješno izbrisana!';
          setTimeout(() => {
            this.successMessage = '';
            this.editDialog = false;
          }, 2000);
          this.getBooks();
        })
        .catch((error) => {
          console.error('Došlo je do greške prilikom brisanja knjige:', error);
        });
    }
  }
};
</script>