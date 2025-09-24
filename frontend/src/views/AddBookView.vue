<template>
  <v-container class="forma">
    <v-form ref="form" v-model="valid">
      <v-subheader class="text-center font-weight-bold display-2 naslov text-primary">Dodaj novu knjigu</v-subheader>
      <v-divider></v-divider>

      <v-row>
        <v-col>
          <v-text-field
            v-model="naslov"
            label="Naslov"
            :rules="[v => !!v || 'Naslov je obavezan']"
            outlined
            required
          ></v-text-field>

          <v-text-field
            v-model="autor"
            label="Autor"
            :rules="[v => !!v || 'Autor je obavezan']"
            outlined
            required
          ></v-text-field>

          <v-text-field
            v-model="cijena"
            label="Cijena"
            :rules="[v => !!v || 'Cijena je obavezna']"
            outlined
            required
          ></v-text-field>

          <v-text-field
            v-model="slika"
            label="URL slike"
            :rules="[v => !!v || 'URL slike je obavezan']"
            outlined
            required
          ></v-text-field>
        </v-col>
      </v-row>  

      <v-row>
        <v-col cols="12" lg="3">
          <v-btn @click="submitBook" color="primary" dark large class="submit-btn">
          Dodaj knjigu
        </v-btn>
        </v-col>
        <v-col cols="12" lg="9">
          <v-alert 
            type="success"
            v-model="successAlert" 
            dismissible>
            Uspješno ste dodali novu knjigu!
          </v-alert>
        </v-col>
      </v-row>
    </v-form>
  </v-container>
</template>

<script>
export default {
  name: 'AddBookView',
  data() {
    return {
      valid: false,
      naslov: '',
      autor: '',
      slika: '',
      cijena: '',
      successAlert: false
    };
  },
  methods: {
    submitBook() {
      if (this.$refs.form.validate()) {
        const bookData = {
          naslov: this.naslov,
          autor: this.autor,
          slika: this.slika,
          cijena: this.cijena,
        };

        this.axios.post('http://localhost:3000/knjige/dodaj', bookData)
          .then(() => {
            this.clearForm();
            this.successAlert = true;
          })
          .catch(error => {
            console.error('Došlo je do greške prilikom dodavanja knjige:', error);
          });
      }
    },
    clearForm() {
      this.naslov = '';
      this.autor = '';
      this.slika = '';
      this.cijena = '';
    }
  }
};
</script>

<style scoped>
.forma {
  max-width: 70%;
  margin: 50px auto;
  padding: 40px;
  background-color: rgba(255, 255, 255, 0.9);
  border-radius: 10px;
  box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.3);
}

.submit-btn {
  margin-top: 20px;
  background-color: #3F51B5;
  font-weight: bold;
}

.v-text-field,
.v-textarea {
  margin-bottom: 20px;
}

.v-btn {
  border-radius: 8px;
}
</style>
